import csv, os, signal, sys, time

sys.path.insert(0, "./../../") # clue is here

from clue import FODESystem, SparsePolynomial
import tests.time.times_data as TIMES
import models.models_data as MODELS

def alarm_handler(sgn, _):
    if(sgn == signal.SIGALRM):
        raise TimeoutError
    else:
        raise RuntimeError

def run_test(model, observables, read_algorithm = "sympy", mat_algorithm="auto_diff", timeout=1800):
    ## Setting up the timer for completion of the function
    old_handler = signal.signal(signal.SIGALRM, alarm_handler)
    signal.alarm(timeout)

    ## Reading the system and setting up observables
    try:
        start = time.time()
        system = FODESystem(file=model.path(), parser=read_algorithm)
        obs = [SparsePolynomial.from_string(el, system.variables) for el in observables]
        read_time = time.time()-start
    except TimeoutError:
        signal.signal(signal.SIGALRM, old_handler)
        return (f">{timeout}", "--", "--", f">{timeout}")
    except ValueError:
        signal.signal(signal.SIGALRM, old_handler)
        return ("Error", "--", "--", "Error")
    
    ## Computing the matrices for the system
    try:
        start = time.time()
        system.construct_matrices(mat_algorithm)
        matrix_time = time.time()-start
    except TimeoutError:
        signal.signal(signal.SIGALRM, old_handler)
        return (read_time, f">{timeout}", "--", f">{timeout}")
    except:
        signal.signal(signal.SIGALRM, old_handler)
        return (read_time, "Error", "--", "Error")
        
    ## Computing the lumping from the observables
    try:
        if(len(obs) > 0):
            start = time.time()
            system.lumping(obs, print_reduction=False, loglevel="ERROR", method=mat_algorithm)
            lumping_time = time.time() - start
    except TimeoutError:
        signal.signal(signal.SIGALRM, old_handler)
        return (read_time, matrix_time, f">{timeout}", f">{timeout}")
    except:
        signal.signal(signal.SIGALRM, old_handler)
        return (read_time, matrix_time, "Error", "Error")

    signal.alarm(0) # cancel the alarm
    signal.signal(signal.SIGALRM, old_handler)
    return (read_time, matrix_time, lumping_time, read_time+matrix_time+lumping_time)

if __name__ == '__main__':
    # mandatory values
    test_name = sys.argv[1]
    
    # processing the test required
    if("~" in test_name): # particular test is required
        test_name, read_algorithm, mat_algorithm = test_name.split("~")
        test = TIMES.get_test(test_name)
        model = test.model
        timeout = test.timeout
        test_obs = test.observables
    else:
        model = MODELS.get_model(test_name)
        read_algorithm = "sympy"
        mat_algorithm = "auto_diff"
        timeout = 1800
        test_obs = []
    out_file = f"./results/{model.name}_{read_algorithm}_{mat_algorithm}.results.csv"

    # Processing other arguments of the script
    nargs = len(sys.argv)
    n = 2
    observables = []
    while(n < nargs and sys.argv[n].startswith("-")):
        ## observables case
        if(sys.argv[n] in ("--obs", "--obs", "-observables", "-observables")): # observables list
            n += 1
            while(n < nargs and not sys.argv[n].startswith("-")):
                observables += [sys.argv[n]]
                n += 1
        else: # other arguments
            if(sys.argv[n] in ("--read", "--r", "-read", "-r")): # reading algorithm
                read_algorithm = sys.argv[n+1]
            elif(sys.argv[n] in ("--matrix", "--m", "-matrix", "-m")): # building matrices
                mat_algorithm = sys.argv[n+1]
            elif(sys.argv[n] in ("--timeout", "--time", "--t", "-timeout", "-time", "-t")): # timeout
                timeout = int(sys.argv[n+1])
            elif(sys.argv[n] in ("-output", "--output", "-o", "--o", "-out", "--out")): # output
                out_file = int(sys.argv[n+1])
            nargs += 2

    if(len(observables) == 0): # no observables found: using the test default (if any)
        observables = test_obs
    
    # obtaining the corresponding times
    read_time, matrix_time, lumping_time, total = run_test(model, observables, read_algorithm, mat_algorithm, timeout)
    # writing results in output file
    if(out_file == "stdout"):
        print(f"{read_time}, {matrix_time}, {lumping_time} --> {total}")
    elif(out_file == "stderr"):
        print(f"{read_time}, {matrix_time}, {lumping_time} --> {total}", file=sys.stderr)
    else:
        existed = os.path.isfile(out_file)
        with open(out_file, "a+") as file:
            writer = csv.writer(file, delimiter=",")
            if(not existed):
                writer.writerow(['read', 'matrix', 'lumping','total'])
        
            writer.writerow([read_time, matrix_time, lumping_time,total])

    sys.exit(0)


    