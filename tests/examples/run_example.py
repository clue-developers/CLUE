import signal, sys, time

sys.path.insert(0, "./../../") # clue is here

from clue import FODESystem, SparsePolynomial, UncertainFODESystem
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
    output = f"result_{example.name}.example.txt"

    ## Checking the rest of the arguments
    n = 2
    while(n < nargs and args[n].startswith("-")):
        if(args[n] in ("-r", "-read", "--r", "--read")):
            read = args[n+1]
        elif(args[n] in ("-m", "-matrix", "--m", "--matrix")):
            matrix = args[n+1]
        elif(args[n] in ("-t", "-time", "--t", "--time")):
            timeout = int(args[n+1])
        elif(args[n] in ("-o", "-output", "--o", "--output")):
            output = int(args[n+1])

    ## Creating the file in case it is needed
    if(output == "stdout"):
        file = sys.stdout
    elif(output == "stderr"):
        file = sys.stderr
    else:
        file = open(output, "w")

    ## Setting up the handler for the signal
    old_handler = signal.signal(signal.SIGALRM, alarm_handler)

    ## now we can run the model properly
    if read == "uncertain":
        system = FODESystem(file=example.path_model(), parser="polynomial")
        delta = example.delta
        uncertain_type = example.unc_type
        system = UncertainFODESystem.from_FODESystem(system, delta, type=uncertain_type)
    else:
        system = FODESystem(file=example.path_model(), parser=read)

    for obs_set in observables:
        print("===============================================", file=file)
        obs_polys = [SparsePolynomial.from_string(s, system.variables) for s in obs_set]

        lumped = None
        signal.alarm(timeout)
        try:
            start = time.time()
            lumped = system.lumping(obs_polys, method=matrix, file=file)
            end = time.time()
        except TimeoutError:
            pass
        signal.alarm(0)
        
        if(not lumped == None):
            print(f"The size of the original model is {system.size}", file=file)
            print(f"The size of the reduced model is {lumped.size}", file=file)
            print(f"Computation took {end - start} seconds", file=file)
        else:
            print(f"The example could not finish in the given timeout ({timeout}", file=file)
    
    ## Reverting changes
    signal.signal(signal.SIGALRM, old_handler)
    if(not output in ("stdout", "stderr")):
        file.close()
