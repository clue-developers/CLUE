import json, os, sys

sys.path.insert(0, "./../../") # models and clue is here

import models.models_data
from clue import FODESystem

class Example:
    def __init__(self, name, read, matrix, observables, **kwds):
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
    
def get_example(name):
    return examples[name]

## Script area
if __name__ == "__main__":
    if len(sys.argv) > 1 and sys.argv[1] == "list":
        full = False
        type = ("polynomial", "uncertain", "rational", "sympy")
        allowed_folders = []; allowed_names = []
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
            elif sys.argv[i] == "-a":
                full = True; i+= 1
            else:
                raise TypeError(f"Option {sys.argv[i]} not recognized. Check 'help' command for further information")

        filter = lambda example: (examples[example].read in type and 
                                    (len(allowed_folders) == 0 or examples[example].out_folder in allowed_folders) and
                                    (len(allowed_names) == 0 or any(example.startswith(name) for name in allowed_names))
                                 )

        if full:
            lines = [["Example name", "Read", "Out folder"]]
            get_str = lambda example : (example.name, example.read, example.out_folder)

            lines += [get_str(examples[name]) for name in examples if filter(name)]
            n_elem = len(lines[0])
            max_length = [max(len(line[i]) if line[i] != None else 4 for line in lines) for i in range(n_elem)]

            lines.insert(1, [max_length[i]*"-" for i in range(n_elem)])

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
            "  * -s : indicates whether already existing examples should be overriden\n"
            "  * <<folder>>: one or several folders that will be added to the examples using the previous arguments.\n"
            "--------------------------------------------------------------------------------------------------------------------------\n"
            "\tpython3 examples_data list [-r|-p|-u] [-of ()]* [-a]\n"
            "will list all the available examples, where the options mean:\n"
            "  * -r : only rational examples will be shown (i.e., have 'read' either 'rational' or 'sympy').\n"
            "  * -p : only polynomial examples will be shown (i.e., have 'read' as 'polynomial')\n"
            "  * -u : only uncertain examples will be shown (i.e., have 'read' as 'uncertain')\n"
            "  * -of : only examples with given out_folder will be shown. Several of these are allowed\n"
            "  * -a : a detailed description of the examples will be shown\n"
            "If no option is provided, all examples will be shown.\n"
            "--------------------------------------------------------------------------------------------------------------------------\n"
            "--------------------------------------------------------------------------------------------------------------------------\n"
        )