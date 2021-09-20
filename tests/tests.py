import random
import sys

import sympy
import timeit
from sympy import QQ

sys.path.insert(0, "../")
sys.path.insert(0, "./")

from clue.clue import do_lumping
from clue.parser import read_system
from clue.rational_function import SparsePolynomial, RationalFunction

def eval_poly_dict(pdict, point):
    result = 0
    for m, c in pdict.items():
        to_add = c
        for i in range(len(m)):
            to_add = to_add * point[i]**m[i]
        result += to_add
    return result

def eval_rhs(rhs, point):
    if isinstance(rhs, RationalFunction):
        pdict_num = rhs.num.get_sympy_dict()
        pdict_denom = rhs.denom.get_sympy_dict()
        return eval_poly_dict(pdict_num, point)/eval_poly_dict(pdict_denom, point)
    elif isinstance(rhs, sympy.polys.fields.FracElement):
        pdict_num = rhs.numer.to_dict()
        pdict_denom = rhs.denom.to_dict()
        return eval_poly_dict(pdict_num, point)/eval_poly_dict(pdict_denom, point)
    elif isinstance(rhs, SparsePolynomial):
        pdict = rhs.get_sympy_dict()
        return eval_poly_dict(pdict, point)
    else:
        pdict = rhs.to_dict()
        return eval_poly_dict(pdict, point)


def dot_product(a, b):
    return sum([x * y for x, y in zip(a, b)])

def check_lumping(test_name, polys, lumping, correct_size=None):
    lumped_system = lumping["rhs"]
    new_vars = lumping["subspace"]
    if correct_size:
        assert(len(lumped_system) == correct_size)
        print(test_name + ": size is correct")

    specialization = [random.randint(1, 100) for _ in range(len(polys))]
    rhs_values = [eval_rhs(rhs, specialization) for rhs in polys]
    rhs_values_lumped = [dot_product(rhs_values, var) for var in new_vars]

    specialization_lumped = [dot_product(specialization, var) for var in new_vars]
    lumped_rhs_values = [eval_rhs(rhs, specialization_lumped) for rhs in lumped_system]

    assert(rhs_values_lumped == lumped_rhs_values)
    print(test_name + ": lumping is correct")
    print()

if __name__ == "__main__":

    # # Example 1 ----------------------------------------------------------------

    # # SparsePolynomial
    R = sympy.polys.rings.vring(["x0", "x1", "x2"], QQ)
    polys = [x0**2 + x1 + x2, x2, x1]
    lumping = do_lumping(polys, [x0], print_reduction=False, initial_conditions={"x0" : 1, "x1" : 2, "x2" : 5})
    check_lumping("Example 1 (SparsePolynomial)", polys, lumping, 2)
    assert lumping["new_ic"] == [QQ(1), QQ(7)]
    print("OK")

    # # RationalFunction
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
    print("OK")

    # # # Example 2 ----------------------------------------------------------------

    # # SparsePolynomial
    # polys = [x1**2 + 4 * x1 * x2 + 4 * x2**2, x1 + 2 * x0**2, x2 - x0**2]
    # lumping = do_lumping(polys, [x0], print_reduction=False)
    # check_lumping("Example 2 (SparsePolynomial)", polys, lumping, 2)

    # # RationalFunction
    # varnames = ["x0", "x1", "x2"]
    # rhs = [RationalFunction.from_string("(x1**2 + 4 * x1 * x2 + 4 * x2**2)/1", varnames),
    #        RationalFunction.from_string("(x1 + 2 * x0**2)/1", varnames),
    #        RationalFunction.from_string("(x2 - x0**2)/1", varnames)]
    # lumping = do_lumping(rhs,
    #                      [SparsePolynomial.from_string("x0", varnames)],
    #                       print_reduction=False)
    # check_lumping("Example 2 (RationalFunction)", polys, lumping, 2)

    # Actual Rational Function Example -----------------------------------------

    # varnames = ["x", "y"]
    # rhs = [RationalFunction.from_string("y/(x-y)", varnames),
    #        RationalFunction.from_string("x/(x-y)", varnames)]
    # lumping = do_lumping(rhs,
    #                      [SparsePolynomial.from_string("(x-y)", varnames)],
    #                       print_reduction=True,
    #                       initial_conditions={"x" : 1, "y" : 2 },
    #                       ignore_denoms=False)
    # check_lumping("Actual Rational Function Example", rhs, lumping, 1)

    # # SparsePolynomial Models --------------------------------------------------

    # # PP for n = 2
    # system = read_system("e2.ode") 
    # lumping = do_lumping(
    #         system["equations"],
    #         [SparsePolynomial.from_string("S0", system["variables"])], 
    #         print_reduction=False
    # )
    # check_lumping("PP for n = 2", system["equations"], lumping, 12)

    # # BIOMD0000000101
    # system = read_system("BIOMD0000000101.ode")
    # lumping = do_lumping(
    #         system["equations"],
    #         [SparsePolynomial.from_string("RI", system["variables"])], 
    #         print_reduction=False
    # )
    # check_lumping("BIOMD0000000101", system["equations"], lumping, 14)

    # # MODEL1504160000
    # system = read_system("MODEL1504160000.ode")
    # lumping = do_lumping(
    #         system["equations"],
    #         [SparsePolynomial.from_string("cd8_in_spleen", system["variables"])], 
    #         print_reduction=False
    # )
    # check_lumping("MODEL1504160000", system["equations"], lumping, 8)

    # # MODEL9085850385
    # system = read_system("MODEL9085850385.ode")
    # lumping = do_lumping(
    #         system["equations"],
    #         [SparsePolynomial.from_string("PKC_minus_active_slash_PKC_minus_act_minus_raf_slash_PKC_minus_act_minus_raf_cplx", system["variables"])], 
    #         print_reduction=False
    # )
    # check_lumping("MODEL9085850385", system["equations"], lumping, 54)

    # RationalFunction Models --------------------------------------------------

    print('\n----- THE MAIN TESTS ------------------------------------------\n')

    # N = 1
    # # BIOMD0000000033
    # system = read_system("../examples/RationalFunctions/BIOMD0000000033.ode")
    # print(len(system['variables']))
    # time = 0
    # for i in range(N):
    #     start = timeit.default_timer()
    #     lumping = do_lumping(
    #             system["equations"],
    #             [SparsePolynomial.from_string("C3GActive", system["variables"])],
    #             print_reduction=False,
    #             discard_useless_matrices=True,
    #     )
    #     time += timeit.default_timer() - start
    # print("Average Time: ", time/N)
    # check_lumping("BIOMD0000000033", system["equations"], lumping)
    

    # MODEL1502270000
    system = read_system("../examples/RationalFunctions/MODEL1502270000.ode")
    lumping = do_lumping(
            system["equations"],
            [SparsePolynomial.from_string("gmax*Kp+a", system["variables"])],
            print_reduction=False,
            discard_useless_matrices=True,
    )
    print("Lumping Size: ", len(lumping['rhs']))
    check_lumping("MODEL1502270000", system["equations"], lumping)
    lumping = do_lumping(
            system["equations"],
            [SparsePolynomial.from_string("si", system["variables"])],
            print_reduction=False,
            discard_useless_matrices=False,
    )
    print("Lumping Size: ", len(lumping['rhs']))
    check_lumping("MODEL1502270000", system["equations"], lumping)
    # print(lumping)

############################################
