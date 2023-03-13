import re, sys, logging

from functools import reduce, lru_cache

sys.setrecursionlimit(10000000)

from natsort import natsorted

from sympy import QQ, parse_expr, symbols
from sympy.parsing.sympy_parser import standard_transformations, rationalize

from .rational_function import SparsePolynomial, RationalFunction, to_rational

__transformations_parser = (standard_transformations + (rationalize,))

#------------------------------------------------------------------------------

def readfile(name):
    """
    Reads a file and removes C-style comments and []-type comments
    """
    f = open(name)
    s = f.read()
    f.close()
    return bracket_comment_remover(comment_remover(s))

#------------------------------------------------------------------------------

def comment_remover(text):
    # taken from https://stackoverflow.com/a/241506
    def replacer(match):
        s = match.group(0)
        if s.startswith('/'):
            return " " # note: a space and not an empty string
        else:
            return s
    pattern = re.compile(
        r'//.*?$|/\*.*?\*/|\'(?:\\.|[^\\\'])*\'|"(?:\\.|[^\\"])*"',
        re.DOTALL | re.MULTILINE
    )
    return re.sub(pattern, replacer, text)

def bracket_comment_remover(text):
    return re.sub(r'\[[^\[\]]*\]', '', text)

#------------------------------------------------------------------------------

def extract_model_name(model):
    """
    Returns the name of the model and text without enclosing "begin model ... end model"
    """
    p = re.compile(r"begin\s+model\s+(\w+)")
    m = p.search(model)
    name = m.group(1)
    model = re.sub(p, '', model)
    model = re.sub(r"end\s+model", '', model)
    return name, model

#------------------------------------------------------------------------------

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

#------------------------------------------------------------------------------

@lru_cache
def _var_dict(varnames, parser):
    if(parser == "sympy"):
        return {v : symbols(v) for v in varnames}
    elif(parser in ("polynomial", "rational")):
        return {v : i for i, v in enumerate(varnames)}
    raise NotImplementedError(f"Parser {parser} not implemented")

def _parse(to_parse, varnames, parser, domain = QQ):
    r'''
        Method that decides with the argument ``parser`` how to parse an expression.

        The argument ``parser`` must be a string containing "sympy" (parsing to expressions),
        "polynomial" (parsing to :class:`clue.rational_function.SparsePolynomial`) or
        "rational" (parsing to :class:`clue.rational_function.RationalFunction`)
    '''
    var_dict = _var_dict(tuple(varnames), parser)
    to_parse = to_parse.replace("arbitrary", "") # removed the "arbitrary" prefix in some lines
    if(parser == "sympy"):
        ## doing a small pre-parse to eliminate incoherent things in the string
        to_parse = to_parse.replace("^", "**") # changing pow syntax to python
        return parse_expr(to_parse, var_dict, transformations=__transformations_parser)
    else:
        result = RationalFunction.from_string(to_parse, varnames, domain, var_dict)
        if(parser == "polynomial"):
            if(result.denom != 1):
                raise ValueError("Trying to parse a polynomial but found Rational function.")
            return result.numer
        elif(parser == "rational"):
            return result
    raise NotImplementedError(f"Parser {parser} not implemented")

def parse_ode(lines, varnames, parser="sympy", domain = QQ):
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

    #var_to_ind = {v : i for i, v in enumerate(varnames)}
    #var_to_sym = {v : symbols(v) for v in varnames}
    eqs = dict()
    for lhs, rhs in eqs_raw.items():
        if lhs not in varnames:
            raise ValueError(f"Variable {lhs} is not in the list of variables")
        try:
            # RationalFunction.from_string(rhs, varnames, var_to_ind = var_to_ind)
            #parse_expr(rhs, var_to_sym, transformations=__transformations_parser) 
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

#------------------------------------------------------------------------------

def extract_observables(lines, varnames, domain = QQ):
    """
    Input: lines of the partitions section
    Output: list of SparsePolynomial representing the observables
    """
    #var_to_ind = {v : i for i, v in enumerate(varnames)}
    sets = [m.groups(1)[0] for m in re.finditer(r"\{([^\{\}]*)\}", " ".join(lines))]
    observables = []
    for s in sets:
        obs_as_str = "+".join(re.split(r"\s*,\s*", s))
        obs_poly = SparsePolynomial.from_string(obs_as_str, varnames, domain)
        observables.append(obs_poly)
    return observables

#------------------------------------------------------------------------------

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
    rate = line[(split_ind + 1):]
    if re.search(r'\[.*\]', rate):
        rate = re.sub(r'\[.*\]', '', rate)
    return reaction, rate

#------------------------------------------------------------------------------

def parse_reactions(lines, varnames, parser = "sympy", domain = QQ):
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
    eqs = {v : _parse("0", varnames, parser, domain) for v in varnames}
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
        if(parser == "sympy"):
            monomial = reduce(lambda p,q : p*q, [var_dict[v]**mult for v, mult in ldict.items()])
        elif(parser in ("polynomial", "rational")):
            monomial = SparsePolynomial(varnames, domain, {tuple((var_dict[v], mult) for v, mult in ldict.items()) : domain(1)})
        else:
            raise NotImplementedError(f"Parser {parser} not implemented")
        
        # reaction_poly = rate_poly * SparsePolynomial(varnames, QQ, {monomial : QQ(1)})
        reaction_poly = rate_poly * monomial
        for v, mult in rdict.items():
            eqs[v] += reaction_poly * mult
        for v, mult in ldict.items():
            eqs[v] += reaction_poly * (-mult)

    return [eqs[v] for v in varnames]


#------------------------------------------------------------------------------

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

#------------------------------------------------------------------------------

def get_varnames(strings):
    names_set = set()
    for s in strings:
        # replace is used not to consider d in "d(X) =". As a variable
        # a bit too hacky, to be replaced
        s = s.replace("d(", "")
        new_names = re.split(r'[\s\*\+\-\(\)\(/),<>\^=\.]', s)
        # the second condition removes pieces of number in the exp notation
        new_names = filter(
                lambda v: v != 'Rational' and v != "arbitrary" and v != '' and v[0] not in [str(i) for i in range(10)], 
                new_names)
        names_set.update(new_names)
    return sorted(list(names_set))

#------------------------------------------------------------------------------

def parse_initial_conditions(lines, domain = QQ):
    result = dict()
    for l in lines:
        if "=" in l:
            rhs, lhs = l.split("=")
            result[rhs.strip()] = to_rational(lhs.strip().split(" ")[0]) if domain == QQ else domain(lhs.strip().split(" ")[0]) # added the split(" ") to avoid some cases with comments on style '( ... )'
    return result

#------------------------------------------------------------------------------

def read_system(filename, read_ic=False, parser="polynomial", domain = QQ):
    """
    Takes a name of an *.ode file, and read the ODE system together with the observables
    subs_params flag corresponds to whether use the parameter values from the parameters section 
    or treat these parameters symbolically
    """
    model = readfile(filename)
    name, sections_text = extract_model_name(model)
    sections_raw = split_in_sections(sections_text)

    if 'ODE' not in sections_raw and 'reactions' not in sections_raw:
        raise KeyError("Neither ODE nor reactions sections is found, cannot generate an ODE system")

    varnames = get_varnames(sections_raw['ODE'] if 'ODE' in sections_raw else sections_raw['reactions'])
    varnames = natsorted(varnames)

    equations = None
    logging.debug("Parsing equations")
    if 'ODE' in sections_raw:
        equations = parse_ode(sections_raw['ODE'], varnames, parser, domain)
    else:
        equations = parse_reactions(sections_raw['reactions'], varnames, parser, domain)

    # specializing to polynomials if possible
    #if polynomial:
    #    equations = [SparsePolynomial.from_string(str(f), varnames) for f in equations]
    # Now, the parameter ``parser`` guarantees that equations are of the correct type

    obs = extract_observables(sections_raw['partition'], varnames, domain) if 'partition' in sections_raw else None

    ic = {}
    if read_ic:
        ic = parse_initial_conditions(sections_raw.get('init', []) + sections_raw.get('parameters', []), domain)
    return {'name' : name, 'equations' : equations, 'observables' : obs, 'variables' : varnames, 'ic' : ic}

#------------------------------------------------------------------------------
