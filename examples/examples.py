import sys
import sympy

sys.path.insert(0, "../")
import lumper

R = sympy.polys.rings.vring(["x0", "x1", "x2"], sympy.polys.domains.QQ)

print("Example 1")
polys = [x0**2 + x1 + x2, x2, x1]
lumper.do_lumping(polys, [x0])
print("\n")

print("Example 2")
polys = [x1**2 + 4 * x1 * x2 + 4 * x2**2, x1 + 2 * x0**2, x2 - x0**2]
lumper.do_lumping(polys, [x0])
print("\n")

R = sympy.polys.rings.vring(["x0", "x1", "x2", "x3", "x4"], sympy.polys.domains.QQ)
print("Example from slide 7")
polys = [
    -x0 + x1 - 3 * x0 * x2 + 4 * x3,
    x0 - x1 - 3 * x1 * x2 + 4 * x4,
    -3 * x0 * x2 + 4 * x3 - 3 * x1 * x2 + 4 * x4,
    3 * x0 * x2 - 4 * x3,
    3 * x1 * x2 - 4 * x4
]
lumper.do_lumping(polys, [x2])
print("\n")

