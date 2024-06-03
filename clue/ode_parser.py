r"""
    Module to parse .ode files into a linear system of ordinary differential equations.

    This module implements a complete parser of `.ode` files that will create the 
    corresponding dynamical system (see :class:`.clue.FODESystem`). This parser 
    allows to read initial conditions and observables right away from the file.

    This module should not be directly called in general but using the optional
    argument `"file"` in :class:`.clue.FODESystem`.

    Be default the parser used is the polynomial case::

        >>> from clue import *
        >>> FODESystem(file="models/polynomial/ProteinPhosphorylation[2].ode", read_ic=True)
        e2 [FODESystem -- 24 -- SparsePolynomial]
        >>> FODESystem(file="models/polynomial/fceri_ji.ode", read_ic=True)
        fceri_ji [FODESystem -- 374 -- SparsePolynomial]
        >>> FODESystem(file="models/polynomial/NIHMS80246_S4.ode", read_ic=True)
        NIHMS80246_S4 [FODESystem -- 227 -- SparsePolynomial]
        >>> FODESystem(file="models/polynomial/NIHMS80246_S6.ode", read_ic=True)
        NIHMS80246_S6 [FODESystem -- 33 -- SparsePolynomial]
        >>> FODESystem(file="models/polynomial/pcbi.1000364.s004.ode", read_ic=True)
        pcbi1000364s004 [FODESystem -- 17 -- SparsePolynomial]
        >>> FODESystem(file="models/polynomial/numerical/BioNetGen_CCP.ode", read_ic=True)
        BioNetGen_CCP [FODESystem -- 141 -- SparsePolynomial]
        >>> FODESystem(file="models/polynomial/WeightedLinearODE/ambassador_2000.ode", read_ic=True)
        ambassador_2000_ode [FODESystem -- 16 -- SparsePolynomial]
        >>> FODESystem(file="models/polynomial/MODEL8262229752.ode", read_ic=True)
        MODEL8262229752 [FODESystem -- 47 -- SparsePolynomial]
        >>> FODESystem(file="models/polynomial/MODEL9085850385.ode", read_ic=True)
        MODEL9085850385 [FODESystem -- 59 -- SparsePolynomial]
        >>> FODESystem(file="models/polynomial/OrderedPhosphorylation.ode", read_ic=True)
        borisov [FODESystem -- 227 -- SparsePolynomial]

    But we can also use this parser to read rational systems. We can decide using the argument 
    `"parser"` if the sympy or :class:`.rational_function.RationalFunction` case will be used::
    
        >>> FODESystem(file="models/rational/BIOMD0000000013.ode", parser="sympy", read_ic=True)
        BIOMD0000000013 [FODESystem -- 28 -- Add]
        >>> FODESystem(file="models/rational/BIOMD0000000023.ode", parser="sympy", read_ic=True)
        BIOMD0000000023 [FODESystem -- 13 -- Add]
        >>> FODESystem(file="models/rational/BIOMD0000000033.ode", parser="rational", read_ic=True)
        BIOMD0000000033 [FODESystem -- 80 -- RationalFunction]
        >>> FODESystem(file="models/rational/BIOMD0000000087.ode", parser="rational", read_ic=True)
        BIOMD0000000087 [FODESystem -- 56 -- RationalFunction]
        >>> FODESystem(file="models/rational/BIOMD0000000113.ode", parser="rational", read_ic=True)
        BIOMD0000000113 [FODESystem -- 20 -- RationalFunction]
        >>> FODESystem(file="models/rational/MODEL1502270000.ode", parser="sympy", read_ic=True)
        MODEL1502270000 [FODESystem -- 46 -- Zero]
        >>> FODESystem(file="models/rational/BIOMD0000000611.ode", parser="rational", read_ic=True)
        BIOMD0000000611 [FODESystem -- 153 -- RationalFunction]
"""

import re, sys, logging

from functools import reduce, lru_cache

sys.setrecursionlimit(10000000)

from natsort import natsorted

from sympy import QQ, parse_expr, symbols
from sympy.parsing.sympy_parser import standard_transformations, rationalize

from .numerical_domains import RR
from .rational_function import SparsePolynomial, RationalFunction, to_rational

__transformations_parser = standard_transformations + (rationalize,)

# ------------------------------------------------------------------------------


def readfile(name):
    """
    Reads a file and removes C-style comments and []-type comments
    """
    f = open(name)
    s = f.read()
    f.close()
    return bracket_comment_remover(comment_remover(s))


# ------------------------------------------------------------------------------


def comment_remover(text):
    r"""Removing C++ and C style comments"""

    # taken from https://stackoverflow.com/a/241506
    def replacer(match):
        s = match.group(0)
        if s.startswith("/"):
            return " "  # note: a space and not an empty string
        else:
            return s

    pattern = re.compile(
        r'//.*?$|/\*.*?\*/|\'(?:\\.|[^\\\'])*\'|"(?:\\.|[^\\"])*"',
        re.DOTALL | re.MULTILINE,
    )
    return re.sub(pattern, replacer, text)


def bracket_comment_remover(text):
    return re.sub(r"\[[^\[\]]*\]", "", text)


def parenthesis_comment_remover(text):
    r"""
    Method to remove special type of comments of form '("...")' or '( "..." )'.

    This type of comments appear in some models during the reading of initial conditions representing
    some type of naming for those species/parameters. These have to be removed from the parser.

    Input:

    * ``text``: the string to be processed.

    Output:

    The same string without this type of comments. The output is strip

    Examples::

        >>> from clue.ode_parser import parenthesis_comment_remover
        >>> parenthesis_comment_remover('s0 = R_tot ( "R(a1~U,a2~U,s)" )')
        's0 = R_tot'
        >>> parenthesis_comment_remover('t0 = t1 + 0.8')
        't0 = t1 + 0.8'
        >>> parenthesis_comment_remover('a = (b+3e-7)*5')
        'a = (b+3e-7)*5'
        >>> parenthesis_comment_remover('a = (b+3e-7)*5 ( "why?" )')
        'a = (b+3e-7)*5'
        >>> parenthesis_comment_remover('a = (b+3e-7)*5 ("without spaces")')
        'a = (b+3e-7)*5'
        >>> parenthesis_comment_remover('a = (b+3e-7)*5 (   "mixed spaces")')
        'a = (b+3e-7)*5'
        >>> parenthesis_comment_remover('a = (b+3e-7)*5 (   "spaces and tab"	)')
        'a = (b+3e-7)*5'
    """
    return re.sub(r"\([ \t]*\".*\"[ \t]*\)", "", text).strip()


# ------------------------------------------------------------------------------


def extract_model_name(model):
    """
    Returns the name of the model and text without enclosing "begin model ... end model"
    """
    p = re.compile(r"begin\s+model\s+(\w+)")
    m = p.search(model)
    name = m.group(1)
    model = re.sub(p, "", model)
    model = re.sub(r"end\s+model", "", model)
    return name, model


# ------------------------------------------------------------------------------


def split_in_sections(model):
    """
    Input: string with the body of *.ode presented model
    Output: dictionary from names of the sections to lists of lines in the sections
    """
    sections = dict()
    cur_section = None
    pstart = re.compile(r"begin\s+(\w+)")
    pend = re.compile(r"end\s+(\w+)")
    for l in model.split("\n"):
        if cur_section is not None:
            if pend.search(l):
                cur_section = None
                continue
            if pstart.search(l) is not None:
                raise ValueError("There are nested sections")
            sections[cur_section].append(l)
        else:
            m = pstart.search(l)
            if m is not None:
                cur_section = m.group(1)
                sections[cur_section] = []
    return sections


# ------------------------------------------------------------------------------


@lru_cache
def _var_dict(varnames, parser):
    if parser == "sympy":
        return {v: symbols(v) for v in varnames}
    elif parser in ("polynomial", "rational"):
        return {v: i for i, v in enumerate(varnames)}
    raise NotImplementedError(f"Parser {parser} not implemented")


def _parse(to_parse, varnames, parser, domain=QQ):
    r"""
    Method that decides with the argument ``parser`` how to parse an expression.

    The argument ``parser`` must be a string containing "sympy" (parsing to expressions),
    "polynomial" (parsing to :class:`clue.rational_function.SparsePolynomial`) or
    "rational" (parsing to :class:`clue.rational_function.RationalFunction`)
    """
    var_dict = _var_dict(tuple(varnames), parser)
    to_parse = to_parse.replace(
        "arbitrary", ""
    )  # removed the "arbitrary" prefix in some lines
    if parser == "sympy":
        ## doing a small pre-parse to eliminate incoherent things in the string
        to_parse = to_parse.replace("^", "**")  # changing pow syntax to python
        expr = parse_expr(to_parse, var_dict, transformations=__transformations_parser)
        if domain == RR:
            expr = expr.evalf()
        return expr
    else:
        result = RationalFunction.from_string(to_parse, varnames, domain, var_dict)
        if parser == "polynomial":
            if result.denom != 1:
                raise ValueError(
                    "Trying to parse a polynomial but found Rational function."
                )
            return result.numer
        elif parser == "rational":
            return result
    raise NotImplementedError(f"Parser {parser} not implemented")


def parse_ode(lines, varnames, parser="sympy", domain=QQ):
    """
    Input:
    Output: list of SparsePolynomial representing this ODE system
            ordered as variables in the ring
    """
    eqs_raw = dict()
    plhs = re.compile(r"d\((\w+)\)")
    for l in lines:
        if plhs.search(l):
            lhs, rhs = l.split("=")
            lhs = plhs.search(lhs).groups(1)[0]
            rhs = rhs.strip()
            eqs_raw[lhs] = rhs

    # var_to_ind = {v : i for i, v in enumerate(varnames)}
    # var_to_sym = {v : symbols(v) for v in varnames}
    eqs = dict()
    for lhs, rhs in eqs_raw.items():
        if lhs not in varnames:
            raise ValueError(f"Variable {lhs} is not in the list of variables")
        try:
            # RationalFunction.from_string(rhs, varnames, var_to_ind = var_to_ind)
            # parse_expr(rhs, var_to_sym, transformations=__transformations_parser)
            eqs[lhs] = _parse(rhs, varnames, parser, domain)
        except TypeError as e:
            print(rhs)
            print(e)

    for v in varnames:
        if v not in eqs:
            # SparsePolynomial(varnames, QQ)
            # eqs[v] = parse_expr("0", var_to_sym)
            eqs[v] = _parse("0", varnames, parser, domain)
    return [eqs[v] for v in varnames]


# ------------------------------------------------------------------------------


def extract_observables(lines, varnames, domain=QQ):
    """
    Input: lines of the partitions section
    Output: list of SparsePolynomial representing the observables
    """
    # var_to_ind = {v : i for i, v in enumerate(varnames)}
    sets = [m.groups(1)[0] for m in re.finditer(r"\{([^\{\}]*)\}", " ".join(lines))]
    observables = []
    for s in sets:
        obs_as_str = "+".join(re.split(r"\s*,\s*", s))
        obs_poly = SparsePolynomial.from_string(obs_as_str, varnames, domain)
        observables.append(obs_poly)
    return observables


# ------------------------------------------------------------------------------


def separate_reaction_rate(line):
    """
    Input: reaction line of the form: "reactants -> products, rate [name]"
    Output: strings "reactants -> products" and "rate"
    """
    openpar = 0
    closedpar = 0
    split_ind = None
    for i in range(len(line)):
        if line[i] == "(":
            openpar += 1
        if line[i] == ")":
            closedpar += 1
        if line[i] == "," and openpar == closedpar:
            split_ind = i
            break
    reaction = line[:split_ind]
    rate = line[(split_ind + 1) :]
    if re.search(r"\[.*\]", rate):
        rate = re.sub(r"\[.*\]", "", rate)
    return reaction, rate


# ------------------------------------------------------------------------------


def parse_reactions(lines, varnames, parser="sympy", domain=QQ):
    """
    Input: lines with reactions, each reaction of the form "reactants -> products, rate" and varnames
    Output: the list of corresponding equations
    """
    raw_reactions = []
    # var_to_ind = {v : i for i, v in enumerate(varnames)}
    # var_to_sym = {v : symbols(v) for v in varnames}
    var_dict = _var_dict(tuple(varnames), parser)
    for l in lines:
        if "," not in l:
            continue
        reaction, rate = separate_reaction_rate(l)
        lhs, rhs = reaction.split("->")
        raw_reactions.append((lhs.strip(), rhs.strip(), rate.strip()))

    # eqs = {v : SparsePolynomial(varnames, QQ) for v in varnames}
    # eqs = {v : RationalFunction(SparsePolynomial(varnames, QQ), SparsePolynomial.from_const(1, varnames)) for v in varnames}
    # eqs = {v : parse_expr("0", var_to_sym) for v in varnames}
    eqs = {v: _parse("0", varnames, parser, domain) for v in varnames}
    i = 0
    for lhs, rhs, rate in raw_reactions:
        logging.debug(f"Next reaction {i} out of {len(raw_reactions)}")
        i += 1
        # rate_poly = SparsePolynomial.from_string(rate, varnames, var_to_ind)
        # rate_poly = RationalFunction.from_string(rate, varnames, var_to_ind = var_to_ind)
        # rate_poly = parse_expr(rate.replace("^", "**"), var_to_sym, transformations=__transformations_parser)
        rate_poly = _parse(rate, varnames, parser, domain)
        ldict = species_to_multiset(lhs)
        rdict = species_to_multiset(rhs)
        # monomial = tuple((var_to_ind[v], mult) for v, mult in ldict.items())
        if parser == "sympy":
            monomial = reduce(
                lambda p, q: p * q, [var_dict[v] ** mult for v, mult in ldict.items()]
            )
        elif parser in ("polynomial", "rational"):
            monomial = SparsePolynomial(
                varnames,
                domain,
                {tuple((var_dict[v], mult) for v, mult in ldict.items()): domain(1)},
            )
        else:
            raise NotImplementedError(f"Parser {parser} not implemented")

        # reaction_poly = rate_poly * SparsePolynomial(varnames, QQ, {monomial : QQ(1)})
        reaction_poly = rate_poly * monomial
        for v, mult in rdict.items():
            eqs[v] += reaction_poly * mult
        for v, mult in ldict.items():
            eqs[v] += reaction_poly * (-mult)

    return [eqs[v] for v in varnames]


# ------------------------------------------------------------------------------


def species_to_multiset(sp):
    """
    Input: string containing one of the sides of the chemical reaction
    Output: dictionary from species to multiplicities
    """
    result = dict()
    for s in sp.split("+"):
        s = s.strip()
        if "*" not in s:
            mult = 1
        else:
            mult, s = s.split("*")
            mult = int(mult.strip())
            s = s.strip()

        if s in result:
            result[s] += mult
        else:
            result[s] = mult
    return result


# ------------------------------------------------------------------------------


def get_varnames(strings):
    names_set = set()
    for s in strings:
        # replace is used not to consider d in "d(X) =". As a variable
        # a bit too hacky, to be replaced
        s = s.replace("d(", "")
        new_names = re.split(r"[\s\*\+\-\(\)\(/),<>\^=\.]", s)
        # the second condition removes pieces of number in the exp notation
        new_names = filter(
            lambda v: v != "Rational"
            and v != "arbitrary"
            and v != ""
            and v[0] not in [str(i) for i in range(10)],
            new_names,
        )
        names_set.update(new_names)
    return sorted(list(names_set))


# ------------------------------------------------------------------------------


def parse_initial_conditions(lines, domain=QQ, prev_ic=None):
    r"""
    Method that process the initial conditions from an .ode file

    This method reads and process the initial values for a list of parameters or variables of a system
    defined in a .ode file. It takes one value per line and, in case there is a '=', we process the initial value
    (if possible).

    INPUT:

    * ``lines``: list of strings with the lines defining the parameters or initial values. It supports arithmetic operations on the lines.
    * ``domain``: domain where the initial values will be considered. It takes the rational field as default.
    * ``prev_ic``: dictionary with previously read initial conditions that can be used in the initial conditions of ``lines``.

    OUTPUT:

    A dictionary where the keys are the name of the variables/parameters and the values are values read converted into ``domain``.

    EXAMPLES::

        >>> from clue.ode_parser import parse_initial_conditions
        >>> parse_initial_conditions([ "f = 0.50+0.5*t^2", "N = 5", "V = 1e-12*(f**5+N)/t", "L0 = (200E-9*N)*V"], prev_ic = {'t': 1})
        {'f': MPQ(1,1), 'N': MPQ(5,1), 'V': MPQ(3,500000000000), 'L0': MPQ(3,500000000000000000)}
    """
    result = dict()
    cummulated = dict(prev_ic) if prev_ic != None else dict()  # we create a copy
    for l in lines:
        if "=" in l:
            lhs, rhs = [el.strip() for el in l.split("=")]
            rhs = parenthesis_comment_remover(
                rhs
            )  # added the split("( \"") to avoid some cases with comments on style '( "..." )'
            if (
                prev_ic != None and lhs in prev_ic
            ):  # case where the value was already read in other part of the file (?)
                result[lhs] = prev_ic[lhs]
            else:
                rf = _parse(rhs, list(cummulated.keys()), "rational", domain)
                evaluated = rf.eval(**cummulated)
                if not evaluated.is_constant():
                    raise ValueError(
                        f"Expression {rhs} not completely cleared by the values in {cummulated}"
                    )
                result[lhs] = evaluated.constant_term
                cummulated[lhs] = result[lhs]
    for key in result.keys():
        if not result[key] in domain:
            result[key] = (
                to_rational(result[key])
                if (domain == QQ and isinstance(result[key], str))
                else domain(result[key])
            )
    return result


# ------------------------------------------------------------------------------


def read_system(filename, read_ic=False, parser="polynomial", domain=QQ):
    """
    Takes a name of an *.ode file, and read the ODE system together with the observables
    subs_params flag corresponds to whether use the parameter values from the parameters section
    or treat these parameters symbolically
    """
    model = readfile(filename)
    name, sections_text = extract_model_name(model)
    sections_raw = split_in_sections(sections_text)

    if "ODE" not in sections_raw and "reactions" not in sections_raw:
        raise KeyError(
            "Neither ODE nor reactions sections is found, cannot generate an ODE system"
        )

    varnames = get_varnames(
        sections_raw["ODE"] if "ODE" in sections_raw else sections_raw["reactions"]
    )
    varnames = natsorted(varnames)

    equations = None
    logging.debug("Parsing equations")
    if "ODE" in sections_raw:
        equations = parse_ode(sections_raw["ODE"], varnames, parser, domain)
    else:
        equations = parse_reactions(sections_raw["reactions"], varnames, parser, domain)

    # specializing to polynomials if possible
    # if polynomial:
    #    equations = [SparsePolynomial.from_string(str(f), varnames) for f in equations]
    # Now, the parameter ``parser`` guarantees that equations are of the correct type

    obs = (
        extract_observables(sections_raw["partition"], varnames, domain)
        if "partition" in sections_raw
        else None
    )

    ic = {}
    pars = []
    if read_ic:
        pars_ic = parse_initial_conditions(sections_raw.get("parameters", []), domain)
        ic = parse_initial_conditions(sections_raw.get("init", []), domain, pars_ic)
        pars_ic = {k: v for (k, v) in pars_ic.items() if k in varnames}
        ic = {k: v for (k, v) in ic.items() if k in varnames}
        pars = list(pars_ic.keys())
        ic.update(pars_ic)

    return {
        "name": name,
        "equations": equations,
        "observables": obs,
        "variables": varnames,
        "ic": ic,
        "pars": pars,
    }


# ------------------------------------------------------------------------------
