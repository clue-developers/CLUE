import sys

import sympy
from sympy import QQ

sys.path.insert(0, "../")
sys.path.insert(0, "./")
from clue import clue
from clue.rational_function import SparsePolynomial
from clue.rational_function import RationalFunction

exprs = [
    "a * (3 * a + b) - 8.5 * (a + b)**5 - 3 * c * b * (c - a)",
    "(a + b + c**2)**5 - 3 * a + b * 17 * 19 * 0.5"
]

for e in exprs:
    parsed = sympy.parse_expr(e)
    sp = RationalFunction.from_string(e, ["a", "b", "c"]).get_poly()
    assert(sympy.simplify(parsed - sympy.parse_expr(str(sp))) == 0)
