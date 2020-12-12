import random
import sys

import sympy
from sympy import QQ

sys.path.insert(0, "../")
sys.path.insert(0, "./")

from clue import do_lumping
from parser import read_system
from sparse_polynomial import SparsePolynomial
from rational_function import RationalFunction

def evalp(poly, point):
    if isinstance(poly, SparsePolynomial):
        pdict = poly.get_sympy_dict()
    elif isinstance(poly, RationalFunction):
        raise NotImplementedError
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
    lumped_system = lumping["rhs"]
    new_vars = lumping["subspace"]
    assert(len(lumped_system) == correct_size)
    print(test_name + ": size is correct")

    # if isinstance(polys[0], sympy.polys.rings.PolyElement):
    #     if isinstance(lumped_system[0], sympy.polys.fields.FracElement): return
    #     specialization = [random.randint(1, 100) for _ in range(len(polys))]
    #     polys_values = [evalp(p, specialization) for p in polys]
    #     polys_values_lumped = [dot_product(polys_values, var) for var in new_vars]

    #     specialization_lumped = [dot_product(specialization, var) for var in new_vars]
    #     lumped_polys_values = [evalp(p, specialization_lumped) for p in lumped_system]

    #     assert(polys_values_lumped == lumped_polys_values)
    #     print(test_name + ": lumping is correct")

if __name__ == "__main__":

    # Example 1 ----------------------------------------------------------------

    # SparsePolynomial
    R = sympy.polys.rings.vring(["x0", "x1", "x2"], QQ)
    polys = [x0**2 + x1 + x2, x2, x1]
    lumping = do_lumping(polys, [x0], print_reduction=False, initial_conditions={"x0" : 1, "x1" : 2, "x2" : 5})
    check_lumping("Example 1 (SparsePolynomial)", polys, lumping, 2)
    assert lumping["new_ic"] == [QQ(1), QQ(7)]

    # RationalFunction
    varnames = ["x0", "x1", "x2"]
    rhs = [RationalFunction.from_string("(x0**2 + x1 + x2)/1", varnames),
           RationalFunction.from_string("x2/1", varnames),
           RationalFunction.from_string("x1/1", varnames)]
    lumping = do_lumping(rhs,
                         [SparsePolynomial.from_string("x0", varnames)],
                          print_reduction=False,
                          initial_conditions={"x0" : 1, "x1" : 2, "x2" : 5})
    check_lumping("Example 1 (RationalFunction)", polys, lumping, 2)
    assert lumping["new_ic"] == [QQ(1), QQ(7)]

    # Example 2 ----------------------------------------------------------------

    # SparsePolynomial
    polys = [x1**2 + 4 * x1 * x2 + 4 * x2**2, x1 + 2 * x0**2, x2 - x0**2]
    lumping = do_lumping(polys, [x0], print_reduction=False)
    check_lumping("Example 2 (SparsePolynomial)", polys, lumping, 2)

    # RationalFunction
    varnames = ["x0", "x1", "x2"]
    rhs = [RationalFunction.from_string("(x1**2 + 4 * x1 * x2 + 4 * x2**2)/1", varnames),
           RationalFunction.from_string("(x1 + 2 * x0**2)/1", varnames),
           RationalFunction.from_string("(x2 - x0**2)/1", varnames)]
    lumping = do_lumping(rhs,
                         [SparsePolynomial.from_string("x0", varnames)],
                          print_reduction=False)
    check_lumping("Example 2 (RationalFunction)", polys, lumping, 2)

    # Actual Rational Function Example -----------------------------------------

    varnames = ["x", "y"]
    rhs = [RationalFunction.from_string("y/(x-y)", varnames),
           RationalFunction.from_string("x/(x-y)", varnames)]
    lumping = do_lumping(rhs,
                         [SparsePolynomial.from_string("x-y", varnames)],
                          print_reduction=True,
                          initial_conditions={"x" : 1, "y" : 2 })
    print(lumping)
    # assert lumping["rhs"] == [-1]

    # # SparsePolynomial Models --------------------------------------------------

    # PP for n = 2
    system = read_system("e2.ode") 
    lumping = do_lumping(
            system["equations"],
            [SparsePolynomial.from_string("S0", system["variables"])], 
            print_reduction=False
    )
    check_lumping("PP for n = 2", system["equations"], lumping, 12)

    # BIOMD0000000101
    system = read_system("BIOMD0000000101.ode")
    lumping = do_lumping(
            system["equations"],
            [SparsePolynomial.from_string("RI", system["variables"])], 
            print_reduction=False
    )
    check_lumping("BIOMD0000000101", system["equations"], lumping, 14)

    # MODEL1504160000
    system = read_system("MODEL1504160000.ode")
    lumping = do_lumping(
            system["equations"],
            [SparsePolynomial.from_string("cd8_in_spleen", system["variables"])], 
            print_reduction=False
    )
    check_lumping("MODEL1504160000", system["equations"], lumping, 8)

    # MODEL9085850385
    system = read_system("MODEL9085850385.ode")
    lumping = do_lumping(
            system["equations"],
            [SparsePolynomial.from_string("PKC_minus_active_slash_PKC_minus_act_minus_raf_slash_PKC_minus_act_minus_raf_cplx", system["variables"])], 
            print_reduction=False
    )
    check_lumping("MODEL9085850385", system["equations"], lumping, 54)

    # RationalFunction Models --------------------------------------------------

    print('\n----- THE MAIN TEST -------------------------------------------\n')

    # BIOMD0000000033
    system = read_system("../examples/RationalFunctions/BIOMD0000000033.ode")
    lumping = do_lumping(
            system["equations"],
            [SparsePolynomial.from_string("C3GActive", system["variables"])],
            print_reduction=True
    )
    print(lumping)

############################################
