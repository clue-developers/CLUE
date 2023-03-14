from __future__ import annotations

import os, pstats, signal, sys, time, logging

SCRIPT_DIR = os.path.dirname(__file__) if __name__ != "__main__" else "./"
sys.path.insert(0, os.path.join(SCRIPT_DIR, "..", "..")) # models and clue is here
sys.path.insert(0, os.path.join(SCRIPT_DIR, "..")) # examples_data is here

from clue import FODESystem, LDESystem, SparseRowMatrix, NumericalSubspace
from clue.simulations import apply_matrix, create_figure, merge_simulations
from examples_data import Example, Load_Examples_Folder
from matplotlib import pyplot as plt
from numpy import array, matmul, mean
from numpy.linalg import norm
from scipy.integrate._ivp.ivp import OdeResult
from sympy import RR

examples, executed_examples = Load_Examples_Folder(SCRIPT_DIR)
logger = logging.getLogger("clue")

class ResultNumericalExample:
    def __init__(self, 
                 example: Example, observable, observable_matrix: SparseRowMatrix = None, max_perturbation : float = None,
                 x0 = None, norm_x0: float = None, norm_fx0: float = None, percentage: float = None, epsilon: float = None, considered_epsilon: int = None,
                 system: FODESystem = None, num_system: FODESystem = None, exact_lumping: LDESystem = None, numerical_lumping: LDESystem = None,
                 size: int = None, exact_size: int = None, lumped_size: int = None, 
                 t0: float = None, t1: float = None, tstep: float = None, threshold: float = None, sample_points: int = None,
                 original_simulation: OdeResult = None, numerical_simulation: OdeResult = None,
                 merged_simulation: OdeResult = None, diff_simulation: OdeResult = None,
                 time_epsilon: float = None, time_total: float = None,
                 Mxt_2: float = None, et: float = None, avg_err: float = None, max_err: float = None
        ):
        self.example = example
        self.observable = observable; self._observable_matrix = observable_matrix; self._max_perturbation = max_perturbation
        self._x0 = x0; self._norm_x0 = norm_x0; self._norm_fx0 = norm_fx0; self._percentage = percentage; self._epsilon = epsilon; self._considered_epsilon = considered_epsilon
        self._system = system; self._num_system = num_system; self._exact_lumping = exact_lumping; self._numerical_lumping = numerical_lumping
        self._size = size; self._exact_size = exact_size; self._lumped_size = lumped_size
        self._t0 = t0; self._t1 = t1; self._tstep = tstep; self._threshold = threshold; self._sample_points = sample_points
        self._original_simulation = original_simulation; self._numerical_simulation = numerical_simulation
        self._merged_simulation = merged_simulation; self._diff_simulation = diff_simulation
        self._time_epsilon = time_epsilon; self._time_total = time_total
        self._Mxt_2 = Mxt_2; self._et = et; self._avg_err = avg_err; self._max_err = max_err
        
    @staticmethod
    def from_file(path_to_result: str) -> ResultNumericalExample:
        with open(path_to_result, "r") as file:
            line = None
            while line != "":
                line = file.readline()
                if line.startswith("Name of example: "):
                    example = line.removeprefix("Name of example: ")
                elif line.startswith("Observable: "):
                    observable = line.removeprefix("Observable: ")
                elif line.startswith("Max. perturbation: "):
                    max_perturbation = line.removeprefix("Max. perturbation: ")
                elif line.startswith("Size of original model: "):
                    original_size = line.removeprefix("Size of original model: ")
                elif line.startswith("Size of lumping: "):
                    exact_size = line.removeprefix("Size of lumping: ")
                elif line.startswith("Size of numerical lumping: "):
                    lumped_size = line.removeprefix("Size of numerical lumping: ")
                elif line.startswith("Error at final time: "):
                    et = line.removeprefix("Error at final time: ")
                elif line.startswith("Size of observable at final time: "):
                    Mxt_2 = line.removeprefix("Size of observable at final time: ")
                elif line.startswith("Value for epsilon for numerical lumping: "):
                    epsilon = line.removeprefix("Value for epsilon for numerical lumping: ")
                elif line.startswith("Size of initial value: "):
                    norm_x0 = line.removeprefix("Size of initial value: ")
                elif line.startswith("Size of initial drift: "):
                    norm_fx0 = line.removeprefix("Size of initial drift: ")
                elif line.startswith("Proportion of slope allowed: "):
                    percentage = line.removeprefix("Proportion of slope allowed: ")
                elif line.startswith("Average error on simulation: "):
                    avg_err = line.removeprefix("Average error on simulation: ")
                elif line.startswith("Maximal error on simulation: "):
                    max_err = line.removeprefix("Maximal error on simulation: ")
                elif line.startswith("Number of epsilons considered: "):
                    considered_epsilons = line.removeprefix("Number of epsilons considered: ")
                elif line.startswith("Tolerance used for computations: "):
                    threshold = line.removeprefix("Tolerance used for computations: ")
                elif line.startswith("Initial time of simulations: "):
                    t0 = line.removeprefix("Initial time of simulations: ")
                elif line.startswith("Time horizon of simulations: "):
                    t1 = line.removeprefix("Time horizon of simulations: ")
                elif line.startswith("Time used computing optimal epsilon: "):
                    time_epsilon = line.removeprefix("Time used computing optimal epsilon: ")
                elif line.startswith("Time used on computation: "):
                    time_total = line.removeprefix("Time used on computation: ")

        return ResultNumericalExample(get_example(example), observable,
                max_perturbation=max_perturbation, size=original_size, exact_size=exact_size, lumped_size=lumped_size,
                et=et, Mxt_2 = Mxt_2, epsilon=epsilon, norm_x0=norm_x0, norm_fx0=norm_fx0,percentage=percentage,
                avg_err=avg_err, max_err=max_err, considered_epsilon=considered_epsilons,threshold=threshold,t0=t0,t1=t1,
                time_epsilon=time_epsilon, time_total=time_total)
            
    ## GENERATING ATTRIBUTES IF NOT GIVEN
    @property
    def observable_matrix(self):
        if self._observable_matrix is None:
            self._observable_matrix = SparseRowMatrix.from_vectors([poly.linear_part_as_vec() for poly in self.observable])
        return self._observable_matrix
    @property
    def max_perturbation(self):
        if self._max_perturbation is None:
            self._max_perturbation = 0.0
        return self._max_perturbation
    @property
    def x0(self):
        if self._x0 is None:
            self._x0 = array([self.system.ic.get(v,0) for v in self.system.variables])
        return self._x0
    @property
    def norm_x0(self):
        if self._norm_x0 is None:
            self._norm_x0 = norm(self.x0)
        return self._norm_x0
    @property
    def norm_fx0(self):
        if self._norm_fx0 is None:
            self._norm_fx0 = norm(self.system.derivative(...,*self.x0))
        return self._norm_fx0
    @property
    def percentage(self):
        return self._percentage
    @property
    def epsilon(self):
        if self._epsilon is None:
            if self.percentage is None:
                raise ValueError("Impossible to get the epsilon for this example")
            self._epsilon, self._considered_epsilon = self.system.find_acceptable_threshold(
                self.observable, self.dev_max(), 1, self.compact_bound(), 
                self.sample_points, self.threshold, with_tries=True)
        return self._epsilon
    @property
    def considered_epsilon(self):
        self.epsilon
        return self._considered_epsilon
    @property
    def system(self):
        if self._system is None:
            example = self.example
            self._system = FODESystem(file = example.path_model(), read_ic = True, parser=example.read).remove_parameters_ic()

        return self._system
    @property
    def num_system(self):
        if self._num_system is None:
            example = self.example
            self._num_system = FODESystem(file = example.path_model(), read_ic = True, parser=example.read).remove_parameters_ic()

        return self._num_system
    @property
    def exact_lumping(self):
        if self._exact_lumping is None:
            self._exact_lumping = self.system.lumping(self.observable, method=self.example.matrix, print_system=False, print_reduction=False)
        return self._exact_lumping
    @property
    def numerical_lumping(self):
        if self._numerical_lumping is None:
            self.num_system.lumping_subspace_class = NumericalSubspace, {"delta" : self.epsilon}
            self._numerical_lumping = self.num_system.lumping(self.observable, method=self.example.matrix, print_system=False, print_reduction=False)
        return self._numerical_lumping
    @property
    def size(self):
        if self._size is None:
            self._size = self.system.size
        return self._size
    @property
    def exact_size(self):
        if self._exact_size is None:
            self._exact_size = self.exact_lumping.size
        return self._exact_size
    @property
    def lumped_size(self):
        if self._lumped_size is None:
            self._lumped_size = self.numerical_lumping.size
        return self._lumped_size
    @property
    def t0(self):
        return self._t0
    @property
    def t1(self):
        return self._t1
    @property
    def tstep(self):
        if self._tstep is None:
            self._tstep = (self.t1-self.t0)/200
        return self._tstep
    @property
    def threshold(self):
        if self._threshold is None:
            self._threshold = 1e-6
        return self._threshold
    @property
    def sample_points(self):
        if self._sample_points is None:
            self._sample_points = 50
        return self._sample_points
    @property
    def original_simulation(self):
        if self._original_simulation is None:
            self._original_simulation = apply_matrix(self.system.simulate(self.t0,self.t1,self.x0,self.tstep), self.observable_matrix)
        return self._original_simulation
    @property
    def numerical_simulation(self):
        if self._numerical_simulation is None:
            x0 = self.x0
            Lx0 = matmul(self.numerical_lumping.lumping_matrix.to_numpy(dtype=x0.dtype), x0)
            O = self.observable_matrix.change_base(RR).matmul(self.numerical_lumping._subspace.pinv())
            self._numerical_simulation = apply_matrix(self.numerical_lumping.simulate(self.t0,self.t1,Lx0,self.tstep), O)
            self._numerical_simulation.names = [
                f"{name}[{self.epsilon}{f'--{self.percentage}' if self.percentage != None else ''}" for name in self.original_simulation.names
            ]
        return self._numerical_simulation
    @property
    def merged_simulation(self):
        if self._merged_simulation is None:
            self._merged_simulation = merge_simulations(self.original_simulation, self.numerical_simulation)
        return self._merged_simulation
    @property
    def diff_simulation(self):
        if self._diff_simulation is None:
            self._diff_simulation = OdeResult(**self.original_simulation) 
            self.diff_simulation.y = abs(self.original_simulation.y - self.numerical_simulation.y)
        return self._diff_simulation
    @property
    def time_epsilon(self):
        return self._time_epsilon
    @property
    def time_total(self):
        return self._time_total
    @property
    def Mxt_2(self):
        if self._Mxt_2 is None:
            self._Mxt_2 = norm(self.original_simulation.y[:,-1])
        return self._Mxt_2
    @property
    def et(self):
        if self._et is None:
            self._et = norm(self.diff_simulation.y[:,-1])
        return self._et
    @property
    def avg_err(self):
        if self._avg_err is None:
            self._avg_err = mean(self.diff_simulation.y)
        return self._avg_err
    @property
    def max_err(self):
        if self._max_err is None:
            self._max_err = self.diff_simulation.y.max()
        return self._max_err

    ## DERIVATIVE VALUES
    def dev_max(self):
        if self.percentage is None:
            raise ValueError("Impossible to get the maximal deviation for this example")
        return self.norm_fx0*self.percentage
    def compact_bound(self):
        return self.norm_x0
    
    @staticmethod
    def CSVRows():
        r'''
            The data in a CSV row is:
            
            * ``modelName``: an identifier of the test, including the name of the example and any other information on the 
              observable and perturbation to make it unique.
            * ``maxPerturbation``: a number indicating the percentage of perturbation done in the model.
            * ``size``: original size of the model
            * ``clum_size``: size of the exact lumped system.
            * ``nlum_size``: size of the numerical lumping.
            * ``et_rel``: relative error at the time horizon.
            * ``et``: error on the observables at the time horizon.
            * ``|M*xt|_2``: size of the observables at the time horizon.
            * ``epsilon``: epsilon used for the numerical lumping.
            * ``max_deviation``: maximal deviation allowed for getting the optimal epsilon.
            * ``norm_x0``: size of the initial condition at initial time.
            * ``compactum_bound``: size of the compactum used for computing samples for the deviation.
            * ``norm_fx0``: size of the drift at the initial time
            * ``max_allowed_slope``: proportion of the initial slope to be used for maximal deviation.
            * ``avg_err``: average error on the observables during the simulation.
            * ``max_err``: maximal error on the observables during the simulation.
            * ``consideredEpsilons``: number of epsilons computed for getting the optimal threshold.
            * ``tolerance``: tolerance used for equality of floats.
            * ``t0``: initial time for the simulations.
            * ``t1``: time horizon for the simulations.
            * ``secThisEpsilon``: time spent in computing the optimal epsilon.
            * ``secTotal``: time spent in the whole example.
        '''
        return [
            "modelName","maxPerturbation",
            "size","clum_size","nlum_size",
            "et_rel","et","|M*xt|_2",
            "epsilon","max_deviation","norm_x0","compactum_bound","norm_fx0","max_allowed_slope",
            "avg_err","max_err",
            "consideredEpsilons","tolerance",
            "t0", "t1", "secThisEpsilon","secTotal"
        ]
    
    def generate_image(self):
        r'''Method that generates an image file with the simulations of self.'''
        fig = create_figure([self.merged_simulation, self.diff_simulation], format=["-", "-"], title=["True simulation vs Appr. simulation", "Abs. Difference"])
        fig.savefig(
            self.example.image_path(
                SCRIPT_DIR, self.example.read, self.example.matrix,
                f"{self.percentage}#{self.epsilon}#{self.observable}"
            )
        )
        plt.close()
    
    def generate_result(self):
        r'''Method that generates a results file with the information of this '''
        with open(
            self.example.results_path(
                SCRIPT_DIR, self.example.read, self.example.matrix,
                f"{self.percentage}#{self.epsilon}#{self.observable}"
            ), "w"
        ) as file:
            et = self.et
            Mxt_2 = self.Mxt_2
            file.writelines([
                "#############################################################\n",
                "### Result for numerical lumping\n",
                "#############################################################\n",
                f"Name of example: {self.example.name}\n",
                f"Observable: {self.observable}\n",
                f"Max. perturbation: {self.max_perturbation}\n",
                f"Size of original model: {self.size}\n",
                f"Size of lumping: {self.exact_size}\n",
                f"Size of numerical lumping: {self.lumped_size}\n",
                f"Relative error at final time: {et/Mxt_2}\n",
                f"Error at final time: {et}\n",
                f"Size of observable at final time: {Mxt_2}\n",
                f"Value for epsilon for numerical lumping: {self.epsilon}\n",
                f"Value for maximal deviation: {self.dev_max()}\n",
                f"Size of initial value: {self.norm_x0}\n",
                f"Size of compactum used for sampling the deviation: {self.compact_bound()}\n",
                f"Size of initial drift: {self.norm_fx0}\n",
                f"Proportion of slope allowed: {self.percentage}\n",
                f"Average error on simulation: {self.avg_err}\n",
                f"Maximal error on simulation: {self.max_err}\n",
                f"Number of epsilons considered: {self.considered_epsilon}\n",
                f"Tolerance used for computations: {self.threshold}\n",
                f"Initial time of simulations: {self.t0}\n",
                f"Time horizon of simulations: {self.t1}\n",
                f"Time used computing optimal epsilon: {self.time_epsilon}\n",
                f"Time used on computation: {self.time_total}\n",
                "#############################################################\n",
                "#############################################################\n",
            ])
            
    def to_csv(self):
        r'''
            Method to create a csv row for this example.
            
            See :func:`CSVRows` to see the columns of the CSV.
        '''
        modelName = f"{self.example.name}_{self.observable}_{self.max_perturbation}"
        maxPerturbation = self.max_perturbation
        size = self.size
        clum_size = self.exact_size
        nlum_size = self.lumped_size
        Mxt_2 = self.Mxt_2
        et = self.et
        et_rel = et/Mxt_2
        epsilon = self.epsilon; max_deviation = self.dev_max(); norm_x0 = self.norm_x0; 
        compact_bound = self.compact_bound(); norm_fx0 = self.norm_fx0; max_allowed_slope = self.percentage
        avg_err = self.avg_err
        max_err = self.max_err
        consideredEpsilons = self.considered_epsilon; tolerance = self.threshold
        t0 = self.t0; t1 = self.t1
        secThisEpsilon = self.time_epsilon; secTotal = self.time_total

        return [
            modelName,maxPerturbation,
            size,clum_size,nlum_size,
            et_rel,et,Mxt_2,
            epsilon,max_deviation,norm_x0,compact_bound,norm_fx0,max_allowed_slope,
            avg_err,max_err,
            consideredEpsilons,tolerance,
            t0, t1, secThisEpsilon,secTotal
        ]

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
    
    ## Getting the arguments for running the example
    example = get_example(argv[0])
    read = example.read; matrix = example.matrix
    observables = example.observables
    timeout: int = 0
    output = None
    profile: bool = None
    percentage_slope: float | list[float] = example.get("slopes", None)
    num_points: int = 50
    threshold: float = 1e-6
    type_input = example.get("type_input", "slope-brute")
    t0: float = example.get("t0", 0.0); t1: float = example.get("t1", 1.0); x0 = None; tstep: float = None

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
            elif argv[n] == "-s": # percentage slope
                try:
                    new_s = float(argv[n+1])
                except ValueError:
                    print(f"ERROR: the slope argument must be a float, but found {argv[n+1]}")
                    return
                if percentage_slope is None:
                    percentage_slope = []
                percentage_slope.append(new_s); n+=2
            elif argv[n] == "-sample":
                try:
                    num_points = int(argv[n+1]); n+=2
                except ValueError:
                    print(f"ERROR: the number of samples argument must be an integer, but found {argv[n+1]}")
                    return
            elif argv[n] == "-th":
                try:
                    threshold = float(argv[n+1]); n+=2
                except ValueError:
                    print(f"ERROR: the threshold argument must be a float, but found {argv[n+1]}")
                    return
            elif argv[n] == "-i":
                if not argv[n+1] in ("slope-brute", "slope-precise", "epsilon"):
                    print(f"ERROR: the type of input argument must be one of ['slope-brute','slope-precise','epsilon'], but found {argv[n+1]}")
                    return
                type_input = argv[n+1]; n+=2
            elif argv[n] == "-t0":
                try:
                    t0 = float(argv[n+1]); n+=2
                except ValueError:
                    print(f"ERROR: the initial time argument must be a float, but found {argv[n+1]}")
                    return
            elif argv[n] == "-t1":
                try:
                    t1 = float(argv[n+1]); n+=2
                except ValueError:
                    print(f"ERROR: the ending time argument must be a float, but found {argv[n+1]}")
                    return
            elif argv[n] == "-tstep":
                try:
                    tstep = float(argv[n+1]); n+=2
                except ValueError:
                    print(f"ERROR: the time-step argument must be a float, but found {argv[n+1]}")
                    return
    except IndexError:
        print("ERROR: Invalid format of arguments. Check 'run' command in the help")
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
