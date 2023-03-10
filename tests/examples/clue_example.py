import os, pstats, signal, sys, time

SCRIPT_DIR = os.path.dirname(__file__) if __name__ != "__main__" else "./"
sys.path.insert(0, os.path.join(SCRIPT_DIR, "..", "..")) # models and clue is here
sys.path.insert(0, os.path.join(SCRIPT_DIR, "..")) # examples_data is here

import json, csv
from contextlib import nullcontext
from cProfile import Profile

import models
from clue import FODESystem, SparsePolynomial, Subspace, OrthogonalSubspace, UncertainFODESystem, UncertainLDESystem
from examples_data import Example, Load_Examples_Folder, read_variables_from_system

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

    changed = False
    for (name, model) in models.models_data.models.items():
        if model.folder() in folders: # this model must be added
            # checking we can do everything
            if "uncertain" in read and model.type == "rational":
                raise TypeError("Found a 'rational' model and required an 'uncertain'")

            print(f"## Processing examples for model {name}".ljust(100, "."))
            system_variables = read_variables_from_system(model.path())
            ## Deciding observables
            print(f"### Deciding observables (criteria {O=})")
            obs = []
            if O in ("first", "all") :
                print(f"#### Adding the first variable as observable")
                obs.append([system_variables[0]])
            if O in ("sum", "all"):
                print(f"#### Adding the sum of everything as observable")
                obs.append([" + ".join(system_variables)])
            if O in ("alone", "all"):
                print(f"#### Adding all variables alone as observables")
                obs.extend([[system_variables[i]] for i in range(0 if O == "alone" else 1, len(system_variables))])

            print(f"### Found {len(obs)} set of observables")

            ## Deciding the range of the model (if exist)
            rng = model.range; rng = [None] if len(rng) == 0 else rng
            print(f"### {rng=} ; {read=} ; {matrix=}")
            for X in rng:
                for r in read:
                    for m in matrix:
                        # Deciding the final name of the example
                        extra = []
                        if name in examples and examples[name].read != r: extra.append(r)
                        if X != None: extra.append(X)
                        extra = f"[{'#'.join(extra)}]" if len(extra) > 0 else ''
                        final_name = f"{name}{extra}"
                        # Deciding the extra arguments for the example
                        kwds = {}
                        if final_name != name: kwds["model"] = name
                        if o != None: kwds["out_folder"] = o
                        if X != None: kwds["range"] = X
                        if r == "uncertain": kwds["delta"] = 0.1; kwds["unc_type"] = "prop"
                        
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
    r'''Method to compile the results on the examples.'''
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
                            if isinstance(data["observables"][obs_set]["size"], str) or isinstance(data["observables"][obs_set]["lumped"], str):
                                data["observables"][obs_set]["ratio"] = "NaN"
                            else:
                                data["observables"][obs_set]["ratio"] = data["observables"][obs_set]["lumped"]/data["observables"][obs_set]["size"]
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
            "Or. size", "Lmp. size", "Red. ratio", "Time (s)", # lumping execution
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
                        values["size"], values["lumped"], values["ratio"], values["time"], 
                        values["unweighted"], values["positive"], values["disjoint"], values["reducing"],
                        values["FL"], values["FE"], values["RWE"], values["RWE_has"],
                        obs_set
                    ])
                except KeyError:
                    print(f"[example_data - compile] ERROR - an error with a key ({name} -- {read} -- {matrix})")
        print(f"[example_data - compile] Compilation complete")

def run_example(*argv):
    r'''Method that run a particular example'''
    nargv = len(argv)
    if(nargv == 0):
        print("ERROR: this script must be run with at least one argument for the name of the model")
        print_help()
        return
    
    ## Getting the arguments for running the example
    example = get_example(argv[0])
    read = example.read; matrix = example.matrix
    observables = example.observables
    timeout = 0
    output = None
    profile = None
    subs_class = Subspace

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
            elif argv[n] == "-ortho":
                subs_class = OrthogonalSubspace; n+=1
    except IndexError:
        print("ERROR: Invalid format of arguments. Check 'run' command in the help")
        return
    
    profile = example.profile_path(read, matrix) if profile else None
    output = example.results_path(read, matrix) if output is None else output

    ## Creating the file in case it is needed
    if(output == "stdout"):
        file = sys.stdout
    elif(output == "stderr"):
        file = sys.stderr
    else:
        file = open(output, "w")

    ## Starting profiler if there is any
    with Profile() if profile else nullcontext() as pr:
    ## Setting up the handler for the signal
        total_time = time.time()

        print(f"[run_example] Reading example {example.name} ({read=})...", flush=True)

        try: #Reading the file
            with Timeout(timeout):
                read_time = time.time()
                ## now we can run the model properly
                if read == "uncertain":
                    system = FODESystem(file=example.path_model(), parser="polynomial", lumping_subspace=subs_class)
                    system = UncertainFODESystem.from_FODESystem(system, example.delta, type=example.unc_type)
                else:
                    system = FODESystem(file=example.path_model(), parser=read, lumping_subspace=subs_class)
                read_time = time.time() - read_time
        except TimeoutError:
            print(f"[run_example] Timeout ({timeout}) on {example.name} ({read=})", flush=True)
            print(f"Timeout error detected: {timeout}", file=file)
            print(f"Timeout while reading the .ode file", file=file)
            # Closing the output file (if opened)
            if(not output in ("stdout", "stderr")):
                file.close()
            # Saving the profile (if set)
            if profile:
                stats = pstats.Stats(pr)
                stats.sort_stats(pstats.SortKey.TIME)
                stats.dump_stats(filename=profile)
            return
        
        print(f"[run_example] Building matrices for {example.name} ({matrix=})...", flush=True)
        try: #Building the matrices for lumping
            with Timeout(timeout):
                matrices_time = time.time()
                system.construct_matrices(matrix)
                matrices_time = time.time() - matrices_time
        except TimeoutError:
            print(f"[run_example] Timeout ({timeout}) on {example.name} ({matrix=})", flush=True)
            print(f"Timeout error detected: {timeout}", file=file)
            print(f"Timeout while building the matrices", file=file)
            # Closing the output file (if opened)
            if(not output in ("stdout", "stderr")):
                file.close()
            # Saving the profile (if set)
            if profile:
                stats = pstats.Stats(pr)
                stats.sort_stats(pstats.SortKey.TIME)
                stats.dump_stats(filename=profile)
            return
        print(f"[run_example] Running example {example.name} ({len(observables)} cases)...", flush=True)
        for obs_set in observables:
            print(f"[run_example]     ++ {example.name} (({observables.index(obs_set)+1}/{len(observables)}))", flush=True)
            print("===============================================", file=file)
            print(f"== Observables: {obs_set}", file=file)
            obs_polys = [SparsePolynomial.from_string(s, system.variables, system.field) for s in obs_set]

            lumped = None
            try:
                with Timeout(timeout):
                    lumping_time = time.time()
                    lumped = system.lumping(obs_polys, method=matrix, file=file)
                    lumping_time = time.time() - lumping_time
            except TimeoutError:
                print(f"Timeout error detected: {timeout}", file=file)
                print("###############################################", file=file)
                continue
            except OverflowError:
                print("Overflow error detected", file=file)
                print("###############################################", file=file)
                continue
            
            if(not lumped == None):
                obs_str = str(tuple(obs_polys))
                lumped.save(example.out_path(read, matrix, "too long" if len(obs_str) > 100 else tuple(obs_polys)), format="clue")
                print(f"The size of the original model is {lumped.old_system.size}", file=file)
                print(f"The size of the reduced model is {lumped.size}", file=file)
                print(f"Computation took {lumping_time} seconds", file=file)
                print(f"PROPERTIES OF THE LUMPING:::", file=file)
                print(f"Is the lumping unweighted?: {lumped.is_unweighted()}", file=file)
                print(f"Is the lumping positive?: {lumped.is_positive()}", file=file)
                print(f"Is the lumping disjoint?: {lumped.is_disjoint()}", file=file)
                print(f"Is the lumping reducing?: {lumped.is_reducing()}", file=file)
                print(f"TYPE OF THE LUMPING:::", file=file)
                print(f"Is the lumping a Forward Lumping (FL)?: {lumped.is_FL()}", file=file)
                print(f"Is the lumping a Forward Equivalence (FE)?: {lumped.is_FE()}", file=file)
                print(f"Is the lumping a Robust Weighted Equivalence (RWE)?: {lumped.is_RWE()}", file=file)
                print(f"Has the lumping a Robust Weighted Lumping (RWE)?: {lumped.has_RWE()}", file=file)
            else:
                print(f"The example could not finish in the given timeout ({timeout}", file=file)
            print("###############################################", file=file)
            print(f"[run_example]     -- {example.name} (({observables.index(obs_set)+1}/{len(observables)})) (Done)", flush=True)

        print(f"[run_example] ## Finished example {example.name} ##", flush=True)
        
        ## Reverting changes
        total_time = time.time() - total_time
        print("===============================================", file=file)
        print("== END OF EXAMPLES", file=file)
        print(f"Time for reading the model: {read_time}", file=file)
        print(f"Time for building matrices: {matrices_time}", file=file)
        print(f"Total time in execution: {total_time}", file=file)

    
    # Closing the output file (if opened)
    if(not output in ("stdout", "stderr")):
        file.close()
    # Saving the profile (if set)
    if profile:
        stats = pstats.Stats(pr)
        stats.sort_stats(pstats.SortKey.TIME)
        stats.dump_stats(filename=profile)
    return

def print_help():
    print(
        "--------------------------------------------------------------------------------------------------------------------------\n"
        "--------------------------------------------------------------------------------------------------------------------------\n"
        "HELP FOR clue_example SCRIPT\n\n"
        "The following commands are available in this script:\n"
        "--------------------------------------------------------------------------------------------------------------------------\n"
        "\tpython3 clue_example add [-r ()]* [-m ()]* [-o ()] [-O ()] [-s] <<folder>>*\n"
        "where the options mean:\n"
        "  * -r : indicates the reading algorithm. It can be 'polynomial', 'rational', 'sympy' or 'uncertain'. Several can be given.\n"
        "  * -m : indicates the algorithm for computing the matrices. It can be 'polynomial', 'rational' or 'auto_diff. Several can be given.'\n"
        "  * -o : indicates the folder where the output of the example will be stored\n"
        "  * -s : indicates whether already existing examples should be overridden\n"
        "  * -O: indicates what observables set up for the new examples by default. It allow 'first', 'sum', 'alone' or 'all'."
        "  * <<folder>>: one or several folders that will be added to the examples using the previous arguments.\n"
        "--------------------------------------------------------------------------------------------------------------------------\n"
        "\tpython3 clue_example list [-r|-p|-u] [-of ()]* [-wf ()]* [-n ()]* [-wn ()]* [-e|-ne] [-a]\n"
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
        "\tpython3 clue_example compile\n"
        "will compile the results in the given folders into a csv with the basic data for the examples. No options are allowed.\n"
        "--------------------------------------------------------------------------------------------------------------------------\n"
        "\tpython3 clue_example run <<example>> [-r ()] [-m ()] [-t ()] [-o ()] [-p] [-ortho]\n"
        "will execute the example given by the name in <<example>>, where the options mean:\n"
        "  * -r : this method for reading the model will be used. Only 'polynomial', 'rational', 'sympy' and 'uncertain' are valid.\n"
        "  * -m : this method will be used for computing the matrices for lumping. Only 'polynomial', 'rational', 'random', 'auto_diff' are valid.\n"
        "  * -t : allows to fix a timeout for the execution.\n"
        "  * -o : allows to fix the output file for the results. If not given, the default output for the example is taken.\n"
        "  * -p : if given, a profiling file with the execution will be saved.\n"
        "  * -ortho : if given, Orthogonal projection instead of Gaussian elimination will be used while lumping.\n"
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
    elif len(sys.argv) > 1 and sys.argv[1] == "run":
        run_example(*sys.argv[1:])
    else:
        print_help()
    sys.exit(0)
