import json, os, sys, csv

from itertools import product
from functools import lru_cache, cached_property

SCRIPT_DIR = os.path.dirname(__file__) if __name__ != "__main__" else "./"
sys.path.insert(0, os.path.join(SCRIPT_DIR, "..", "..")) # models and clue is here

import models.models_data
from clue import FODESystem

VALID_READ = ["polynomial", "rational", "sympy", "uncertain"]
VALID_MATRIX = ["polynomial", "rational", "auto_diff"]

class Example:
    #########################################################
    ### CLASS VARIABLES
    ResultExtension = ".example.txt"
    OutSystemExtension = ".clue"
    ProfileExtension = ".prf"

    #########################################################
    ### INIT METHOD
    def __init__(self, name, read, matrix, observables, **kwds):
        assert read in VALID_READ and matrix in VALID_MATRIX
        self.__name = name
        self.__read = read
        self.__matrix = matrix
        self.__observables = observables

        self.__model = kwds.pop("model", name)
        self.__range = kwds.pop("range", None)
        self.__json = kwds

    #########################################################
    ### PROPERTIES
    @property
    def name(self): return self.__name
    @property
    def read(self): return self.__read
    @property
    def matrix(self): return self.__matrix
    @property
    def observables(self): return self.__observables
    @property
    def model(self): return self.__model
    @property
    def range(self): return self.__range

    #########################################################
    ### PATH METHODS
    @cached_property
    def base_path(self):
        if self.out_folder != None:
            return os.path.join(SCRIPT_DIR, self.out_folder)
        else:
            return SCRIPT_DIR

    def base_file_name(self, read = None, matrix = None, observables = None):
        read = self.read if read is None else read
        matrix = self.matrix if matrix is None else matrix
        obs_str = "" if observables == None else f"_[obs={observables}]"
        return f"{self.name}[r={read},m={matrix}]{obs_str}"

    @lru_cache(maxsize=None)
    def out_path(self, read = None, matrix = None, observables = None):
        return os.path.join(
            self.base_path, 
            "systems", 
            f"{self.base_file_name(read,matrix,observables)}{Example.OutSystemExtension}"
        )

    @lru_cache(maxsize=None)
    def results_path(self, read = None, matrix = None):
        return os.path.join(
            self.base_path, 
            f"[result]{self.base_file_name(read, matrix)}{Example.ResultExtension}"
        )

    @lru_cache(maxsize=None)
    def profile_path(self, read = None, matrix = None):
        return os.path.join(
            self.base_path, 
            "profiles",
            f"{self.base_file_name(read, matrix)}{Example.ProfileExtension}"
        )

    def is_executed(self, read = None, matrix = None):
        return os.path.exists(self.results_path(read,matrix))

    #########################################################
    ### OTHER METHODS
    def __getattr__(self, name):
        if name in self.__json:
            return self.__json[name]

    def get_model(self):
        return models.models_data.models[self.model]
    def path_model(self):
        return self.get_model().path(self.range)

    def as_json(self):
        json = {
            "read" : self.read,
            "matrix" : self.matrix,
            "observables" : self.observables,
            **self.__json
        }
        if self.model != self.name: json["model"] = self.model
        if self.range != None: json["range"] = self.range

        return json


examples = {}
with open(os.path.join(SCRIPT_DIR,'data.json')) as f:
    data = json.load(f)
    examples = {key : Example(key, **data[key]) for key in data}

executed_examples = [
    (name,read,matrix) 
    for (name, read, matrix) in product(examples.keys(), VALID_READ, VALID_MATRIX) 
    if examples[name].is_executed(read, matrix)
]
    
def get_example(name):
    return examples[name]

############################################################
### SCRIPT METHODS
############################################################
def list_examples(*argv):
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
    read = []; matrix = []; o = None; O = None; folders = []; subs=False
    i = 0
    while i < len(argv):
        if argv[i] == "-r":
            if not argv[i+1] in ("polynomial", "rational", "sympy", "uncertain"):
                raise ValueError(f"The value for a reading algorithm must be in ('polynomial', 'rational', 'sympy', 'uncertain') (got {argv[i+1]}).")
            read.append(argv[i+1]); i+= 2
        elif argv[i] == "-m":
            if not argv[i+1] in ("polynomial", "rational", "auto_diff"):
                raise ValueError(f"The value for a reading algorithm must be in ('polynomial', 'rational', 'auto_diff') (got {argv[i+1]}).")
            matrix.append(argv[i+1]); i+= 2
        elif argv[i] == "-o":
            if o != None:
                raise ValueError("Too many 'out_folder' provided. See 'help' command for further information")
            o = argv[i+1]; i += 2
        elif argv[i] == "-O":
            if O != None:
                raise ValueError("Too many formats for observables given. See 'help' command for further information")
            if not argv[i+1] in ("first", "sum", "alone", "all"):
                raise ValueError("The observables to set by default must be one of 'first', 'sum', 'alone', 'all'")
            O = argv[i+1]; i += 2
        elif argv[i] == "-s":
            subs=True; i += 1
        else:
            folders.append(argv[i]); i+= 1

    if "uncertain" in read and any(m != "polynomial" for m in matrix):
        raise TypeError("Found an 'uncertain' approach with a method for matrices different than 'polynomial'")
    if "uncertain" in read:
        read.pop(read.index("uncertain"))
        read.append("uncertain-abs")
        read.append("uncertain-prop")

    changed = False
    for (name, model) in models.models_data.models.items():
        if model.folder() in folders: # this model must be added
            # checking we can do everything
            if ("uncertain-abs" in read or "uncertain-prop" in read) and model.type == "rational":
                raise TypeError("Found a 'rational' model and required an 'uncertain'")

            print(f"## Processing examples for model {name}".ljust(100, "."))
            system = FODESystem(file = model.path(), parser = "polynomial" if model.type == "polynomial" else "sympy")
            ## Deciding observables
            print(f"### Deciding observables (criteria {O=})")
            obs = []
            if O in ("first", "all") :
                print(f"#### Adding the first variable as observable")
                obs.append([str(system.symb_variables()[0])])
            if O in ("sum", "all"):
                print(f"#### Adding the sum of everything as observable")
                obs.append([" + ".join(system.variables)])
            if O in ("alone", "all"):
                print(f"#### Adding all variables alone as observables")
                obs.extend([[str(system.symb_variables()[i])] for i in range(0 if O == "alone" else 1, system.size)])

            print(f"### Found {len(obs)} set of observables")

            ## Deciding the range of the model (if exist)
            rng = model.range; rng = [None] if len(rng) == 0 else rng
            print(f"### {rng=} ; {read=} ; {matrix=}")
            for X in rng:
                for r in read:
                    for m in matrix:
                        # Deciding the final name of the example
                        extra = []
                        if name in examples: extra.append(r)
                        if X != None: extra.append(X)
                        extra = f"[{'#'.join(extra)}]" if len(extra) > 0 else ''
                        final_name = f"{name}{extra}"
                        # Deciding the extra arguments for the example
                        kwds = {}
                        if final_name != name: kwds["model"] = name
                        if o != None: kwds["out_folder"] = o
                        if X != None: kwds["range"] = X
                        if r == "uncertain-abs": kwds["delta"] = 2.5e-4; kwds["unc_type"] = "abs"; r = "uncertain"
                        if r == "uncertain-prop": kwds["delta"] = 0.1; kwds["unc_type"] = "prop"; r = "uncertain"
                        
                        if (not final_name in examples) or subs:
                            examples[final_name] = Example(final_name, r, m, obs, **kwds)
                            print(f"### Added the example {final_name}")
                            changed = True
            
            print(f"## Finished examples for model {name}".ljust(100, "."))
    
    if changed:
        print("## Dumping data...", end=" ")
        with open(os.path.join(SCRIPT_DIR,'data.json'), "w") as f:
            json.dump({example : examples[example].as_json() for example in examples}, f, indent = 4)
        print("Done")

def compile_results(*argv):
    if len(argv) > 0: raise TypeError("No optional arguments for command 'compile'. See ''help'' for further information")
    ## Compiling the data for executed examples
    compiled_data = {}
    for name, read, matrix in executed_examples:
        print(f"[example_data - compile] Compiling data from {name} ({read=} -- {matrix=})")
        data = {} 
        data["observables"] = {}
        try:
            with open(examples[name].results_path()) as file:
                line = file.readline()
                while line != "":
                    line = line.strip()
                    if line.startswith("==============================================="): # starting example
                        line = file.readline()
                        if line == "": raise ValueError("The result file if not well formatted") # unexpected end of file
                        line = line.strip()
                        if line.startswith("== Observables: "): # one example
                            obs_set = line.removeprefix("== Observables: ")
                            data["observables"][obs_set] = {}
                            line = file.readline()
                            while(not line.startswith("###############################################")):
                                if line == "": raise ValueError("The result file if not well formatted") # unexpected end of file
                                line = line.strip()
                                ### READING EXECUTION AND LUMPING DATA
                                if line.startswith("The size of the original model is"):
                                    data["observables"][obs_set]["size"] = int(line.removeprefix("The size of the original model is"))
                                elif line.startswith("The size of the reduced model is"):
                                    data["observables"][obs_set]["lumped"] = int(line.removeprefix("The size of the reduced model is"))
                                elif line.startswith("Computation took"):
                                    data["observables"][obs_set]["time"] = float(line.removeprefix("Computation took").removesuffix("seconds"))
                                ### READING LUMPING PROPERTIES
                                elif line.startswith("Is the lumping unweighted?"):
                                    data["observables"][obs_set]["unweighted"] = "Yes" if "True" in line else "No"
                                elif line.startswith("Is the lumping positive?"):
                                    data["observables"][obs_set]["positive"] = "Yes" if "True" in line else "No"
                                elif line.startswith("Is the lumping disjoint?"):
                                    data["observables"][obs_set]["disjoint"] = "Yes" if "True" in line else "No"
                                elif line.startswith("Is the lumping reducing?"):
                                    data["observables"][obs_set]["reducing"] = "Yes" if "True" in line else "No"
                                ### READING LUMPING TYPES
                                elif line.startswith("Is the lumping a Forward Lumping (FL)?"):
                                    data["observables"][obs_set]["FL"] = "Yes" if "True" in line else "No"
                                elif line.startswith("Is the lumping a Forward Equivalence (FE)?"):
                                    data["observables"][obs_set]["FE"] = "Yes" if "True" in line else "No"
                                elif line.startswith("Is the lumping a Robust Weighted Equivalence (RWE)?"):
                                    data["observables"][obs_set]["RWE"] = "Yes" if "True" in line else "No"
                                elif line.startswith("Has the lumping a Robust Weighted Lumping (RWE)?"):
                                    data["observables"][obs_set]["RWE_has"] = "Yes" if "True" in line else "No"
                                ### READING POSSIBLE ERRORS
                                elif line.startswith("Overflow error detected"): # an error of size in execution
                                    data["observables"][obs_set]["time"] = "Overflow error"
                                elif line.startswith("Timeout error detected: "): # an error of size in execution
                                    data["observables"][obs_set]["time"] = f">{line.removeprefix('The size of the reduced model is')}"
                                line = file.readline()
                            ### Filling fields if not given
                            # LUMPING AND EXECUTION DATA
                            if  not "size" in data["observables"][obs_set]: data["observables"][obs_set]["size"] = "oo"
                            if  not "lumped" in data["observables"][obs_set]: data["observables"][obs_set]["lumped"] = "oo"
                            if  not "time" in data["observables"][obs_set]: data["observables"][obs_set]["time"] = "oo"
                            # LUMPING PROPERTIES
                            if  not "unweighted" in data["observables"][obs_set]: data["observables"][obs_set]["unweighted"] = "Not computed"
                            if  not "positive" in data["observables"][obs_set]: data["observables"][obs_set]["positive"] = "Not computed"
                            if  not "disjoint" in data["observables"][obs_set]: data["observables"][obs_set]["disjoint"] = "Not computed"
                            if  not "reducing" in data["observables"][obs_set]: data["observables"][obs_set]["reducing"] = "Not computed"
                            # LUMPING TYPES
                            if  not "FL" in data["observables"][obs_set]: data["observables"][obs_set]["FL"] = "Not computed"
                            if  not "FE" in data["observables"][obs_set]: data["observables"][obs_set]["FE"] = "Not computed"
                            if  not "RWE" in data["observables"][obs_set]: data["observables"][obs_set]["RWE"] = "Not computed"
                            if  not "RWE_has" in data["observables"][obs_set]: data["observables"][obs_set]["RWE_has"] = "Not computed"
                            line = file.readline()
                        elif line.startswith("== END OF EXAMPLES"): # last section of the file with general information
                            line = file.readline()
                            while line != "":
                                line = line.strip()
                                if line.startswith("Time for reading the model: "):
                                    data["read_time"] = float(line.removeprefix("Time for reading the model: "))
                                elif line.startswith("Time for building matrices: "):
                                    data["matrix_time"] = float(line.removeprefix("Time for building matrices: "))
                                elif line.startswith("Total time in execution: "):
                                    data["total_time"] = float(line.removeprefix("Total time in execution: "))
                                line = file.readline()
                            if not "read_time" in data: data["read_time"] = "oo"
                            if not "matrix_time" in data: data["read_time"] = "oo"
                            if not "total_time" in data: data["read_time"] = "oo"

            compiled_data[(name, read, matrix)] = data
        except ValueError:
            print(f"[example_data - compile] ERROR {name} ({read=} -- {matrix=}): file with bad format")

    ## Writing the csv file
    print(f"[example_data - compile] Putting data into CSV file...")
    with open(os.path.join(SCRIPT_DIR, "compilation.csv"), "w") as file:
        headers= [
            "Name", "Read Alg.", "Time reading", "Matrix Alg.", "Time w/ matrices", # execution data
            "Or. size", "Lmp. size", "Time (s)", # lumping execution
            "Unweighted", "Positive", "Disjoint", "Reducing", # lumping properties
            "Is FL?", "Is FE?", "Is RWE?", "Has RWE?", # lumping types
            "Observables" # observables used
        ]
        writer = csv.writer(file, delimiter=";")
        writer.writerow(headers)
        for ((name,read,matrix),data) in compiled_data.items():
            for (obs_set, values) in data["observables"].items():
                try:
                    writer.writerow([
                        name, read, data["read_time"], matrix, data["matrix_time"],
                        values["size"], values["lumped"], values["time"], 
                        values["unweighted"], values["positive"], values["disjoint"], values["reducing"],
                        values["FL"], values["FE"], values["RWE"], values["RWE_has"],
                        obs_set
                    ])
                except KeyError:
                    print(f"[example_data - compile] ERROR - an error with a key ({name} -- {read} -- {matrix})")
        print(f"[example_data - compile] Compilation complete")

## Script area
if __name__ == "__main__":
    if len(sys.argv) > 1 and sys.argv[1] == "list":
        list_examples(*sys.argv[2:])
    elif len(sys.argv) > 1 and sys.argv[1] == "add":
        add_examples_in_folder(*sys.argv[2:])
    elif len(sys.argv) > 1 and sys.argv[1] == "compile":
        compile_results(*sys.argv[2:])
    else:
        print(
            "--------------------------------------------------------------------------------------------------------------------------\n"
            "--------------------------------------------------------------------------------------------------------------------------\n"
            "HELP FOR examples_data SCRIPT\n\n"
            "The following commands are available in this script:\n"
            "--------------------------------------------------------------------------------------------------------------------------\n"
            "\tpython3 examples_data add [-r ()]* [-m ()]* [-o ()] [-O ()] [-s] <<folder>>*\n"
            "where the options mean:\n"
            "  * -r : indicates the reading algorithm. It can be 'polynomial', 'rational', 'sympy' or 'uncertain'. Several can be given.\n"
            "  * -m : indicates the algorithm for computing the matrices. It can be 'polynomial', 'rational' or 'auto_diff. Several can be given.'\n"
            "  * -o : indicates the folder where the output of the example will be stored\n"
            "  * -s : indicates whether already existing examples should be overridden\n"
            "  * -O: indicates what observables set up for the new examples by default. It allow 'first', 'sum', 'alone' or 'all'."
            "  * <<folder>>: one or several folders that will be added to the examples using the previous arguments.\n"
            "--------------------------------------------------------------------------------------------------------------------------\n"
            "\tpython3 examples_data list [-r|-p|-u] [-of ()]* [-wf ()]* [-n ()]* [-wn ()]* [-e|-ne] [-a]\n"
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
            "\tpython3 examples_data compile\n"
            "will compile the results in the given folders into a csv with the basic data for the examples. No options are allowed.\n"
            "--------------------------------------------------------------------------------------------------------------------------\n"
            "--------------------------------------------------------------------------------------------------------------------------\n"
        )