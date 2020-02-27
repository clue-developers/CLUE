import sys
from sympy import QQ, sqrt, vring

sys.path.insert(0, "../")
sys.path.insert(0, "./")
import lumper


R = vring([f"x{i + 1}" for i in range(8)], QQ.algebraic_field(sqrt(2)))

polys = [
    -2 * x1 - 2 * x1 * x2 + 4 * x3 * x4,
    -2 * x2 - 2 * x1 * x2 + 4 * x3 * x4,
    -2 * x3 - 4 * x3 * x4 + 2 * x1 * x2,
    -2 * x4 - 4 * x3 * x4 + 2 * x1 * x2,
    -x5 + x1 + 2 * x2 + sqrt(2) * x6,
    -sqrt(2) * x6 + 2 * x3 + x5,
    -sqrt(2) * x7 + x1 + x8,
    -x8 + 2 * x4 + sqrt(2) * x7
]
lumper.do_lumping(polys, [x5 - sqrt(2) * x6])
print("\n")
lumper.do_lumping(polys, [x8 - sqrt(2) * x7])

