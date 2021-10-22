import sys
import time

sys.path.insert(0, "../")
sys.path.insert(0, "./../../")

from clue import FODESystem, SparsePolynomial

start = time.time()
system = FODESystem(file=f"BIOMD0000000023.ode", parser="sympy")
print(f"Read the model in {time.time() - start}s")
obs = SparsePolynomial.from_string("Fru", system.variables)

start = time.time()
lumped = system.lumping([obs], print_system=True, loglevel="DEBUG", method="auto_diff")
end = time.time()

print(f"The size of the original model is {system.size}")
print(f"The size of the reduced model is {lumped.size}")
print(f"Computation took {end - start} seconds")
