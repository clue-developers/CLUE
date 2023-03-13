import os, pstats, signal, sys, time, logging

SCRIPT_DIR = os.path.dirname(__file__) if __name__ != "__main__" else "./"
sys.path.insert(0, os.path.join(SCRIPT_DIR, "..", "..")) # models and clue is here
sys.path.insert(0, os.path.join(SCRIPT_DIR, "..")) # examples_data is here

from clue import FODESystem, SparsePolynomial, SparseRowMatrix, NumericalSubspace
from clue.simulations import apply_matrix, create_figure, merge_simulations
from examples_data import Example, Load_Examples_Folder
from numpy import array, matmul
from numpy.linalg import norm
from scipy.integrate._ivp.ivp import OdeResult

examples, executed_examples = Load_Examples_Folder(SCRIPT_DIR)
logger = logging.getLogger("clue")

def get_example(name) -> Example:
    return examples[name]

class Timeout(object):
    def __init__(self, seconds):
        self.seconds = seconds
        self.old = None
    def __enter__(self):
        self.old = signal.signal(signal.SIGALRM, Timeout.alarm_handler)
        signal.alarm(self.seconds)
        return self
    def __exit__(self, type, value, traceback):
        signal.alarm(0)
        signal.signal(signal.SIGALRM, self.old)

    @staticmethod
    def alarm_handler(sgn, _):
        if(sgn == signal.SIGALRM):
            raise TimeoutError
        else:
            raise RuntimeError

############################################################
### SCRIPT METHODS
############################################################
def list_examples(*argv):
    r'''List examples in the folder. It allows several arguments.'''
    full = False
    type = ("polynomial", "uncertain", "rational", "sympy")
    allowed_folders = []; forbidden_folders = []; allowed_names = []; forbidden_names = []; executed = None
    i = 0
    ## Reading the arguments
    while i < len(argv): 
        if argv[i] in ("-r", "-p", "-u") and len(type) < 4:
            raise TypeError("The type for listing was already given. Check 'help' command for further information")
        if argv[i] == "-r":
            type = ("rational", "sympy"); i+= 1
        elif argv[i] == "-p":
            type = ("polynomial",); i+= 1
        elif argv[i] == "-u":
            type = ("uncertain",); i+= 1
        elif argv[i] == "-of":
            allowed_folders.append(argv[i+1]); i += 2
        elif argv[i] == "-wf":
            forbidden_folders.append(argv[i+1]); i += 2
        elif argv[i] == "-n":
            allowed_names.append(argv[i+1]); i += 2
        elif argv[i] == "-wn":
            forbidden_names.append(argv[i+1]); i += 2
        elif argv[i] == "-e":
            if executed != None and executed != True: raise TypeError("The command for executed tests were already given.")
            executed = True; i+= 1
        elif argv[i] == "-ne":
            if executed != None and executed != False: raise TypeError("The command for executed tests were already given.")
            executed = False; i+= 1
        elif argv[i] == "-a":
            full = True; i+= 1
        else:
            raise TypeError(f"Option {argv[i]} not recognized. Check 'help' command for further information")

    ## Creating the filtering function
    filter = lambda example: (examples[example].read in type and 
                                (len(allowed_folders) == 0 or examples[example].out_folder in allowed_folders) and
                                (len(forbidden_folders) == 0 or examples[example].out_folder not in forbidden_folders) and
                                (len(allowed_names) == 0 or any(example.startswith(name) for name in allowed_names)) and 
                                (len(forbidden_names) == 0 or all(not example.startswith(name) for name in forbidden_names)) and
                                (executed == None or any(el[0] == example for el in executed_examples) == executed)
                                )

    ## Creating the string to be printed
    if full:
        lines = [["Example name", "Read", "Out folder"]]
        get_str = lambda example : (example.name, example.read, example.out_folder)

        lines.extend([get_str(examples[name]) for name in examples if filter(name)])
        lines.append(["N.models", f"{len(lines)-1}", ""])
        n_elem = len(lines[0])
        max_length = [max(len(line[i]) if line[i] != None else 4 for line in lines) for i in range(n_elem)]

        lines.insert(1, [max_length[i]*"-" for i in range(n_elem)])
        lines.insert(len(lines)-1, [max_length[i]*"-" for i in range(n_elem)])

        for line in lines:
            print(" | ".join([(line[i] if line[i] != None else "None").ljust(max_length[i]) for i in range(n_elem)]))
    else:
        print(" ".join([name for name in examples if filter(name)]))

def add_examples_in_folder(*argv):
    r'''Add bunch of examples to be executed. It allows several arguments'''
    if len(argv) > 0: raise TypeError("No optional arguments for command 'compile'. See ''help'' for further information")
    return

def compile_results(*argv):
    r'''Method to compile the results on the examples.'''
    if len(argv) > 0: raise TypeError("No optional arguments for command 'compile'. See ''help'' for further information")
    return

def run_exact(*argv):
    r'''Method that run the exact experiment over an example'''
    nargv = len(argv)
    if(nargv == 0):
        print("ERROR: this script must be run with at least one argument for the name of the model")
        print_help()
        return
    
    ## Getting the arguments for running the example
    example = get_example(argv[0])
    read = example.read; matrix = example.matrix
    observables = example.observables
    timeout: int = 0
    output = None
    profile: bool = None
    percentage_slope: float | list[float] = example.get("slopes", None)
    num_points: int = 50
    threshold: float = 1e-6
    type_input = example.get("type_input", "slope-brute")
    t0: float = example.get("t0", 0.0); t1: float = example.get("t1", 1.0); x0 = None; tstep: float = None

    ## Checking the rest of the arguments
    n = 1
    try:
        while(n < nargv  and argv[n].startswith("-")):
            if argv[n] == "-r":
                read = argv[n+1]; n += 2
            elif argv[n]  == "-m":
                matrix = argv[n+1]; n += 2
            elif argv[n] == "-t":
                try:
                    timeout = int(argv[n+1]); n += 2
                except ValueError:
                    print(f"ERROR: the timeout argument must be an integer, but found {argv[n+1]}")
                    return
            elif argv[n] == "-o":
                output = argv[n+1]; n += 2
            elif argv[n] == "-p":
                profile = True; n += 1
            elif argv[n] == "-s": # percentage slope
                try:
                    new_s = float(argv[n+1])
                except ValueError:
                    print(f"ERROR: the slope argument must be a float, but found {argv[n+1]}")
                    return
                if percentage_slope == None:
                    percentage_slope = []
                percentage_slope.append(new_s); n+=2
            elif argv[n] == "-sample":
                try:
                    num_points = int(argv[n+1]); n+=2
                except ValueError:
                    print(f"ERROR: the number of samples argument must be an integer, but found {argv[n+1]}")
                    return
            elif argv[n] == "-th":
                try:
                    threshold = float(argv[n+1]); n+=2
                except ValueError:
                    print(f"ERROR: the threshold argument must be a float, but found {argv[n+1]}")
                    return
            elif argv[n] == "-i":
                if not argv[n+1] in ("slope-brute", "slope-precise", "epsilon"):
                    print(f"ERROR: the type of input argument must be one of ['slope-brute','slope-precise','epsilon'], but found {argv[n+1]}")
                    return
                type_input = argv[n+1]; n+=2
            elif argv[n] == "-t0":
                try:
                    t0 = float(argv[n+1]); n+=2
                except ValueError:
                    print(f"ERROR: the initial time argument must be a float, but found {argv[n+1]}")
                    return
            elif argv[n] == "-t1":
                try:
                    t1 = float(argv[n+1]); n+=2
                except ValueError:
                    print(f"ERROR: the ending time argument must be a float, but found {argv[n+1]}")
                    return
            elif argv[n] == "-tstep":
                try:
                    tstep = float(argv[n+1]); n+=2
                except ValueError:
                    print(f"ERROR: the time-step argument must be a float, but found {argv[n+1]}")
                    return
    except IndexError:
        print("ERROR: Invalid format of arguments. Check 'run' command in the help")
        return
    
    return

def run_perturbed(*argv):
    r'''Method to run the perturbation experiment over an example.'''
    nargv = len(argv)
    if(nargv == 0):
        print("ERROR: this script must be run with at least one argument for the name of the model")
        print_help()
        return
    return

def print_help():
    print(
        "--------------------------------------------------------------------------------------------------------------------------\n"
        "--------------------------------------------------------------------------------------------------------------------------\n"
        "HELP FOR numerical_example SCRIPT\n\n"
        "The following commands are available in this script:\n"
        "--------------------------------------------------------------------------------------------------------------------------\n"
        "\tpython3 numerical_example.py list [-r|-p|-u] [-of ()]* [-wf ()]* [-n ()]* [-wn ()]* [-e|-ne] [-a]\n"
        "will list all the available examples, where the options mean:\n"
        "  * -r : only rational examples will be shown (i.e., have 'read' either 'rational' or 'sympy').\n"
        "  * -p : only polynomial examples will be shown (i.e., have 'read' as 'polynomial')\n"
        "  * -u : only uncertain examples will be shown (i.e., have 'read' as 'uncertain')\n"
        "  * -of : only examples with given out_folder will be shown. Several of these are allowed\n"
        "  * -wf : only examples without given out_folder will be shown. Several of these are allowed\n"
        "  * -n : only examples starting with given names are shown. Several of these are allowed\n"
        "  * -wn : only examples that do not start with given names are shown. Several of these are allowed\n"
        "  * -ne : only not executed models will be returned\n"
        "  * -e : only executed models will be returned\n"
        "  * -a : a detailed description of the examples will be shown\n"
        "If no option is provided, all examples will be shown.\n"
        "--------------------------------------------------------------------------------------------------------------------------\n"
        "\tpython3 numerical_example.py add\n"
        "NOT YET IMPLEMENTED --> nothing is done\n"
        "--------------------------------------------------------------------------------------------------------------------------\n"
        "\tpython3 numerical_example.py compile\n"
        "NOT YET IMPLEMENTED --> nothing is done\n"
        "--------------------------------------------------------------------------------------------------------------------------\n"
        "\tpython3 clue_example.py exact <<example>> ????\n"
        "NOT YET IMPLEMENTED --> nothing is done\n"
        "--------------------------------------------------------------------------------------------------------------------------\n"
        "\tpython3 clue_example.py perturbed <<example>> ????\n"
        "NOT YET IMPLEMENTED --> nothing is done\n"
        "--------------------------------------------------------------------------------------------------------------------------\n"
        "--------------------------------------------------------------------------------------------------------------------------\n"
        )

if __name__ == "__main__":
    if len(sys.argv) > 1 and sys.argv[1] == "list":
        list_examples(*sys.argv[2:])
    elif len(sys.argv) > 1 and sys.argv[1] == "add":
        add_examples_in_folder(*sys.argv[2:])
    elif len(sys.argv) > 1 and sys.argv[1] == "compile":
        compile_results(*sys.argv[2:])
    elif len(sys.argv) > 1 and sys.argv[1] == "exact":
        run_exact(*sys.argv[2:])
    elif len(sys.argv) > 1 and sys.argv[1] == "perturbed":
        run_perturbed(*sys.argv[2:])
    else:
        print_help()
    sys.exit(0)
