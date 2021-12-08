import csv, os, signal, sys, time

sys.path.insert(0, "../")
sys.path.insert(0, "./../../")

from clue import FODESystem, SparsePolynomial

def alarm_handler(sgn, _):
    if(sgn == signal.SIGALRM):
        raise TimeoutError
    else:
        raise RuntimeError

def measure_times(file_name, observables, read_algorithm = "sympy", mat_algorithm="auto_diff", timeout=1000):
    ## Setting up the timer for completion of the function
    old_handler = signal.signal(signal.SIGALRM, alarm_handler)
    signal.alarm(timeout)

    ## Reading the system and setting up observables
    try:
        start = time.time()
        system = FODESystem(file=f"{file_name}.ode", parser=read_algorithm)
        obs = [SparsePolynomial.from_string(el, system.variables) for el in observables]
        read_time = time.time()-start
    except TimeoutError:
        signal.signal(signal.SIGALRM, old_handler)
        return ("Not finished", "Not finished", "Not finished")
    except ValueError:
        signal.signal(signal.SIGALRM, old_handler)
        return ("Error", "Not finished", "Not finished")
    
    ## Computing the matrices for the system
    try:
        start = time.time()
        system.construct_matrices(mat_algorithm)
        matrix_time = time.time()-start
    except TimeoutError:
        signal.signal(signal.SIGALRM, old_handler)
        return (read_time, "Not finished", "Not finished")
    except:
        signal.signal(signal.SIGALRM, old_handler)
        return (read_time, "Error", "Not finished")
        
    ## Computing the lumping from the observables
    try:
        if(len(obs) > 0):
            start = time.time()
            system.lumping(obs, print_reduction=False, loglevel="ERROR", method=mat_algorithm)
            lumping_time = time.time() - start
    except TimeoutError:
        signal.signal(signal.SIGALRM, old_handler)
        return (read_time, matrix_time, "Not finished")
    except:
        signal.signal(signal.SIGALRM, old_handler)
        return (read_time, matrix_time, "Error")

    signal.alarm(0) # cancel the alarm
    signal.signal(signal.SIGALRM, old_handler)
    return (read_time, matrix_time, lumping_time)


if __name__ == '__main__':
    # mandatory values
    file_name = sys.argv[1]

    out_file = sys.argv[2]

    # default values for optional arguments
    read_algorithm = "sympy"
    mat_algorithm = "auto_diff"
    timeout = 1000

    nargs = 3
    while(sys.argv[nargs].startswith("-")):
        if(sys.argv[nargs] in ("--read", "--r", "-read", "-r")): # reading algorithm
            read_algorithm = sys.argv[nargs+1]
        elif(sys.argv[nargs] in ("--matrix", "--m", "-matrix", "-m")): # building matrices
            mat_algorithm = sys.argv[nargs+1]
        elif(sys.argv[nargs] in ("--timeout", "--time", "--t", "-timeout", "-time", "-t")): # timeout
            timeout = int(sys.argv[nargs+1])
        nargs += 2
    
    # obtaining the list of observable names
    observables = sys.argv[nargs:]

    # obtaining the corresponding times
    read_time, matrix_time, lumping_time = measure_times(file_name, observables, read_algorithm, mat_algorithm, timeout)

    # writing results in output file
    existed = os.path.isfile(out_file)
    with open(out_file, "a+") as file:
        writer = csv.writer(file)
        if(not existed):
            writer.writerow(['read', 'matrix', 'lumping'])
        
        writer.writerow([read_time, matrix_time, lumping_time])

    sys.exit(0)


    