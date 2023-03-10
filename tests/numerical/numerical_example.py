import os, pstats, signal, sys, time

SCRIPT_DIR = os.path.dirname(__file__) if __name__ != "__main__" else "./"
sys.path.insert(0, os.path.join(SCRIPT_DIR, "..", "..")) # models and clue is here
sys.path.insert(0, os.path.join(SCRIPT_DIR, "..")) # examples_data is here

from examples_data import Example, Load_Examples_Folder

examples, executed_examples = Load_Examples_Folder(SCRIPT_DIR)

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
