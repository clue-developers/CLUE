import sys
import time

from sympy import QQ

# sys.path.insert(0, "../")
# sys.path.insert(0, "./../../")
from clue import parser
from clue import clue
from clue.rational_function import SparsePolynomial

system = parser.read_system("toy_example.ode")
obs = SparsePolynomial.from_string("x1 + x2", system['variables'])

start = time.time()
lumped = clue.do_lumping(system['equations'], [obs], print_system=True)
end = time.time()

print(f"The size of the original model is {len(system['equations'])}")
print(f"The size of the reduced model is {len(lumped['polynomials'])}")
print(f"Computation took {end - start} seconds")
