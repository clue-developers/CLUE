import sys
import time

sys.path.insert(0, "../")
sys.path.insert(0, "./../../")

from clue import FODESystem, SparsePolynomial

start = time.time()
system = FODESystem(file=f"MODEL1502270000.ode", parser="rational")
print(f"Read the model in {time.time() - start}s")
obs = SparsePolynomial.from_string("rmr", system.variables)

start = time.time()
lumped = system.lumping([obs], print_system=True, loglevel="INFO", method="auto_diff")
end = time.time()

print(f"The size of the original model is {system.size}")
print(f"The size of the reduced model is {lumped.size}")
print(f"Computation took {end - start} seconds")
