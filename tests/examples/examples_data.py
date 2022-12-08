import json, os, sys, csv

from itertools import product

sys.path.insert(0, "./../../") # models and clue is here

import models.models_data
from clue import FODESystem

VALID_READ = ["polynomial", "rational", "sympy", "uncertain"]
VALID_MATRIX = ["polynomial", "rational", "auto_diff"]

class Example:
    def __init__(self, name, read, matrix, observables, **kwds):
        assert read in VALID_READ and matrix in VALID_MATRIX
        self.__name = name
        self.__read = read
        self.__matrix = matrix
        self.__observables = observables

        self.__model = kwds.pop("model", name)
        self.__range = kwds.pop("range", None)
        self.__json = kwds

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

    def results_path(self, read = None, matrix = None):
        read = self.read if read is None else read
        matrix = self.matrix if matrix is None else matrix
        file_name = f"result_{self.name}[r={read},m={matrix}].example.txt"
        if self.out_folder != None:
            return os.path.join(script_dir, self.out_folder , file_name)
        return os.path.join(script_dir, file_name)

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



script_dir = os.path.dirname(__file__) if __name__ != "__main__" else "./"
examples = {}
with open(os.path.join(script_dir,'data.json')) as f:
    data = json.load(f)
    examples = {key : Example(key, **data[key]) for key in data}

executed_examples = [
    (name,read,matrix) 
    for (name, read, matrix) in product(examples.keys(), VALID_READ, VALID_MATRIX) 
    if os.path.exists(examples[name].results_path(read, matrix))
]
    
def get_example(name):
    return examples[name]

## Script area
if __name__ == "__main__":
    if len(sys.argv) > 1 and sys.argv[1] == "list":
        full = False
        type = ("polynomial", "uncertain", "rational", "sympy")
        allowed_folders = []; allowed_names = []; forbidden_names = []; executed = None
        i = 2
        while i < len(sys.argv): 
            if sys.argv[i] in ("-r", "-p", "-u") and len(type) < 4:
                raise TypeError("The type for listing was already given. Check 'help' command for further information")
            if sys.argv[i] == "-r":
                type = ("rational", "sympy"); i+= 1
            elif sys.argv[i] == "-p":
                type = ("polynomial",); i+= 1
            elif sys.argv[i] == "-u":
                type = ("uncertain",); i+= 1
            elif sys.argv[i] == "-of":
                allowed_folders.append(sys.argv[i+1]); i += 2
            elif sys.argv[i] == "-n":
                allowed_names.append(sys.argv[i+1]); i += 2
            elif sys.argv[i] == "-wn":
                forbidden_names.append(sys.argv[i+1]); i += 2
            elif sys.argv[i] == "-e":
                if executed != None and executed != True: raise TypeError("The command for executed tests were already given.")
                executed = True; i+= 1
            elif sys.argv[i] == "-ne":
                if executed != None and executed != False: raise TypeError("The command for executed tests were already given.")
                executed = False; i+= 1
            elif sys.argv[i] == "-a":
                full = True; i+= 1
            else:
                raise TypeError(f"Option {sys.argv[i]} not recognized. Check 'help' command for further information")

        filter = lambda example: (examples[example].read in type and 
                                    (len(allowed_folders) == 0 or examples[example].out_folder in allowed_folders) and
                                    (len(allowed_names) == 0 or any(example.startswith(name) for name in allowed_names)) and 
                                    (len(forbidden_names) == 0 or all(not example.startswith(name) for name in forbidden_names)) and
                                    (executed == None or any(el[0] == example for el in executed_examples) == executed)
                                 )

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
    elif len(sys.argv) > 1 and sys.argv[1] == "add":
        read = []; matrix = []; o = None; folders = []; subs=False
        i = 2
        while i < len(sys.argv):
            if sys.argv[i] == "-r":
                if not sys.argv[i+1] in ("polynomial", "rational", "sympy", "uncertain"):
                    raise ValueError(f"The value for a reading algorithm must be in ('polynomial', 'rational', 'sympy', 'uncertain') (got {sys.argv[i+1]}).")
                read.append(sys.argv[i+1]); i+= 2
            elif sys.argv[i] == "-m":
                if not sys.argv[i+1] in ("polynomial", "rational", "auto_diff"):
                    raise ValueError(f"The value for a reading algorithm must be in ('polynomial', 'rational', 'auto_diff') (got {sys.argv[i+1]}).")
                matrix.append(sys.argv[i+1]); i+= 2
            elif sys.argv[i] == "-o":
                if o != None:
                    raise ValueError("Too many 'out_folder' provided. See 'help' command for further information")
                o = sys.argv[i+1]; i += 2
            elif sys.argv[i] == "-s":
                subs=True; i += 1
            else:
                folders.append(sys.argv[i]); i+= 1

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

                print(f"## Processing examples for model {name}..............................................")
                system = FODESystem(file = model.path(), parser = "polynomial" if model.type == "polynomial" else "sympy")
                obs = [[str(system.symb_variables()[0])]]
                rng = model.range; rng = [None] if len(rng) == 0 else rng
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
                            
                            if not final_name in examples or subs:
                                examples[final_name] = Example(final_name, r, m, obs, **kwds)
                                print(f" ### Added the example {final_name}")
                                changed = True
                
                print(f"## Finished examples for model {name} ..............................................")
        
        if changed:
            print(" ## Dumping data...", end=" ")
            with open(os.path.join(script_dir,'data.json'), "w") as f:
                json.dump({example : examples[example].as_json() for example in examples}, f, indent = 4)
            print("Done")
    elif len(sys.argv) > 1 and sys.argv[1] == "compile":
        if len(sys.argv) > 2: raise TypeError("No optional arguments for command 'compile'. See ''help'' for further information")

        ## Compiling the data for executed examples
        compiled_data = {}
        for name, read, matrix in executed_examples:
            data = {} 
            data["observables"] = {}
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
                                line.strip()
                                if line.startswith("The size of the original model is"):
                                    data["observables"][obs_set]["size"] = int(line.removeprefix("The size of the original model is"))
                                elif line.startswith("The size of the reduced model is"):
                                    data["observables"][obs_set]["lumped"] = int(line.removeprefix("The size of the reduced model is"))
                                elif line.startswith("Computation took"):
                                    data["observables"][obs_set]["time"] = float(line.removeprefix("Computation took").removesuffix("seconds"))
                                elif line.startswith("Is the lumping a Forward Lumping (FL)?:"):
                                    data["observables"][obs_set]["FL"] = "Yes" if "True" in line else "No"
                                elif line.startswith("Has the lumping a Robust Weighted Lumping (RWL)?:"):
                                    data["observables"][obs_set]["RWL"] = "Yes" if "True" in line else "No"
                                elif line.startswith("Overflow error detected"): # an error of size in execution
                                    data[obs_set]["time"] = "Overflow error"
                                elif line.startswith("Timeout error detected: "): # an error of size in execution
                                    data[obs_set]["time"] = f">{line.removeprefix('The size of the reduced model is')}"
                                line = file.readline()
                            ## Filling fields if not given
                            if  not "size" in data[obs_set]: data[obs_set]["size"] = "oo"
                            if  not "lumped" in data[obs_set]: data[obs_set]["lumped"] = "oo"
                            if  not "time" in data[obs_set]: data[obs_set]["time"] = "oo"
                            if  not "FL" in data[obs_set]: data[obs_set]["FL"] = "Not computed"
                            if  not "RWL" in data[obs_set]: data[obs_set]["RWL"] = "Not computed"
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
                            if not "read_time" in data: data["read_time"] = "oo"
                            if not "matrix_time" in data: data["read_time"] = "oo"
                            if not "total_time" in data: data["read_time"] = "oo"

            compiled_data[(name, read, matrix)] = data

        ## Writing the csv file
        with open(os.path.join(script_dir, "compilation.csv"), "w") as file:
            headers= [
                "Name", 
                "Read Alg.", 
                "Time reading", 
                "Matrix Alg.", 
                "Time w/ matrices", 
                "Or. size", 
                "Lmp. size", 
                "Time (s)", 
                "Is FL?", 
                "Is RWL?", 
                "Observables"
            ]
            writer = csv.writer(file, delimiter=";")
            writer.writerow(headers)
            for ((name,read,matrix),data) in compiled_data.items():
                for (obs_set, values) in data["observables"].items():
                    writer.writerow([
                        name, 
                        read, 
                        data["read_time"], 
                        matrix, 
                        data["matrix_time"],
                        values["size"], 
                        values["lumped"], 
                        values["time"], 
                        values["FL"], 
                        values["RWL"],
                        obs_set
                    ])
    else:
        print(
            "--------------------------------------------------------------------------------------------------------------------------\n"
            "--------------------------------------------------------------------------------------------------------------------------\n"
            "HELP FOR examples_data SCRIPT\n\n"
            "The following commands are available in this script:\n"
            "--------------------------------------------------------------------------------------------------------------------------\n"
            "\tpython3 examples_data add [-r ()]* [-m ()]* [-o ()] [-s] <<folder>>*\n"
            "where the options mean:\n"
            "  * -r : indicates the reading algorithm. It can be 'polynomial', 'rational', 'sympy' or 'uncertain'. Several can be given.\n"
            "  * -m : indicates the algorithm for computing the matrices. It can be 'polynomial', 'rational' or 'auto_diff. Several can be given.'\n"
            "  * -o : indicates the folder where the output of the example will be stored\n"
            "  * -s : indicates whether already existing examples should be overridden\n"
            "  * <<folder>>: one or several folders that will be added to the examples using the previous arguments.\n"
            "--------------------------------------------------------------------------------------------------------------------------\n"
            "\tpython3 examples_data list [-r|-p|-u] [-of ()]* [-n ()]* [-wn ()]* [-e|-ne] [-a]\n"
            "will list all the available examples, where the options mean:\n"
            "  * -r : only rational examples will be shown (i.e., have 'read' either 'rational' or 'sympy').\n"
            "  * -p : only polynomial examples will be shown (i.e., have 'read' as 'polynomial')\n"
            "  * -u : only uncertain examples will be shown (i.e., have 'read' as 'uncertain')\n"
            "  * -of : only examples with given out_folder will be shown. Several of these are allowed\n"
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