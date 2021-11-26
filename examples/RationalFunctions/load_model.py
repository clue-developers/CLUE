from sympy import QQ
from clue import parser, clue
from clue.sparse_polynomial import SparsePolynomial

system = parser.read_system("./examples/RationalFunctions/BIOMD0000000033.ode")
J = [[rf.derivative(v) for rf in system['equations']] for v in system['variables']]