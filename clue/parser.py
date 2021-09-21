import re
import sys

sys.setrecursionlimit(10000000)

import sympy
from sympy.core.numbers import Rational
from sympy import QQ
from sympy.core.compatibility import exec_

from .rational_function import SparsePolynomial, RationalFunction, to_rational

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
    return re.sub('\[[^\[\]]*\]', '', text)

#------------------------------------------------------------------------------

def extract_model_name(model):
    """
    Returns the name of the model and text without enclosing "begin model ... end model"
    """
    p = re.compile("begin\s+model\s+(\w+)")
    m = p.search(model)
    name = m.group(1)
    model = re.sub(p, '', model)
    model = re.sub("end\s+model", '', model)
    return name, model

#------------------------------------------------------------------------------

def split_in_sections(model):
    """
    Input: string with the body of *.ode presented model
    Output: dictionary from names of the sections to lists of lines in the sections
    """
    sections = dict()
    cur_section = None
    pstart = re.compile("begin\s+(\w+)")
    pend = re.compile("end\s+(\w+)")
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

def parse_ode(lines, varnames):
    """
    Input: 
    Output: list of SparsePolynomial representing this ODE system
            ordered as variables in the ring
    """
    eqs_raw = dict()
    plhs = re.compile("d\((\w+)\)")
    for l in lines:
        if plhs.search(l):
            lhs, rhs = l.split("=")
            lhs = plhs.search(lhs).groups(1)[0]
            rhs = rhs.strip()
            eqs_raw[lhs] = rhs

    var_to_ind = {v : i for i, v in enumerate(varnames)}
    eqs = dict()
    for lhs, rhs in eqs_raw.items():
        if lhs not in varnames:
            raise ValueError(f"Variable {lhs} is not in the list of variables")
        try:
            eqs[lhs] = RationalFunction.from_string(rhs, varnames, var_to_ind)
        except TypeError as e:
            print(rhs)
            print(e)

    for v in varnames:
        if v not in eqs:
            eqs[v] = SparsePolynomial(varnames, QQ)
    return [eqs[v] for v in varnames]

#------------------------------------------------------------------------------

def extract_observables(lines, varnames):
    """
    Input: lines of the partitions section
    Output: list of SparsePolynomial representing the observables
    """
    var_to_ind = {v : i for i, v in enumerate(varnames)}
    sets = [m.groups(1)[0] for m in re.finditer("\{([^\{\}]*)\}", " ".join(lines))]
    observables = []
    for s in sets:
        obs_as_str = "+".join(re.split("\s*,\s*", s))
        obs_poly = SparsePolynomial.from_string(obs_as_str, varnames, var_to_ind)
        observables.append(obs_poly)
    return observables

#------------------------------------------------------------------------------

def separate_reation_rate(line):
    """
    Input: reaction line of the form: "reactants -> products, rate [name]"
    Output: strings "reactanats -> products" and "rate"
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
    if re.search('\[.*\]', rate):
        rate = re.sub('\[.*\]', '', rate)
    return reaction, rate

#------------------------------------------------------------------------------

def parse_reactions(lines, varnames):
    """
    Input: lines with reactions, each reaction of the form "reactants -> products, rate" and varnames
    Output: the list of corresponding equations
    """
    raw_reactions = []
    var_to_ind = {v : i for i, v in enumerate(varnames)}
    for l in lines:
        if "," not in l:
            continue
        reaction, rate = separate_reation_rate(l)
        lhs, rhs = reaction.split("->")
        raw_reactions.append((lhs.strip(), rhs.strip(), rate.strip()))
        
    # eqs = {v : SparsePolynomial(varnames, QQ) for v in varnames}
    eqs = {v : RationalFunction(SparsePolynomial(varnames, QQ), SparsePolynomial.from_const(1, varnames)) for v in varnames}
    for lhs, rhs, rate in raw_reactions:
        # rate_poly = SparsePolynomial.from_string(rate, varnames, var_to_ind)
        rate_poly = RationalFunction.from_string(rate, varnames, var_to_ind)
        ldict = species_to_multiset(lhs)
        rdict = species_to_multiset(rhs)
        monomial = tuple((var_to_ind[v], mult) for v, mult in ldict.items())
        reaction_poly = rate_poly * SparsePolynomial(varnames, QQ, {monomial : QQ(1)})
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
        new_names = filter(lambda v: v != 'Rational' and v != '' and v[0] not in [str(i) for i in range(10)], new_names)
        names_set.update(new_names)
    return sorted(list(names_set))

#------------------------------------------------------------------------------

def parse_initial_conditions(lines):
    result = dict()
    for l in lines:
        if "=" in l:
            rhs, lhs = l.split("=")
            result[rhs.strip()] = to_rational(lhs.strip())
    return result

#------------------------------------------------------------------------------

def read_system(filename, read_ic=False):
    """
    Takes a name of an *.ode file, and read the ODE system together with the observables
    subs_params flag corresponds to whether use the paramereter values from the parameters section 
    or treat these parameters symbolically
    """
    model = readfile(filename)
    name, sections_text = extract_model_name(model)
    sections_raw = split_in_sections(sections_text)

    if 'ODE' not in sections_raw and 'reactions' not in sections_raw:
        raise KeyError("Neither ODE nor reactions sections is found, cannot generate an ODE system")

    varnames = get_varnames(sections_raw['ODE'] if 'ODE' in sections_raw else sections_raw['reactions'])

    equations = None
    if 'ODE' in sections_raw:
        equations = parse_ode(sections_raw['ODE'], varnames)
    else:
        equations = parse_reactions(sections_raw['reactions'], varnames)

    # specializing to polynomials if possible
    if all(map(lambda f: f.is_polynomial(), equations)):
        equations = [f.get_poly() for f in equations]

    obs = extract_observables(sections_raw['partition'], varnames) if 'partition' in sections_raw else None

    ic = None
    if read_ic:
        ic = parse_initial_conditions(sections_raw.get('init', []) + sections_raw.get('parameters', []))
    return {'name' : name, 'equations' : equations, 'observables' : obs, 'variables' : varnames, 'ic' : ic}

#------------------------------------------------------------------------------
