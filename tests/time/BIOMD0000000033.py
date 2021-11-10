import sys
import time

sys.path.insert(0, "../")
sys.path.insert(0, "./../../")

from clue import FODESystem, SparsePolynomial

system = FODESystem(file=f"BIOMD0000000033.ode", parser="sympy")
obs = SparsePolynomial.from_string("freeEGFReceptor", system.variables)

start = time.time()
lumped = system.lumping([obs], print_reduction=False, loglevel="ERROR")
end = time.time()
print(f"{end - start}")
