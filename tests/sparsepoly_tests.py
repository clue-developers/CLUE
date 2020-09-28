import sys

import sympy
from sympy import QQ

sys.path.insert(0, "../")
sys.path.insert(0, "./")
import clue
from clue import SparsePolynomial

exprs = [
    "a * (3 * a + b) - Rational(17, 2) * (a + b)**5 - 3 * c * b * (c - a)",
    "(a + b + c**2)**5 - 3 * a + b * 17 * 19 * Rational(1, 2)"
]

for e in exprs:
    parsed = sympy.parse_expr(e)
    sp = SparsePolynomial.from_sympy_expr(parsed, ["a", "b", "c"], QQ)
    assert(sympy.simplify(parsed - sympy.parse_expr(str(sp))) == 0)
