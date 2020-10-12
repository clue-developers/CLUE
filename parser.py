import re
import sys

sys.setrecursionlimit(1000000)

import sympy
from sympy.core.numbers import Rational
from sympy import QQ
from sympy.core.compatibility import exec_

from clue import SparsePolynomial

#------------------------------------------------------------------------------

def readfile(name):
    """
    Reads a file and removes C-style comments
    """
    f = open(name)
    s = f.read()
    f.close()
    return comment_remover(s)

#------------------------------------------------------------------------------

def make_global_dict():
    global_dict = dict()
    exec_("from sympy import Symbol, Integer, Function, Rational", global_dict)
    return global_dict

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

def to_rational(s):
    """
    Input: string representing a decimal number
    Output: Rational(a, b) string for this number
    """
    denom = 1
    extra_num = ''
    if ('E' in s) or ('e' in s):
        s, exp = re.split("[Ee]", s)
        if exp[0] == "-":
            denom = 10**(int(exp[:]))
        else:
            extra_num = '0' * int(exp)

    frac = s.split(".")
    if len(frac) != 2:
        raise ValueError(f"Not a decimal number {s}")
    denom = denom * 10**(len(frac[1]))
    num = (frac[0] + frac[1] + extra_num).lstrip("0")
    num = num if num else "0"
    return f"Rational({num}, {denom})"

#------------------------------------------------------------------------------

def rationalize(s):
    """
    Takes text s as input and replaces all decimal fractions with Rational(a, b) representations
    """
    p = re.compile("(?:(?<=\W)|(?<=^))(\d+\.\d*([Ee]-?\d+)?)(?:(?=\W)|(?=^))")
    numbers = [(m.span(1), m.groups(1)) for m in re.finditer(p, s)]
    for (span, num) in numbers[::-1]:
        rat = to_rational(num[0])
        s = s[:span[0]] + rat + s[span[1]:]
    return s

#------------------------------------------------------------------------------

def extract_raw_ode(lines):
    """
    Input: list of lines from the ODE section
    Output: list of pair of strings (var, var's derivative)
    """
    eqs_raw = dict()
    plhs = re.compile("d\((\w+)\)")
    for l in lines:
        if plhs.search(l):
            lhs, rhs = l.split("=")
            lhs = plhs.search(lhs).groups(1)[0]
            rhs = rhs.strip()
            eqs_raw[lhs] = rhs
    return eqs_raw

#------------------------------------------------------------------------------

def parse_ode(eqs_raw):
    """
    Input: ODE as returned by extract_raw_ode
    Output: list of SparsePolynomial representing this ODE system
            ordered as variables in the ring
    """
    varnames = set()
    eqs_expr = dict()
    for lhs, rhs in eqs_raw.items():
        try:
            eqs_expr[lhs] = sympy.parse_expr(rhs, global_dict=make_global_dict())
        except TypeError as e:
            print(rhs)
            print(e)
        varnames.add(lhs)
        varnames = varnames.union(map(str, eqs_expr[lhs].free_symbols))

    varnames = list(varnames)
    eqs = dict()
    for lhs, rhs in eqs_expr.items():
        eqs[lhs] = SparsePolynomial.from_sympy_expr(rhs, varnames, QQ)
    for v in varnames:
        if v not in eqs:
            eqs[v] = SparsePolynomial(varnames, QQ)
    return varnames, [eqs[v] for v in varnames]

#------------------------------------------------------------------------------

def extract_observables(lines, varnames):
    """
    Input: lines of the partitions section
    Output: list of SparsePolynomial representing the observables
    """
    sets = [m.groups(1)[0] for m in re.finditer("\{([^\{\}]*)\}", " ".join(lines))]
    observables = []
    for s in sets:
        obs_as_str = "+".join(re.split("\s*,\s*", s))
        obs_expr = sympy.parse_expr(obs_as_str, global_dict=make_global_dict())
        obs_poly = SparsePolynomial.from_sympy_expr(obs_expr, varnames, QQ)
        observables.append(obs_poly)
    return observables

#------------------------------------------------------------------------------

def extract_parameters(lines):
    """
    Input: lines containing parameter values in the form "p = value",
           maybe several on the same line
    Output: list of pairs of string (param, value)
    """
    text = " ".join(lines)
    lhs_spans = [m.span() for m in re.finditer("\w+\s*=", text)]
    result = []
    for i, s in enumerate(lhs_spans):
        lhs = text[s[0]:(s[1] - 1)].strip()
        end_rhs = len(text) if (i == len(lhs_spans)  - 1) else lhs_spans[i + 1][0]
        rhs = text[s[1]:end_rhs].strip()
        result.append((lhs, rhs))
    return result

#------------------------------------------------------------------------------

def substitute_parameters(line, pvalues):
    """
    Input: line of text and list of pairs of string (param, value)
    Output: line with parameter names substituted with values
    """
    for p, val in pvalues:
        line = re.sub(f"(?:(?<=\W)|(?<=^)){p}(?:(?=\W)|(?=$))", val, line)
    return line

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

def reactions_to_equations(lines):
    """
    Input: lines with reactions, each reaction of the form "reactants -> products, rate"
    Output: list of corresponding differential equations represented as a dictionary from
            variable names to string expressions of their derivatives
    """
    raw_reactions = []
    for l in lines:
        if "," not in l:
            continue
        reaction, rate = separate_reation_rate(l)
        lhs, rhs = reaction.split("->")
        raw_reactions.append((lhs.strip(), rhs.strip(), rate.strip()))
        
    eqs = dict()
    for lhs, rhs, rate in raw_reactions:
        ldict = species_to_multiset(lhs)
        rdict = species_to_multiset(rhs)
        monomial = " * ".join([rate] + [f"{v}**{mult}" for (v, mult) in ldict.items()])
        for v, mult in ldict.items():
            if v not in eqs:
                eqs[v] = ""
            eqs[v] += f"-{mult} * {monomial}"
        for v, mult in rdict.items():
            if v not in eqs:
                eqs[v] = ""
            eqs[v] += f" + {mult} * {monomial}"
    return eqs

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

def read_system(filename, subs_params=True):
    """
    Takes a name of an *.ode file, and read the ODE system together with the observables
    subs_params flag corresponds to whether use the paramereter values from the parameters section 
    or treat these parameters symbolically
    """
    model = readfile(filename)
    name, sections_text = extract_model_name(model)
    sections_text = rationalize(sections_text)
    sections_raw = split_in_sections(sections_text)

    params = []
    if subs_params:
        params = extract_parameters(sections_raw['parameters'])

    raw_ode = None
    print(sections_raw.keys())
    if 'ODE' in sections_raw:
        raw_ode = extract_raw_ode(sections_raw['ODE'])
    elif 'reactions' in sections_raw:
        raw_ode = reactions_to_equations(sections_raw['reactions'])
    else:
        raise KeyError("Neither ODE nor reactions sections is found, cannot generate an ODE system")
    if subs_params:
        raw_ode = { lhs : substitute_parameters(rhs, params) for lhs, rhs in raw_ode.items()}
    varnames, equations = parse_ode(raw_ode)

    obs = extract_observables(sections_raw['partition'], varnames) if 'partition' in sections_raw else None
    return {'name' : name, 'equations' : equations, 'observables' : obs, 'variables' : varnames}

#------------------------------------------------------------------------------
