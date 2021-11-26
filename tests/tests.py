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
        return QQ(eval_poly_dict(pdict_num, point)) / QQ(eval_poly_dict(pdict_denom, point))
    elif isinstance(rhs, sympy.polys.fields.FracElement):
        pdict_num = rhs.numer.to_dict()
        pdict_denom = rhs.denom.to_dict()
        return QQ(eval_poly_dict(pdict_num, point)) / QQ(eval_poly_dict(pdict_denom, point))
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

    ## TODO: fix this file to fit the new structures of the module

    # # SparsePolynomial Models --------------------------------------------------

    # # PP for n = 2
    system = read_system("e2.ode") 
    lumping = do_lumping(
            system["equations"],
            [SparsePolynomial.from_string("S0", system["variables"])], 
            print_reduction=False
    )
    check_lumping("PP for n = 2", system["equations"], lumping, 12)

    # # BIOMD0000000101
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

    # # MODEL9085850385
    system = read_system("MODEL9085850385.ode")
    lumping = do_lumping(
            system["equations"],
            [SparsePolynomial.from_string("PKC_minus_active_slash_PKC_minus_act_minus_raf_slash_PKC_minus_act_minus_raf_cplx", system["variables"])], 
            print_reduction=False
    )
    check_lumping("MODEL9085850385", system["equations"], lumping, 54)

    # RationalFunction Models --------------------------------------------------

    N = 1
    # BIOMD0000000033
    system = read_system("../examples/RationalFunctions/BIOMD0000000033.ode", parser="rational")
    print(len(system['variables']))
    time = 0
    for i in range(N):
        start = timeit.default_timer()
        lumping = do_lumping(
                system["equations"],
                [SparsePolynomial.from_string("C3GActive", system["variables"])],
                print_reduction=False,
                #discard_useless_matrices=True,
        )
        time += timeit.default_timer() - start
    print("Average Time: ", time/N)
    check_lumping("BIOMD0000000033", system["equations"], lumping)
    

    # MODEL1502270000
    #system = read_system("../examples/RationalFunctions/MODEL1502270000.ode")
    #lumping = do_lumping(
    #        system["equations"],
    #        [SparsePolynomial.from_string("gmax*Kp+a", system["variables"])],
    #        print_reduction=False,
    #        discard_useless_matrices=True,
    #        loglevel='DEBUG'
    #)
    #print("Lumping Size: ", len(lumping['rhs']))
    #check_lumping("MODEL1502270000", system["equations"], lumping)
    #lumping = do_lumping(
    #        system["equations"],
    #        [SparsePolynomial.from_string("si", system["variables"])],
    #        print_reduction=False,
    #        discard_useless_matrices=False,
    #)
    #print("Lumping Size: ", len(lumping['rhs']))
    #check_lumping("MODEL1502270000", system["equations"], lumping)
    # print(lumping)

############################################
