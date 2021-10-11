import sys

import sympy
from sympy import QQ

sys.path.insert(0, "../")
sys.path.insert(0, "./")
from clue import clue
from clue.rational_function import SparsePolynomial
from clue.rational_function import RationalFunction

exprs = [
    "0.1",
    "1 / a + 1 / b",
    "1 / (1 + 1/b + 1/(c + 1 / (a + b + 1/c)))",
    "(a + b) / (1 - a + 1/ (b + c)) - 3/5 + (7 + a) / (c + 1 / b)",
    "(a + b + c**2)**5 - 3 * a + b * 17 * 19 * 0.5"
]

for e in exprs:
    parsed = sympy.parse_expr(e)
    sp = RationalFunction.from_string(e, ["a", "b", "c"])
    assert(sympy.simplify(parsed - sympy.parse_expr(str(sp))) == 0)
