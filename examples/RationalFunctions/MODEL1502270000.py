import sys
import time

sys.path.insert(0, "../")
sys.path.insert(0, "./../../")

from clue import FODESystem, SparsePolynomial

system = FODESystem(file=f"MODEL1502270000.ode", parser="rational")
obs = SparsePolynomial.from_string("rmr", system.variables)

start = time.time()
lumped = system.lumping([obs], print_system=True, loglevel="DEBUG", method="auto_diff")
end = time.time()

print(f"The size of the original model is {system.size}")
print(f"The size of the reduced model is {lumped.size}")
print(f"Computation took {end - start} seconds")
