import os, pickle, pstats, signal, sys, time

SCRIPT_DIR = os.path.dirname(__file__) if __name__ != "__main__" else "./"
sys.path.insert(0, os.path.join(SCRIPT_DIR, "..", "..")) # models and clue is here

from contextlib import nullcontext
from cProfile import Profile

from clue import FODESystem, SparsePolynomial, Subspace, OrthogonalSubspace, UncertainFODESystem, UncertainLDESystem
from examples_data import get_example #pylint: disable=import-error

def alarm_handler(sgn, _):
    if(sgn == signal.SIGALRM):
        raise TimeoutError
    else:
        raise RuntimeError

if __name__ == "__main__":
    ## Managing the input
    nargs = len(sys.argv)
    args = sys.argv

    if(nargs < 2):
        raise TypeError("This script must be run with at least one argument for the name of the model")
    
    ## Getting the arguments for running the example
    example = get_example(args[1])
    read = example.read; matrix = example.matrix
    observables = example.observables
    timeout = 0
    output = None
    profile = None
    subs_class = Subspace

    ## Checking the rest of the arguments
    n = 2
    while(n < nargs and args[n].startswith("-")):
        if(args[n] in ("-r", "-read", "--r", "--read")):
            read = args[n+1]; n += 2
        elif(args[n] in ("-m", "-matrix", "--m", "--matrix")):
            matrix = args[n+1]; n += 2
        elif(args[n] in ("-t", "-time", "--t", "--time")):
            timeout = int(args[n+1]); n += 2
        elif(args[n] in ("-o", "-output", "--o", "--output")):
            output = int(args[n+1]); n += 2
        elif(args[n] in ("-p", "-profile", "--profile", "--p")):
            profile = True; n += 1
        elif(args[n] in ("--ortho", "--orthogonal", "-ortho", "-orthogonal")):
            subs_class = OrthogonalSubspace; n+=1
    
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
        first_time = time.time()
        old_handler = signal.signal(signal.SIGALRM, alarm_handler)

        print(f"[run_example] Reading example {example.name} ({read=})...", flush=True)

        read_time = time.time()
        ## now we can run the model properly
        if read == "uncertain":
            system = FODESystem(file=example.path_model(), parser="polynomial", lumping_subspace=subs_class)
            delta = example.delta
            uncertain_type = example.unc_type
            system = UncertainFODESystem.from_FODESystem(system, delta, type=uncertain_type)
        else:
            system = FODESystem(file=example.path_model(), parser=read, lumping_subspace=subs_class)
        read_time = time.time() - read_time

        
        print(f"[run_example] Building matrices for {example.name} ({matrix=})...", flush=True)
        matrices_time = time.time()
        system.construct_matrices(matrix)
        matrices_time = time.time() - matrices_time

        print(f"[run_example] Running example {example.name} ({len(observables)} cases)...", flush=True)
        for obs_set in observables:
            print(f"[run_example]     ++ {example.name} (({observables.index(obs_set)+1}/{len(observables)}))", flush=True)
            print("===============================================", file=file)
            print(f"== Observables: {obs_set}", file=file)
            obs_polys = [SparsePolynomial.from_string(s, system.variables, system.field) for s in obs_set]

            lumped = None
            signal.alarm(timeout)
            try:
                start = time.time()
                lumped = system.lumping(obs_polys, method=matrix, file=file)
                end = time.time()
            except TimeoutError:
                print(f"Timeout error detected: {timeout}", file=file)
                print("###############################################", file=file)
                continue
            except OverflowError:
                print("Overflow error detected", file=file)
                print("###############################################", file=file)
                continue
            signal.alarm(0)
            
            if(not lumped == None):
                obs_str = str(tuple(obs_polys))
                lumped.save(example.out_path(read, matrix, "too long" if len(obs_str) > 100 else tuple(obs_polys)), format="clue")
                print(f"The size of the original model is {lumped.old_system.size}", file=file)
                print(f"The size of the reduced model is {lumped.size}", file=file)
                print(f"Computation took {end - start} seconds", file=file)
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
        signal.signal(signal.SIGALRM, old_handler)
        final_time = time.time()
        print("===============================================", file=file)
        print("== END OF EXAMPLES", file=file)
        print(f"Time for reading the model: {read_time}", file=file)
        print(f"Time for building matrices: {matrices_time}", file=file)
        print(f"Total time in execution: {final_time - first_time}", file=file)

    
    # Closing the output file (if opened)
    if(not output in ("stdout", "stderr")):
        file.close()
    # Saving the profile (if set)
    if profile:
        stats = pstats.Stats(pr)
        stats.sort_stats(pstats.SortKey.TIME)
        stats.dump_stats(filename=profile)
