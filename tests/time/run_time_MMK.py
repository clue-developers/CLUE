import csv, os, signal, sys, time

from sympy import Symbol

sys.path.insert(0, "../")
sys.path.insert(0, "./../../")

from clue import FODESystem

def alarm_handler(sgn, _):
    if(sgn == signal.SIGALRM):
        raise TimeoutError
    else:
        raise RuntimeError

xs = []
Ks = []
pars = [Symbol(chr(ord('a')+i)) for i in range(10)]

def create_model(n):
    global xs, Ks, pars
    if(len(xs) < n):
        xs += [Symbol(f"x{i+1}") for i in range(len(xs), n)]
    if(len(Ks) < n):
        Ks += [Symbol(f"K{i+1}") for i in range(len(Ks), n)]
    
    a = pars[0]; b = pars[1]

    denom = (1 + sum([xs[j]/Ks[j] for j in range(0,n)]))
    ode = FODESystem(equations=[a * xs[0] / denom] + [
        b * xs[i] / denom
        for i in range(1,n)
    ], variables=[f'x{i+1}' for i in range(0,n)])

    return ode, xs[0]

def measure_times(size, timeout=1000):
    ## Setting up the timer for completion of the function
    old_handler = signal.signal(signal.SIGALRM, alarm_handler)
    signal.alarm(timeout)

    ## Reading the system and setting up observables
    try:
        start = time.time()
        system, obs = create_model(size)
        create_time = time.time()-start
    except TimeoutError:
        signal.signal(signal.SIGALRM, old_handler)
        return ("Not finished", "Not finished", "Not finished")
    except ValueError:
        signal.signal(signal.SIGALRM, old_handler)
        return ("Error", "Not finished", "Not finished")
    
    ## Computing the matrices for the system
    try:
        start = time.time()
        system.construct_matrices("auto_diff")
        matrix_time = time.time()-start
    except TimeoutError:
        signal.signal(signal.SIGALRM, old_handler)
        return (create_time, "Not finished", "Not finished")
    except:
        signal.signal(signal.SIGALRM, old_handler)
        return (create_time, "Error", "Not finished")
        
    ## Computing the lumping from the observables
    try:
        start = time.time()
        system.lumping([obs], print_reduction=False, loglevel="ERROR", method="auto_diff")
        lumping_time = time.time() - start
    except TimeoutError:
        signal.signal(signal.SIGALRM, old_handler)
        return (create_time, matrix_time, "Not finished")
    except:
        signal.signal(signal.SIGALRM, old_handler)
        return (create_time, matrix_time, "Error")

    signal.alarm(0) # cancel the alarm
    signal.signal(signal.SIGALRM, old_handler)
    return (create_time, matrix_time, lumping_time)


if __name__ == '__main__':
    # mandatory values
    out_file = sys.argv[1]
    min_size = 4
    max_size = 10

    # default values for optional arguments
    timeout = 1000

    nargs = 2
    while(nargs < len(sys.argv) and sys.argv[nargs].startswith("-")):
        if(sys.argv[nargs] in ("--min", "--m", "-min", "-m")): # minimal size
            min_size = int(sys.argv[nargs+1])
        elif(sys.argv[nargs] in ("--max", "--M", "-max", "-M")): # maximal size
            max_size = int(sys.argv[nargs+1])
        elif(sys.argv[nargs] in ("--fix", "--f", "-fix", "-f")): # just one size
            min_size = int(sys.argv[nargs+1])
            max_size = min_size
        elif(sys.argv[nargs] in ("--timeout", "--time", "--t", "-timeout", "-time", "-t")): # timeout
            timeout = int(sys.argv[nargs+1])
        nargs += 2
    
    # obtaining the corresponding times
    sizes = {n: measure_times(n, timeout) for n in range(min_size, max_size+1)}

    # writing results in output file
    if(out_file == "stdout"):
        for n in sizes:
            total = sizes[n][0] + sizes[n][1] + sizes[n][2]
            print(f"{n}: {sizes[n][0]}, {sizes[n][1]}, {sizes[n][2]} --> {total}", file=sys.stdout)
    elif(out_file == "stderr"):
        for n in sizes:
            total = sizes[n][0] + sizes[n][1] + sizes[n][2]
            print(f"{n}: {sizes[n][0]}, {sizes[n][1]}, {sizes[n][2]} --> {total}", file=sys.stderr)
    else:
        existed = os.path.isfile(out_file)
        with open(out_file, "a+") as file:
            writer = csv.writer(file, delimiter=",")
            if(not existed):
                writer.writerow(['size', 'create', 'matrix', 'lumping', 'total'])
            
            for n in sizes:
                total = sizes[n][0] + sizes[n][1] + sizes[n][2]
                writer.writerow([n, sizes[n][0], sizes[n][1], sizes[n][2], total])

    sys.exit(0)


    