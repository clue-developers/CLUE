import random
import sys

import sympy
from sympy import QQ

sys.path.insert(0, "../")
sys.path.insert(0, "./")
import clue
from clue import do_lumping
from parser import read_system
from sparse_polynomial import SparsePolynomial

def evalp(poly, point):
    if isinstance(poly, clue.SparsePolynomial):
        pdict = poly.get_sympy_dict()
    else:
        pdict = poly.to_dict()
    result = 0
    for m, c in pdict.items():
        to_add = c
        for i in range(len(m)):
            to_add = to_add * point[i]**m[i]
        result += to_add

    return result

def dot_product(a, b):
    return sum([x * y for x, y in zip(a, b)])

def check_lumping(test_name, polys, lumping, correct_size):
    lumped_system = lumping["polynomials"]
    new_vars = lumping["subspace"]
    assert(len(lumped_system) == correct_size)
    print(test_name + ": size is correct")

    specialization = [random.randint(1, 100) for _ in range(len(polys))]
    polys_values = [evalp(p, specialization) for p in polys]
    polys_values_lumped = [dot_product(polys_values, var) for var in new_vars]

    specialization_lumped = [dot_product(specialization, var) for var in new_vars]
    lumped_polys_values = [evalp(p, specialization_lumped) for p in lumped_system]

    assert(polys_values_lumped == lumped_polys_values)
    print(test_name + ": lumping is correct")
        
###############################################

if __name__ == "__main__":
    # Example 1
    R = sympy.polys.rings.vring(["x0", "x1", "x2"], QQ)
    polys = [x0**2 + x1 + x2, x2, x1]
    lumping = do_lumping(polys, [x0], print_reduction=False)
    check_lumping("Example 1", polys, lumping, 2)

    # Example 2
    polys = [x1**2 + 4 * x1 * x2 + 4 * x2**2, x1 + 2 * x0**2, x2 - x0**2]
    lumping = do_lumping(polys, [x0], print_reduction=False)
    check_lumping("Example 2", polys, lumping, 2)

    # PP for n = 2
    system = read_system("e2.ode") 
    lumping = do_lumping(
            system["equations"],
            [SparsePolynomial.from_string("S0", system["variables"])], 
            print_reduction=False
    )
    check_lumping("PP for n = 2", system["equations"], lumping, 12)
    
############################################ 
