import sys
import time

sys.path.insert(0, "../")
sys.path.insert(0, "./../../")

from clue import FODESystem, SparsePolynomial

start = time.time()
system = FODESystem(file=f"BIOMD0000000023.ode", parser="sympy")
obs = SparsePolynomial.from_string("Fru", system.variables)

start = time.time()
lumped = system.lumping([obs], print_reduction=False, loglevel="ERROR")
end = time.time()

print(f"{end - start}")
