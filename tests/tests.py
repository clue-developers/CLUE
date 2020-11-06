import random
import sys

import timeit
import os
import glob

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

def lump_all_models():

    tests = glob.glob('./models/uncurated_poly/*.ode')

    for test in tests:
        print(test)
        try:
            system = read_system(test)
        except:
            print("\t PARSING FAILED!")
            continue
        number_of_variables = len(system['variables'])
        print(f"\tNo. Of Variables = {number_of_variables}")
        if number_of_variables > 1000: 
            print("\tSKIPING! Too large...")
            continue
        var = list(filter(lambda v: v[0] != '[', system["variables"]))[-1]
        print(f"\tVariable: {var}")
        do_lumping(
            system["equations"],
            [SparsePolynomial.from_string(var, system["variables"])], 
            print_reduction=False
        )
        print("\tDONE!")

def lump_reducible_models():
    tests = ["./models/curated_mass_action/BIOMD0000000315.ode",
             "./models/curated_mass_action/BIOMD0000000362.ode",
             "./models/curated_mass_action/BIOMD0000000270.ode",
             "./models/curated_mass_action/BIOMD0000000335.ode",
             "./models/uncurated_mass_action/MODEL1001150000.ode",
             "./models/curated_poly/BIOMD0000000504.ode",
             "./models/curated_poly/BIOMD0000000582.ode",
             "./models/curated_poly/BIOMD0000000640.ode",
             "./models/curated_poly/BIOMD0000000314.ode",
             "./models/curated_poly/BIOMD0000000139.ode",
            #  "./models/curated_poly/BIOMD0000000581.ode",
             "./models/curated_poly/BIOMD0000000102.ode",
             "./models/curated_poly/BIOMD0000000500.ode",
             "./models/curated_poly/BIOMD0000000439.ode",
            #  "./models/curated_poly/BIOMD0000000479.ode",
             "./models/curated_poly/BIOMD0000000501.ode",
             "./models/curated_poly/BIOMD0000000227.ode",
             "./models/curated_poly/BIOMD0000000156.ode",
             "./models/curated_poly/BIOMD0000000460.ode",
             "./models/curated_poly/BIOMD0000000459.ode",
             "./models/curated_poly/BIOMD0000000069.ode",
             "./models/curated_poly/BIOMD0000000226.ode",
             "./models/curated_poly/BIOMD0000000140.ode",
            #  "./models/curated_poly/BIOMD0000000342.ode",
             "./models/curated_poly/BIOMD0000000103.ode",
             "./models/curated_poly/BIOMD0000000289.ode",
             "./models/curated_poly/BIOMD0000000447.ode"]
             # TODO: add uncurated poly tests

    for test in tests:
        print(test)
        system = read_system(test)
        # number_of_variables = len(system['variables'])
        # print(f"\tNo. Of Variables = {number_of_variables}")
        var = list(filter(lambda v: v[0] != '[', system["variables"]))[0]
        print(f"\tVariable: {var}")

        starttime = timeit.default_timer()
        do_lumping(
            system["equations"],
            [SparsePolynomial.from_string(var, system["variables"])], 
            print_reduction=False,
            discard_useless_matrices=False
        )
        time_taken_without_discarding = timeit.default_timer() - starttime
        print(f"TIME TAKEN (without discarding) = {time_taken_without_discarding}")

        starttime = timeit.default_timer()
        do_lumping(
            system["equations"],
            [SparsePolynomial.from_string(var, system["variables"])], 
            print_reduction=False,
            discard_useless_matrices=True
        )
        time_taken_with_discarding = timeit.default_timer() - starttime
        print(f"TIME TAKEN (with discarding) = {time_taken_with_discarding}")

        print(f"TIME DIFFERENCE = {time_taken_with_discarding - time_taken_without_discarding}")

        print(f"RELATIVE TIME CHANGE = {(time_taken_with_discarding - time_taken_without_discarding)/time_taken_without_discarding * 100}%")
        print("===============================================================")



if __name__ == "__main__":

    # lump_all_models()

    lump_reducible_models()

    # N = 1

    # totaltime = 0
    # for i in range(N):
    #     starttime = timeit.default_timer()

    #     print(f"TEST ITERATION {i+1}")

    #     # Example 1
    #     R = sympy.polys.rings.vring(["x0", "x1", "x2"], QQ)
    #     polys = [x0**2 + x1 + x2, x2, x1]
    #     lumping = do_lumping(polys, [x0], print_reduction=False, initial_conditions={"x0" : 1, "x1" : 2, "x2" : 5})
    #     check_lumping("Example 1", polys, lumping, 2)
    #     assert lumping["new_ic"] == [QQ(1), QQ(7)]

    #     # Example 2
    #     polys = [x1**2 + 4 * x1 * x2 + 4 * x2**2, x1 + 2 * x0**2, x2 - x0**2]
    #     lumping = do_lumping(polys, [x0], print_reduction=False)
    #     check_lumping("Example 2", polys, lumping, 2)

    #     # PP for n = 2
    #     system = read_system("e2.ode") 
    #     lumping = do_lumping(
    #             system["equations"],
    #             [SparsePolynomial.from_string("S0", system["variables"])], 
    #             print_reduction=False
    #     )
    #     check_lumping("PP for n = 2", system["equations"], lumping, 12)
        
    #     # BIOMD0000000101
    #     system = read_system("BIOMD0000000101.ode")
    #     lumping = do_lumping(
    #             system["equations"],
    #             [SparsePolynomial.from_string("RI", system["variables"])], 
    #             print_reduction=False
    #     )
    #     check_lumping("BIOMD0000000101", system["equations"], lumping, 14)

    #     # MODEL1504160000
    #     system = read_system("MODEL1504160000.ode")
    #     lumping = do_lumping(
    #             system["equations"],
    #             [SparsePolynomial.from_string("cd8_in_spleen", system["variables"])], 
    #             print_reduction=False
    #     )
    #     check_lumping("MODEL1504160000", system["equations"], lumping, 8)

    #     # MODEL9085850385
    #     system = read_system("MODEL9085850385.ode")
    #     lumping = do_lumping(
    #             system["equations"],
    #             [SparsePolynomial.from_string("PKC_minus_active_slash_PKC_minus_act_minus_raf_slash_PKC_minus_act_minus_raf_cplx", system["variables"])], 
    #             print_reduction=False
    #     )
    #     check_lumping("MODEL9085850385", system["equations"], lumping, 54)

    #     totaltime += timeit.default_timer() - starttime
    #     print("############################################")

    # print("AVERAGE TIME TAKEN:", totaltime/N)

############################################ 
