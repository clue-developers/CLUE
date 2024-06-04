from __future__ import annotations

import csv, inspect, os, pstats, signal, sys, time, logging, json, re

from contextlib import nullcontext
from clue import FODESystem, LDESystem, SparsePolynomial, SparseRowMatrix, NumericalSubspace
from clue.simulations import apply_matrix, create_figure, merge_simulations
from clue.ode_parser import readfile, extract_model_name, split_in_sections
from cProfile import Profile
from papers.examples_data import Example, Load_Examples_Folder
from io import TextIOBase
from matplotlib import pyplot as plt
from numpy import array, matmul, mean, divide, zeros_like, reshape
from numpy.linalg import norm
from scipy.integrate._ivp.ivp import OdeResult
from sympy import RR
from typing import Optional

from pathlib import Path

SCRIPT_DIR = Path(__file__).parent
EX_JSON = 'paper.json'
# EX_JSON = 'test_analysis.json'

examples, executed_examples = Load_Examples_Folder(SCRIPT_DIR, EX_JSON)
logger = logging.getLogger("clue." + __name__)
logger.setLevel(logging.DEBUG)


class Experiment:
    def __init__(self,
                 example: Example, observable, observable_name: Optional[str] = None, observable_matrix: Optional[SparseRowMatrix] = None, max_perturbation: Optional[float] = None,
                 x0 = None, norm_x0: float = None, norm_fx0: float = None, system: FODESystem = None, num_system: FODESystem = None, 
                 exact_lumping: LDESystem = None, size: int = None, exact_size: int = None, threshold: float = None,
                 sample_points: int = None, max_epsilon: float = None, max_dev: float = None
        ):
        self.example = example; self.observable = observable; self.observable_name = observable_name
        self._observable_matrix = observable_matrix; self._max_perturbation = max_perturbation
        self._x0 = x0; self._norm_x0 = norm_x0; self._norm_fx0 = norm_fx0
        self._system = system; self._num_system = num_system; self._exact_lumping = exact_lumping; self._size = size; self._exact_size = exact_size
        self._threshold = threshold; self._sample_points = sample_points; self._max_epsilon = max_epsilon; self._max_dev = max_dev
        
        ## Casting observables to SparsePolynomials
        for i in range(len(self.observable)):
            if isinstance(self.observable[i], str):
                self.observable[i] = SparsePolynomial.from_string(self.observable[i], self.system.variables, domain=self.system.field)
    
    ####################################################################################################
    ### PROPERTIES
    ####################################################################################################
    @property
    def observable_matrix(self):
        if self._observable_matrix is None:
            logger.debug(f"[Experiment # {self.example.name}] Computing {inspect.stack()[0][3]}")
            if any(not poly.is_linear() for poly in self.observable):
                raise ValueError(f"The observable is not a linear polynomial: {self.observable}")
            else:
                self._observable_matrix = SparseRowMatrix.from_vectors([poly.linear_part_as_vec() for poly in self.observable])
        return self._observable_matrix
    @property
    def max_perturbation(self):
        if self._max_perturbation is None:
            logger.debug(f"[Experiment # {self.example.name}] Computing {inspect.stack()[0][3]}")
            self._max_perturbation = 0.0
        return self._max_perturbation
    @property
    def x0(self):
        if self._x0 is None:
            logger.debug(f"[Experiment # {self.example.name}] Computing {inspect.stack()[0][3]}")
            self._x0 = array([self.system.ic.get(v,0) for v in self.system.variables])
        return self._x0
    @property
    def norm_x0(self):
        if self._norm_x0 is None:
            logger.debug(f"[Experiment # {self.example.name}] Computing {inspect.stack()[0][3]}")
            self._norm_x0 = norm(self.x0.astype(float))
        return self._norm_x0
    @property
    def norm_fx0(self):
        if self._norm_fx0 is None:
            logger.debug(f"[Experiment # {self.example.name}] Computing {inspect.stack()[0][3]}")
            self._norm_fx0 = norm(self.system.derivative(...,*self.x0.astype(float)))
        return self._norm_fx0
    @property
    def system(self):
        if self._system is None:
            logger.debug(f"[Experiment # {self.example.name}] Computing {inspect.stack()[0][3]}")
            example = self.example
            self._system = FODESystem(file = example.path_model(), read_ic = True, parser=example.read).remove_parameters_ic()

        return self._system
    @property
    def num_system(self):
        if self._num_system is None:
            logger.debug(f"[Experiment # {self.example.name}] Computing {inspect.stack()[0][3]}")
            example = self.example
            self._num_system = FODESystem(file = example.path_model(), read_ic = True, parser=example.read, field = RR).remove_parameters_ic()

        return self._num_system
    @property
    def exact_lumping(self):
        if self._exact_lumping is None:
            logger.debug(f"[Experiment # {self.example.name}] Computing {inspect.stack()[0][3]}")
            self._exact_lumping = self.system.lumping(self.observable, method=self.example.matrix, print_system=False, print_reduction=False)
            if not self._exact_lumping.is_consistent():
                logger.error(f"[Experiment # {self.example.name}] Exact lumping NOT CONSISTENT")
        return self._exact_lumping
    @property
    def size(self):
        if self._size is None:
            logger.debug(f"[Experiment # {self.example.name}] Computing {inspect.stack()[0][3]}")
            self._size = self.system.size
        return self._size
    @property
    def exact_size(self):
        if self._exact_size is None:
            logger.debug(f"[Experiment # {self.example.name}] Computing {inspect.stack()[0][3]}")
            self._exact_size = self.exact_lumping.size
        return self._exact_size
    @property
    def threshold(self):
        if self._threshold is None:
            logger.debug(f"[Experiment # {self.example.name}] Computing {inspect.stack()[0][3]}")
            self._threshold = 1e-6
        return self._threshold
    @property
    def sample_points(self):
        if self._sample_points is None:
            logger.debug(f"[Experiment # {self.example.name}] Computing {inspect.stack()[0][3]}")
            self._sample_points = 100
        return self._sample_points
    @property
    def max_epsilon(self):
        if self._max_epsilon is None:
            logger.debug(f"[Experiment # {self.example.name}] Computing {inspect.stack()[0][3]}")
            self._max_epsilon = self.num_system.find_maximal_threshold(
                [obs.change_base(RR) for obs in self.observable],
                matrix_algorithm=self.example.matrix
            )
        return self._max_epsilon
    @property
    def max_dev(self):
        if self._max_dev is None:
            logger.debug(f"[Experiment # {self.example.name}] Computing {inspect.stack()[0][3]}")
            self.max_epsilon
        return self._max_dev

    def compact_bound(self):
        return self.norm_x0
    
    ####################################################################################################
    ### ABSTRACT METHODS
    ####################################################################################################
    @classmethod
    def CSVRows(cls):
        raise NotImplementedError(f"Method 'CSVRows' not implemented for {cls}")
    
    def generate_image(self):
        raise NotImplementedError(f"Method 'generate_image' not implemented for {self.__class__}")
    
    def write_result(self, file: TextIOBase):
        raise NotImplementedError(f"Method 'write_result' not implemented for {self.__class__}")

    @classmethod
    def from_file(cls, path_to_result: str) -> tuple[Experiment]:
        raise NotImplementedError(f"Method 'from_file' not implemented for {cls}")

    def to_csv(self) -> list:
        r'''
            Method to create a csv row for this example.

            See :func:`CSVRows` to see the columns of the CSV.
        '''
        raise NotImplementedError(f"Method 'to_csv' not implemented for {self.__class__}")

    ####################################################################################################
    ### REPRESENTATION METHODS
    ####################################################################################################
    def __repr__(self) -> str:
        extra = self._extra_repr()
        return f"{self.example.name}[{self.observable_name}] (r={self.example.read},m={self.example.matrix}) (C={self.compact_bound()}{'' if len(extra) == 0 else f',{extra}'})"
    
    def _extra_repr(self) -> str:
        return ""

class ResultNumericalExample(Experiment):
    def __init__(self, 
                 example: Example, observable, observable_name: str = None, observable_matrix: SparseRowMatrix = None, max_perturbation : float = None,
                 x0 = None, norm_x0: float = None, norm_fx0: float = None, percentage: float = None, epsilon: float = None, considered_epsilon: int = None, percentage_epsilon: float = None, percentage_size: float = None,
                 system: FODESystem = None, num_system: FODESystem = None, exact_lumping: LDESystem = None, numerical_lumping: LDESystem = None,
                 size: int = None, exact_size: int = None, lumped_size: int = None,
                 t0: float = None, t1: float = None, tstep: float = None, threshold: float = None, sample_points: int = None,
                 original_simulation: OdeResult = None, numerical_simulation: OdeResult = None,
                 merged_simulation: OdeResult = None, diff_simulation: OdeResult = None,
                 time_epsilon: float = None, time_total: float = None,
                 Mxt_2: float = None, et: float = None, avg_per_err: float = None, avg_err: float = None, max_err: float = None, max_epsilon: float = None
        ):
        super().__init__(example, observable, observable_name, observable_matrix, max_perturbation, x0, norm_x0, norm_fx0, system, num_system, exact_lumping, size, exact_size, threshold, sample_points, max_epsilon)
        self._percentage = percentage; self._epsilon = epsilon; self._considered_epsilon = considered_epsilon
        self._numerical_lumping = numerical_lumping; self._lumped_size = lumped_size
        self._t0 = t0; self._t1 = t1; self._tstep = tstep
        self._original_simulation = original_simulation; self._numerical_simulation = numerical_simulation
        self._merged_simulation = merged_simulation; self._diff_simulation = diff_simulation
        self._time_epsilon = time_epsilon; self._time_total = time_total
        self._Mxt_2 = Mxt_2; self._et = et; self._avg_per_err = avg_per_err; self._avg_err = avg_err; self._max_err = max_err
        self._percentage_error = None; self._percentage_epsilon = percentage_epsilon; self._percentage_size = percentage_size

    ####################################################################################################
    ### PROPERTIES (ADDING MORE THAN IN EXPERIMENT)
    ####################################################################################################
    @property
    def percentage(self):
        return self._percentage
    @property
    def percentage_epsilon(self):
        return self._percentage_epsilon
    @property
    def percentage_size(self):
        return self._percentage_size
    @property
    def epsilon(self):
        if self._epsilon is None:
            logger.debug(f"[RNE # {self.example.name}] Computing {inspect.stack()[0][3]}")
            if self.percentage is None and self.percentage_epsilon is None and self.percentage_size is None:
                raise ValueError("Impossible to get the epsilon for this example")
            elif self.percentage is not None and self.percentage_epsilon is None and self.percentage_size is None:
                ctime = time.time()
                self._epsilon, self._considered_epsilon = self.num_system.find_acceptable_threshold(
                    [obs.change_base(RR) for obs in self.observable], self.dev_max(), self.compact_bound(), 
                    self.sample_points, self.threshold, with_tries=True, matrix_algorithm=self.example.matrix)
                self._time_epsilon = time.time()-ctime
            elif self.percentage is None and self.percentage_epsilon is not None and self.percentage_size is None:
                self._epsilon = self.percentage_epsilon * self.max_epsilon
            elif self.percentage is None and self.percentage_epsilon is None and self.percentage_size is not None:
                ctime = time.time()
                found_red = self.num_system.find_reduction_given_size(
                    [obs.change_base(RR) for obs in self.observable],threshold=self.threshold, with_tries=True, matrix_algorithm=self.example.matrix, max_size = self.percentage_size)
                self._epsilon = found_red[3]
                self._considered_epsilon = found_red[4]

                self._time_epsilon = time.time()-ctime
        return self._epsilon
    @property
    def considered_epsilon(self):
        if self._considered_epsilon is None:
            logger.debug(f"[RNE # {self.example.name}] Computing {inspect.stack()[0][3]}")
            self.epsilon
            if self._considered_epsilon is None: # the epsilon was already given
                self._considered_epsilon = 1
        return self._considered_epsilon
    @property
    def numerical_lumping(self):
        if self._numerical_lumping is None:
            logger.debug(f"[RNE # {self.example.name}] Computing {inspect.stack()[0][3]}")
            if self.epsilon == 0: ## we do exact lumping with the orthogonal class
                logger.warning(f"[RNE # {self.example.name}] Requesting for numerical lumping for epsilon = 0. Returning exact lumping")
                ctime = time.time()
                self._numerical_lumping = self.exact_lumping
                self._time_total = (time.time()-ctime) + self.time_epsilon
            else:
                ## Getting current values for computing lumping
                old_subclass, old_subclass_args = self.num_system.lumping_subspace_class, self.num_system.lumping_subspace_kwds
                self.num_system.lumping_subspace_class = NumericalSubspace, {"delta" : self.epsilon}
                ## Getting numerical observable
                num_observable = [obs.change_base(RR) for obs in self.observable]
                ## Computing the lumping
                ctime = time.time()
                self._numerical_lumping = self.num_system.lumping(num_observable, method=self.example.matrix, print_system=False, print_reduction=False)
                self._time_total = (time.time()-ctime) + self.time_epsilon
                ## Restoring old values for computing lumping
                self.num_system.lumping_subspace_class = old_subclass, old_subclass_args
        return self._numerical_lumping
    @property
    def lumped_size(self):
        if self._lumped_size is None:
            logger.debug(f"[RNE # {self.example.name}] Computing {inspect.stack()[0][3]}")
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
            logger.debug(f"[RNE # {self.example.name}] Computing {inspect.stack()[0][3]}")
            self._tstep = (self.t1-self.t0)/200
        return self._tstep
    @property
    def original_simulation(self):
        if self._original_simulation is None:
            logger.debug(f"[RNE # {self.example.name}] Computing {inspect.stack()[0][3]}")
            x0 = self.x0
            Lx0 = matmul(self.exact_lumping.lumping_matrix.to_numpy(dtype=x0.dtype), x0)
            O = SparseRowMatrix.from_vectors([self.exact_lumping._subspace.find_in(row) for row in self.observable_matrix])
            self._original_simulation = apply_matrix(
                self.exact_lumping.simulate(self.t0,self.t1,Lx0,self.tstep,method=self.example.get("sim_method", "RK45")),
                O
            )
            self._original_simulation.names = [str(obs) for obs in self.observable] if len(self.observable) > 1 else [self.observable_name]
        return self._original_simulation
    @property
    def numerical_simulation(self):
        if self._numerical_simulation is None:
            logger.debug(f"[RNE # {self.example.name}] Computing {inspect.stack()[0][3]}")
            x0 = self.x0
            Lx0 = matmul(self.numerical_lumping.lumping_matrix.to_numpy(dtype=x0.dtype), x0)
            O = SparseRowMatrix.from_vectors([self.numerical_lumping._subspace.find_in(row) for row in self.observable_matrix.change_base(self.numerical_lumping._subspace.field)])
            logger.debug(f"[RNE # {self.example.name}] {inspect.stack()[0][3]} -- Starting simulation (t0={self.t0},t1={self.t1},tstep={self.tstep})")
            self._numerical_simulation = apply_matrix(
                self.numerical_lumping.simulate(self.t0,self.t1,Lx0,self.tstep,method=self.example.get("sim_method", "RK45")),
                O
            )
            logger.debug(f"[RNE # {self.example.name}] {inspect.stack()[0][3]} -- Finished simulation")
            self._numerical_simulation.names = [
                f"{name}[{self.epsilon:.3f}{f'--{self.percentage}' if self.percentage != None else ''}]" for name in self.original_simulation.names
            ]
        return self._numerical_simulation
    @property
    def merged_simulation(self):
        if self._merged_simulation is None:
            logger.debug(f"[RNE # {self.example.name}] Computing {inspect.stack()[0][3]}")
            self._merged_simulation = merge_simulations(self.original_simulation, self.numerical_simulation)
        return self._merged_simulation
    @property
    def diff_simulation(self):
        if self._diff_simulation is None:
            logger.debug(f"[RNE # {self.example.name}] Computing {inspect.stack()[0][3]}")
            self._diff_simulation = OdeResult(**self.original_simulation)
            self.diff_simulation.y = abs(self.original_simulation.y - self.numerical_simulation.y)
        return self._diff_simulation
    @property
    def percentage_error(self):
        if self._percentage_error is None:
            logger.debug(f"[RNE # {self.example.name}] Computing {inspect.stack()[0][3]}")
            self._percentage_error = OdeResult(**self.diff_simulation)
            self._percentage_error.y = 100*divide(
                self.diff_simulation.y,
                self.original_simulation.y,
                out=zeros_like(self.diff_simulation.y), where=self.original_simulation.y != 0
            )
        return self._percentage_error
    @property
    def time_epsilon(self):
        if self._time_epsilon is None:
            logger.debug(f"[RNE # {self.example.name}] Computing {inspect.stack()[0][3]}")
            self.epsilon # guaranteeing the time is computed
            if self._time_epsilon is None: # epsilons was given
                self._time_epsilon = 0.0
        return self._time_epsilon
    @property
    def time_total(self):
        if self._time_total is None:
            logger.debug(f"[RNE # {self.example.name}] Computing {inspect.stack()[0][3]}")
            self.numerical_lumping # guaranteeing the time is computed
        return self._time_total
    @property
    def Mxt_2(self):
        if self._Mxt_2 is None:
            logger.debug(f"[RNE # {self.example.name}] Computing {inspect.stack()[0][3]}")
            self._Mxt_2 = norm(self.original_simulation.y[:,-1])
        return self._Mxt_2
    @property
    def et(self):
        if self._et is None:
            logger.debug(f"[RNE # {self.example.name}] Computing {inspect.stack()[0][3]}")
            self._et = norm(self.diff_simulation.y[:,-1])
        return self._et
    @property
    def avg_err(self):
        if self._avg_err is None:
            logger.debug(f"[RNE # {self.example.name}] Computing {inspect.stack()[0][3]}")
            self._avg_err = mean(self.diff_simulation.y)
        return self._avg_err
    @property
    def avg_per_err(self):
        if self._avg_per_err is None:
            logger.debug(f"[RNE # {self.example.name}] Computing {inspect.stack()[0][3]}")
            self._avg_per_err = mean(self.percentage_error.y)
        return self._avg_per_err
    @property
    def max_err(self):
        if self._max_err is None:
            logger.debug(f"[RNE # {self.example.name}] Computing {inspect.stack()[0][3]}")
            self._max_err = self.diff_simulation.y.max()
        return self._max_err

    ####################################################################################################
    ### DERIVED PROPERTIES
    ####################################################################################################
    def dev_max(self):
        if self.percentage is None:
            raise ValueError("Impossible to get the maximal deviation for this example")
        return self.norm_fx0*self.percentage

    ####################################################################################################
    ### IMPLEMENTATION OF ABSTRACT METHODS
    ####################################################################################################
    @classmethod
    def CSVRows(cls):
        r'''
            The data in a CSV row is:

            1. ``modelName``: an identifier of the test, including the name of the example and any other information on the
              observable and perturbation to make it unique.
            2. ``type``: indicates if the system is polynomial or rational (or a different type)
            3. ``maxPerturbation``: a number indicating the percentage of perturbation done in the model.
            4. ``size``: original size of the model
            5. ``clum_size``: size of the exact lumped system.
            6. ``nlum_size``: size of the numerical lumping.
            7. ``et_rel``: relative error at the time horizon.
            8. ``et``: error on the observables at the time horizon.
            9. ``|M*xt|_2``: size of the observables at the time horizon.
            10. ``epsilon``: epsilon used for the numerical lumping.
            11. ``max_deviation``: maximal deviation allowed for getting the optimal epsilon.
            12. ``norm_x0``: size of the initial condition at initial time.
            13. ``compactum_bound``: size of the compactum used for computing samples for the deviation.
            14. ``norm_fx0``: size of the drift at the initial time
            15. ``max_allowed_slope``: proportion of the initial slope to be used for maximal deviation.
            16. ``avg_per_err``: average percentage error on the observables during the simulation.
            17. ``avg_err``: average error on the observables during the simulation.
            18. ``max_err``: maximal error on the observables during the simulation.
            19. ``max_epsilon``: maximal error valid for the observable.
            20. ``consideredEpsilons``: number of epsilons computed for getting the optimal threshold.
            21. ``tolerance``: tolerance used for equality of floats.
            22. ``t0``: initial time for the simulations.
            23. ``t1``: time horizon for the simulations.
            24. ``secThisEpsilon``: time spent in computing the optimal epsilon.
            25. ``secTotal``: time spent in the whole example.
        '''
        return [
            "modelName","type","maxPerturbation",
            "size","clum_size","nlum_size",
            "et_rel","et","|M*xt|_2",
            "epsilon","max_deviation","norm_x0","compactum_bound","norm_fx0","max_allowed_slope",
            "avg_per_err", "avg_err","max_err","max_epsilon",
            "consideredEpsilons","tolerance",
            "t0", "t1", "secThisEpsilon","secTotal"
        ]

    def generate_image(self):
        r'''Method that generates an image file with the simulations of self.'''
        fig = create_figure(
            [self.merged_simulation, self.diff_simulation, self.percentage_error],
            format=["-", "-", "-"],
            title=[
                f"True vs Appr. {f'[{100*self.percentage}%]' if self.percentage else ''} ({self.size} -> {self.exact_size} -> {self.lumped_size})",
                "Abs. Difference",
                "Percentual error"
            ]
        )
        fig.savefig(
            self.example.image_path(
                SCRIPT_DIR, self.example.read, self.example.matrix,
                f"{self.observable_name}#{self.percentage}" if self.percentage else f"{self.observable_name}#{self.epsilon:.3f}"
            )
        )
        plt.close()

    def write_result(self, file: TextIOBase):
        r'''Method that generates a results file with the information of this '''
        et = self.et
        Mxt_2 = self.Mxt_2
        et_rel = et/Mxt_2 if Mxt_2 > 0 else float("inf") if et > 0 else 0.0

        file.write("===============================================\n")
        file.write(f"== Observables: {self.observable_name} -> {self.observable}\n")
        file.write(f"Name of example: {self.example.name}\n")
        file.write(f"Max. perturbation: {self.max_perturbation}\n")
        file.write(f"Size of original model: {self.size}\n")
        file.write(f"Size of lumping: {self.exact_size}\n")
        file.write(f"Size of numerical lumping: {self.lumped_size}\n")
        file.write(f"Relative error at final time: {et_rel}\n")
        file.write(f"Error at final time: {et}\n")
        file.write(f"Size of observable at final time: {Mxt_2}\n")
        file.write(f"Value for epsilon for numerical lumping: {self.epsilon}\n")
        if self.percentage: file.write(f"Value for maximal deviation: {self.dev_max()}\n")
        file.write(f"Size of initial value: {self.norm_x0}\n")
        file.write(f"Size of compactum used for sampling the deviation: {self.compact_bound()}\n")
        file.write(f"Size of initial drift: {self.norm_fx0}\n")
        if self.percentage: file.write(f"Proportion of slope allowed: {self.percentage}\n")
        file.write(f"Average percentage error on simulation: {self.avg_per_err}\n")
        file.write(f"Average error on simulation: {self.avg_err}\n")
        file.write(f"Maximal error on simulation: {self.max_err}\n")
        file.write(f"Maximal epsilon for full lumping: {self.max_epsilon}\n")
        file.write(f"Number of epsilons considered: {self.considered_epsilon}\n")
        file.write(f"Tolerance used for computations: {self.threshold}\n")
        file.write(f"Initial time of simulations: {self.t0}\n")
        file.write(f"Time horizon of simulations: {self.t1}\n")
        file.write(f"Time used computing optimal epsilon: {self.time_epsilon}\n")
        file.write(f"Time used on computation: {self.time_total}\n")
        file.write("###############################################\n")

        file.flush()

    @classmethod
    def from_file(cls, path_to_result: str) -> tuple[ResultNumericalExample]:
        results = []
        try:
            with open(path_to_result, "r") as file:
                line = file.readline().strip()
                while line != "":
                    if line.startswith("==============================================="): # New example
                        #########################################################
                        ## Reading the observable
                        line = file.readline().strip()
                        if not line.startswith("== Observables: "): raise ValueError("Incorrect format in result file: observable must be specified first")
                        observable_line = line.removeprefix("== Observables: ").split(" -> ")
                        observable_name = observable_line[0].strip()
                        observable = [el.strip() for el in observable_line[1].strip().removeprefix("[").removesuffix("]").split(",")] ## This will be a list of str
                        #########################################################
                        ## Reading other information
                        line = file.readline().strip()
                        example, max_perturbation, original_size, exact_size, lumped_size = 5*[None]
                        et, Mxt_2, epsilon, norm_x0, norm_fx0, percentage = 6*[None]
                        avg_per_err, avg_err, max_err, considered_epsilons, threshold, t0, t1, time_epsilon, time_total = 9*[None]
                        while not line.startswith("###############################################"): # Until the end of example is found
                            if line == "": ## Unexpected end of file
                                raise ValueError(f"Unexpected end of file while reading {observable_name}")
                            elif line.startswith("Name of example: "):
                                example = line.removeprefix("Name of example: ")
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
                            elif line.startswith("Average percentage error on simulation: "):
                                avg_per_err = line.removeprefix("Average percentage error on simulation: ")
                            elif line.startswith("Average error on simulation: "):
                                avg_err = line.removeprefix("Average error on simulation: ")
                            elif line.startswith("Maximal error on simulation: "):
                                max_err = line.removeprefix("Maximal error on simulation: ")
                            elif line.startswith("Maximal epsilon for full lumping: "):
                                max_epsilon = line.removeprefix("Maximal epsilon for full lumping: ")
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
                            else:
                                logger.debug(f"[from_file] Omitting line: {line}")
                            line = file.readline().strip()
                        ## Casting the result to their types
                        example = get_example(example)
                        
                        max_perturbation = _casting(max_perturbation, float, "max_perturbation")
                        original_size = _casting(original_size, int, "original_size")
                        exact_size = _casting(exact_size, int, "exact_size")
                        lumped_size = _casting(lumped_size, int, "lumped_size")
                        et = _casting(et, float, "et")
                        Mxt_2 = _casting(Mxt_2, float, "Mxt_2")
                        epsilon = _casting(epsilon, float, "epsilon")
                        norm_x0 = _casting(norm_x0, float, "norm_x0")
                        norm_fx0 = _casting(norm_fx0, float, "norm_fx0")
                        percentage = _casting(percentage, float, "percentage", True)
                        avg_per_err = _casting(avg_per_err, float, "avg_per_err")
                        avg_err = _casting(avg_err, float, "avg_err")
                        max_err = _casting(max_err, float, "max_err")
                        max_epsilon = _casting(max_epsilon, float, "max_epsilon")
                        considered_epsilons = _casting(considered_epsilons, int, "considered_epsilons")
                        threshold = _casting(threshold, float, "threshold")
                        t0 = _casting(t0, float, "t0")
                        t1 = _casting(t1, float, "t1")
                        time_epsilon = _casting(time_epsilon, float, "time_epsilon", True)
                        time_total = _casting(time_total, float, "time_total")

                        ## Creating the result object
                        result = ResultNumericalExample(example, observable, observable_name=observable_name,
                            max_perturbation=max_perturbation, size=original_size, exact_size=exact_size, lumped_size=lumped_size,
                            et=et, Mxt_2 = Mxt_2, epsilon=epsilon, norm_x0=norm_x0, norm_fx0=norm_fx0,percentage=percentage,
                            avg_per_err=avg_per_err, avg_err=avg_err, max_err=max_err, max_epsilon=max_epsilon, considered_epsilon=considered_epsilons,threshold=threshold,t0=t0,t1=t1,
                            time_epsilon=time_epsilon, time_total=time_total)
                        logger.info(f"[from_file] Read case {repr(result)}")
                        results.append(result)
                    else:
                        logger.debug(f"[from_file] Omitting line: {line}")
                    line = file.readline().strip()
        except ValueError as e:
            logger.error(f"[from_file] Error while reading a file: {e}")
        return results

    def to_csv(self) -> list:
        r'''
            Method to create a csv row for this example.

            See :func:`CSVRows` to see the columns of the CSV.
        '''
        modelName = f"{self.example.name}_{self.observable_name}_{self.max_perturbation if self.max_perturbation else f'[e={self.epsilon:.3f}]'}"
        maxPerturbation = self.max_perturbation
        size = self.size
        clum_size = self.exact_size
        nlum_size = self.lumped_size
        Mxt_2 = self.Mxt_2
        et = self.et
        et_rel = et/Mxt_2 if Mxt_2 > 0 else float("inf") if et > 0 else 0.0
        epsilon = self.epsilon; max_deviation = self.dev_max() if self.percentage else None; norm_x0 = self.norm_x0; 
        compact_bound = self.compact_bound(); norm_fx0 = self.norm_fx0; max_allowed_slope = self.percentage
        avg_per_err = self.avg_per_err
        avg_err = self.avg_err
        max_err = self.max_err
        max_epsilon = self.max_epsilon
        consideredEpsilons = self.considered_epsilon; tolerance = self.threshold
        t0 = self.t0; t1 = self.t1
        secThisEpsilon = self.time_epsilon; secTotal = self.time_total

        return [
            modelName,self.example.get("out_folder", "polynomial"),maxPerturbation,
            size,clum_size,nlum_size,
            et_rel,et,Mxt_2,
            epsilon,max_deviation,norm_x0,compact_bound,norm_fx0,max_allowed_slope,
            avg_per_err,avg_err,max_err,max_epsilon,
            consideredEpsilons,tolerance,
            t0, t1, secThisEpsilon,secTotal
        ]

    ####################################################################################################
    ### REPRESENTATION METHODS
    ####################################################################################################
    def _extra_repr(self) -> str:
        return f'{100*self.percentage}% slope = {self.dev_max()}' if self.percentage else f'E={self.epsilon}'

class AnalysisExample(Experiment):
    def __init__(self, 
                 ## FROM EXPERIMENT
                 example: Example, observable, observable_name: str = None, observable_matrix: SparseRowMatrix = None, max_perturbation: float = None,
                 x0 = None, norm_x0: float = None, norm_fx0: float = None, system: FODESystem = None, num_system: FODESystem = None, 
                 exact_lumping: LDESystem = None, size: int = None, exact_size: int = None, threshold: float = None,
                 sample_points: int = None, max_epsilon: float = None, max_dev: float = None,
                 ## FROM ANALYSIS EXPERIMENT
                 epsilons: list[float] = None, sizes: list[int] = None, deviations: list[float] = None, mid_points: int = None, time_total: float = None,
                 epsilon_min: float = None, epsilon_max: float = None, timeout: float = 0
                 ):
        super().__init__(
            example, observable, observable_name=observable_name, observable_matrix=observable_matrix, max_perturbation=max_perturbation, 
            x0=x0, norm_x0=norm_x0, norm_fx0=norm_fx0, system=system, num_system=num_system,
            exact_lumping=exact_lumping, size=size, exact_size=exact_size, threshold=threshold, 
            sample_points=sample_points, max_epsilon=max_epsilon, max_dev=max_dev
        )
        self._epsilons = epsilons
        self._sizes = sizes
        self._deviations = deviations
        self._mid_points = mid_points
        self._time_total = time_total

        self.__epsilon_bound = (epsilon_min, epsilon_max)
        self.__timeout = timeout

    ####################################################################################################
    ### PROPERTIES (ADDING THE NEW PROPERTIES)
    ####################################################################################################
    @property
    def epsilons(self):
        if self._epsilons is None:
            logger.debug(f"[AnalysisExample # {self.example.name}] Finding reductions {inspect.stack()[0][3]}")

            ## Initializing the two new variables
            epsilons = list(); sizes = list(); deviations = list()
            bound = self.num_system._FODESystem__process_bound(self.compact_bound(), self.threshold)
            ctime = time.time()

            # Adding initial values
            nl = self.size+1
            nr = self.size
            rs = 0.0
            ls = 0.0


            logger.info(f"[AnalysisExample # {self.example.name}] Finding next reduction")
            while rs < self.max_epsilon and nr > self.observable_matrix.nrows and nr!=nl:
                sizes.append(nr);  epsilons.append((ls+rs)/2)
                try:
                    with Timeout(self.__timeout):
                        nl,nr,ls,rs = self.num_system.find_next_reduction(self.observable, dev_max=1, bound=bound, num_points=1, threshold=self.threshold, matrix_algorithm=self.example.matrix,eps_min=rs)
                        logger.debug(f"[AnalysisExample # {self.example.name}] Found a reduction from {nl} to {nr} at epsilon={(ls+rs)/2}")
                except TimeoutError:
                    logger.error(f"[AnalysisExample # {self.example.name}] Timeout of {self.__timeout} reached while computing \n\t{repr(self)}\n\t with {rs}. Trying next interation.")
            # for epsilon in (min_epsilon + i*(max_epsilon - min_epsilon)/(self.mid_points-1) for i in range(self.mid_points)):
                # logger.debug(f"[AnalysisExample # {self.example.name}] Case of {epsilon=}")
                # if epsilon == 0: # Exact lumping is needed
                    # logger.debug(f"[AnalysisExample # {self.example.name}] \tIt is an exact lumping!")
                    # epsilons.append(0.0)
                    # sizes.append(self.exact_size)
                    # deviations.append(0.0)
                # else: # numerical lumping is performed
                    # try:
                        # with Timeout(self.__timeout):
                            # subspace = find_smallest_common_subspace(self.num_system.construct_matrices(self.example.matrix), self.observable_matrix.change_base(RR), NumericalSubspace, delta=epsilon)
                            # sizes.append(subspace.dim())
                            # deviations.append(self.num_system._deviation(subspace, bound, self.sample_points))
                            # epsilons.append(epsilon)
            self._time_total = time.time() - ctime

            ## Saving the results
            self._epsilons = tuple(epsilons)
            self._sizes = tuple(sizes)
            self._deviations = tuple(deviations)
        return self._epsilons
    @property
    def sizes(self):
        if self._sizes is None:
            logger.debug(f"[AnalysisExample # {self.example.name}] Computing {inspect.stack()[0][3]}")
            self.epsilons
        return self._sizes
    @property
    def deviations(self):
        if self._deviations is None:
            logger.debug(f"[AnalysisExample # {self.example.name}] Computing {inspect.stack()[0][3]}")
            self.sizes
        return self._deviations
    @property
    def mid_points(self):
        if self._mid_points is None:
            logger.debug(f"[AnalysisExample # {self.example.name}] Computing {inspect.stack()[0][3]}")
            self._mid_points = 50
        return self._mid_points
    @property
    def time_total(self):
        if self._time_total is None:
            logger.debug(f"[AnalysisExample # {self.example.name}] Computing {inspect.stack()[0][3]}")
            self.sizes
        return self._time_total

    ####################################################################################################
    ### IMPLEMENTATION OF ABSTRACT METHODS
    ####################################################################################################
    def CSVRows(cls):
        r'''
            The data in a CSV row is:

            1. ``modelName``: an identifier of the test, including the name of the example and any other information.
            2. ``observable``: observable being analysed
            2. ``type``: indicates if the system is polynomial or rational (or a different type).
            3. ``size``: original size of the model.
            4. ``lum_size``: size of the (numerical or exact) lumping.
            5. ``epsilon``: epsilon used for the numerical lumping.
            6. ``deviation``: computed deviation for a given epsilon.
            7. ``max_deviation``: maximal deviation allowed.
            8. ``norm_x0``: size of the initial condition at initial time.
            9. ``compactum_bound``: size of the compactum used for computing samples for the deviation.
            11. ``tolerance``: tolerance used for equality of floats.
            12. ``secTotal``: time spent in the whole example.
        '''
        return [
        "modelName","observable", "type",
        "size","lum_size","epsilon",
        "deviation","max_deviation","norm_x0",
        "compactum_bound","tolerance",
        "secTotal",
    ]

    def generate_image(self):
        r'''Method that generates an image file with the simulations of self.'''
        x_axis = reshape(array( self.epsilons), (len(self.epsilons), 1))
        data = reshape(array(self.sizes), (1, len(self.epsilons)))
        graph = OdeResult(t=x_axis, y=data, success=True, names=["sizes"])
        fig = create_figure(
            graph,
            format=("o-", "-"),
            title = f"Lumping evolution for {str(self.observable_name)},Original Size= {self.size} "
        )
        fig.savefig(
            self.example.image_path(
                SCRIPT_DIR, self.example.read, self.example.matrix,
                f"{self.observable_name}#analysis"
            )
        )
        plt.close()

    def write_result(self, file: TextIOBase):
        r'''Method that generates a results file with the information of this '''

        file.write("===============================================\n")
        file.write(f"== Observables: {self.observable_name} -> {self.observable}\n")
        file.write(f"Name of example: {self.example.name}\n")
        file.write(f"Size of original model: {self.size}\n")
        file.write(f"Size of lumpings: {list(self.sizes)}\n")
        file.write(f"Epsilons: {list(self.epsilons)}\n")
        file.write(f"Deviations: {list(self.deviations)}\n")
        file.write(f"Value for maximal deviation: {self.max_dev}\n")
        file.write(f"Size of initial value: {self.norm_x0}\n")
        file.write(f"Size of compactum used for sampling the deviation: {self.compact_bound()}\n")
        file.write(f"Size of initial drift: {self.norm_fx0}\n")
        file.write(f"Tolerance used for computations: {self.threshold}\n")
        file.write(f"Time used on computation: {self.time_total}\n")
        file.write("###############################################\n")

        file.flush()

    @classmethod
    def from_file(cls, path_to_result: str) -> tuple[AnalysisExample]:
        results=[]
        try:
            with open(path_to_result, "r") as file:
                line = file.readline().strip()
                while line != "":
                    if line.startswith("==============================================="): # New example
                        #########################################################
                        ## Reading the observable
                        #########################################################
                        line = file.readline().strip()
                        if not line.startswith("== Observables: "): raise ValueError("Incorrect format in result file: observable must be specified first")
                        observable_line = line.removeprefix("== Observables: ").split(" -> ")
                        observable_name = observable_line[0].strip()
                        observable = [el.strip() for el in observable_line[1].strip().removeprefix("[").removesuffix("]").split(",")] ## This will be a list of str

                        line = file.readline().strip()

                        while not line.startswith("###############################################"): # Until the end of example is found
                            if line == "": ## Unexpected end of file
                                raise ValueError(f"Unexpected end of file while reading {observable_name}")
                            elif line.startswith("Name of example: "):
                                example_name = line.removeprefix("Name of example: ")
                            elif line.startswith("Size of original model: "):
                                original_size = line.removeprefix("Size of original model: ")
                            elif line.startswith("Size of lumpings: "):
                                lumpings_sizes = line.removeprefix("Size of lumpings: ")
                            elif line.startswith("Epsilons: "):
                                epsilons = line.removeprefix("Epsilons: ")
                            elif line.startswith("Deviations: "):
                                deviations = line.removeprefix("Deviations: ")
                            elif line.startswith("Value for maximal deviation: "):
                                max_dev = line.removeprefix("Value for maximal deviation: ")
                            elif line.startswith("Size of initial value: "):
                                norm_x0 = line.removeprefix("Size of initial value: ")
                            # elif line.startswith("Size of compactum used for sampling the deviation: "):
                            #     compact_bound = line.removeprefix("Size of compactum used for sampling the deviation: ")
                            elif line.startswith("Size of initial drift: "):
                                norm_fx0 = line.removeprefix("Size of initial drift: ")
                            elif line.startswith("Tolerance used for computations: "):
                                threshold = line.removeprefix("Tolerance used for computations: ")
                            elif line.startswith("Time used on computation: "):
                                time_total = line.removeprefix("Time used on computation: ")
                            else:
                                logger.debug(f"[from_file] Omitting line: {line}")
                            line = file.readline().strip()

                        ## Casting results to their type
                        example = get_example(example_name)
                        original_size = _casting(original_size, int, "original_size")
                        lumpings_sizes = _casting(lumpings_sizes, tuple, "lumpings_sizes")
                        epsilons = _casting(epsilons, tuple, "Epsilons")
                        deviations = _casting(deviations, tuple, "Deviations")
                        max_dev = _casting(max_dev, float, "Maximal deviation")
                        norm_x0 = _casting(norm_x0, float, "Size initial value")
                        norm_fx0 = _casting(norm_fx0, float, "Initial drift")
                        threshold = _casting(threshold, float, "threshold")
                        time_total = _casting(time_total, float, "time_total")
                        ## Creating the result object
                        result = AnalysisExample(example, observable, observable_name=observable_name, 
                            size=original_size, max_dev=max_dev, norm_x0=norm_x0, norm_fx0=norm_fx0, threshold=threshold,
                            sizes=lumpings_sizes, epsilons=epsilons, deviations=deviations, time_total=time_total)
                        logger.info(f"[from_file] Read case {repr(result)}")
                        results.append(result)
                    # line = file.readline().strip()
                    else:
                        logger.debug(f"[from_file] Omitting line: {line}")
                    line = file.readline().strip()
        except ValueError as e:
            logger.error(f"[from_file] Error while reading a file: {e}")
        return results
 
    def to_csv(self) -> list:
        r'''
            Method to create a csv row for this example.

            See :func:`CSVRows` to see the columns of the CSV.
        '''
        modelName = f"{self.example.name}_{self.observable_name}_AnalysisEpsilon"
        size = self.size
        sizes = self.sizes
        epsilons = self.epsilons
        deviations = self.deviations
        max_dev = self.max_dev
        norm_x0 = self.norm_x0
        compact_bound = self.compact_bound
        threshold = self.threshold
        time_total = self.time_total
        rows = []

        for i, epsilon in enumerate(epsilons):
            row = [ modelName,self.example.get("out_folder", "polynomial"),size, sizes[i], epsilon, deviations[i], max_dev, norm_x0, compact_bound,threshold, time_total
                   ]
            rows.append(row)
        return rows

    ####################################################################################################
    ### REPRESENTATION METHODS
    ####################################################################################################
    def _extra_repr(self) -> str:
        return f'[AnalysisEpsilon]'

def get_example(name) -> Example:
    return examples[name]

def _casting(value, ttype, name, allow_none = False):
    try:
        if ttype in (tuple,list):
            return ttype(json.loads(value))
        else:
            return ttype(value) if ((not allow_none) or (value != None and value != "None")) else None
    except Exception as e:
        raise ValueError(f"Expected {ttype} for {name}: {e}")

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
    # TODO: Update this method for analysis type
    r'''List examples in the folder. It allows several arguments.'''
    full = False
    type = ("polynomial", "uncertain", "rational", "sympy")
    example_types = set()
    allowed_folders = []; forbidden_folders = []; allowed_names = []; forbidden_names = []; executed = None
    i = 0
    ## Reading the arguments
    while i < len(argv):
        if argv[i] in ("-r", "-p") and len(type) < 4:
            raise TypeError("The type for listing was already given. Check 'help' command for further information")
        if argv[i] == "-r":
            type = ("rational", "sympy"); i+= 1
        elif argv[i] == "-p":
            type = ("polynomial",); i+= 1
        elif argv[i] == "-t":
            if argv[i+1] != "abstract":
                example_types.add(argv[i+1])
            i+=2
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
                                ((len(example_types) == 0 and examples[example].get("type", "slope") != "abstract") or (examples[example].get("type", "slope") in example_types)) and 
                                (len(allowed_folders) == 0 or examples[example].get("out_folder",None) in allowed_folders) and
                                (len(forbidden_folders) == 0 or examples[example].get("out_folder",None) not in forbidden_folders) and
                                (len(allowed_names) == 0 or any(example.startswith(name) for name in allowed_names)) and 
                                (len(forbidden_names) == 0 or all(not example.startswith(name) for name in forbidden_names)) and
                                (executed == None or any(el[0] == example for el in executed_examples) == executed)
                                )

    ## Creating the string to be printed
    if full:
        lines = [["Example name", "Read", "Type", "Ref. example", "Out folder"]]
        get_str = lambda example : (example.name, example.read, example.get("type", "slope"), example.ref.name if example.ref != None else "", example.get("out_folder", ""))

        lines.extend([get_str(examples[name]) for name in examples if filter(name)])
        lines.append(["N.models", f"{len(lines)-1}", "", "", ""])
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

    overwrite = False
    json_file = None
    matrix = 'polynomial'
    read = 'polynomial'
    out_folder = None
    exp_type = 'analysis'
    models_path = None

    n = 0
    nargv = len(argv)
    if(nargv == 0):
        raise ValueError("[add_examples_in_folder] This script must be run with at least one argument corresponding to the path where the models are.")
    try:
        while(n < nargv):
            if argv[n] == "-r":
                read = argv[n+1]; n += 2
            elif argv[n]  == "-m":
                matrix = argv[n+1]; n += 2
            elif argv[n] == "-of":
                out_folder = argv[n+1]; n += 2
                if not os.path.exists(os.path.dirname(out_folder)):
                    logger.warning("[add_examples_in_folder] Invalid output path. Make sure the directory exists. Skipping this parameter.")
            elif argv[n] == "-ow":
                overwrite = True; n += 1
            elif argv[n] == "-a":
                exp_type = 'analysis'; n += 1
            elif argv[n] == "-s":
                exp_type = 'slope'; n += 1
            elif argv[n] == "-ps":
                exp_type = 'percentage_size'; n += 1
            elif argv[n] == "-j":
                json_file = argv[n+1]; n += 2
            elif n == nargv-1:
                models_path = argv[n]; n+=2
                if not os.path.exists(os.path.dirname(models_path)):
                    logger.error("[add_examples_in_folder] Invalid path to models. Check the specified path.")
                    return
            else:
                raise TypeError(f"Option {argv[n]} not recognized. Check 'help' command for further information")



    except IndexError:
        logger.error("[add_examples_in_folder] Invalid format of arguments. Check 'run' command in the help")
        return

    models = sorted([x for x in os.listdir(models_path) if x.endswith(".ode")])

    if out_folder is None:
        out_folder = ''
        split = re.split('\/', models_path)
        i =-1
        while out_folder == '':
            out_folder=split[i]
            i -= 1
        out_folder = './'+out_folder


    if json_file is None:
        json_file = ''
        split = re.split('\/', models_path)
        i =-1
        while json_file == '':
            json_file=split[i]
            i -= 1
        json_file += '.json'

        # raise ValueError("[add_examples_in_folder] Unspecified json file. Try using the option -j <name of file>.")

    experiments = []
    for model in models:
        name=model.removesuffix('.ode')
        experiments.append(__get_model_dict(models_path+model,
                                            model_name=name,
                                            matrix=matrix,
                                            read=read,
                                            exp_type=exp_type,
                                            out_folder=out_folder))
    if len(experiments) == 0:
        logger.error("[add_examples_in_folder] No experiments found in given folder")
        return
    __write_experiments_to_json(experiments, json_file, overwrite)
    return

def __get_model_dict(file, model_name=None, matrix='polynomial', read='polynomial', out_folder=None, exp_type='analysis'):
    # Read model from .ODE
    model = readfile(file)
    name_from_file, sections_text = extract_model_name(model)
    sections_raw = split_in_sections(sections_text)
    if model_name == None:
        model_name = name_from_file

    result = {}
    result['model'] = model_name
    result['matrix'] = matrix
    result['read'] = read

    views = {}

    # Getting named views from views section
    check_partition = 0
    if 'views' in sections_raw:
        for line in sections_raw['views']:
            if "=" in line:
                lhs, rhs = [el.strip() for el in line.split("=")]
                views[lhs] = [rhs]
    if 'views' not in sections_raw or len(views)==0:
        logger.info(f'[get_model_dict] The file {file} does not have any explicit views.')
        if 'partition' in sections_raw:
            logger.info(f'[get_model_dict] Attempting to create views based on the elements of the partition.')
            check_partition = 1
        else:
            logger.info(f'[get_model_dict] The file {file} does not have partitions to generate view from.')


    # Generating view of the partition and (if chosen) views from the sets of the partition          
    if 'partition' in sections_raw:
        view_p = []
        for i,line in enumerate(sections_raw['partition']):
            if "NULL" in line:
                logger.info(f'[get_model_dict] Removing "NULL" from set {line.strip()}')
                line = line.replace('NULL', '')
            rhs = '+'.join([el for el in line.strip(' ,{}').split(',') ])
            if check_partition:
                view_name = 'VIEW_'+str(i)
                views[view_name] = [rhs]
            if rhs != '':
                view_p.append(rhs)
        views['PARTITION']=['",'.join(view_p)]

    if len(views) != 0:
        result['observables'] = views
    else:
        logger.warning(f'[get_model_dict] File {file} does not have observables.')

    # Adding base experiment
    if exp_type =='slope':
        result['type'] = 'slope'
        result['slopes'] = [0.1, 0.2,0.3,0.4, 0.5]
        # Getting final time
        expr = re.findall(r'tEnd=\d*', sections_text)
        if len(expr) != 0:
            _,tend = [el.strip() for el in expr[0].split("=")]
            result['t1'] = float(tend)
    elif exp_type =='percentage_size':
        result['type'] = 'percentage_size'
        result['percentage_size'] = [x*0.125 for x in range(1,8)]
        # Getting final time
        expr = re.findall(r'tEnd=\d*', sections_text)
        if len(expr) != 0:
            _,tend = [el.strip() for el in expr[0].split("=")]
            result['t1'] = float(tend)
    elif exp_type == 'analysis':
        result['type'] = 'analysis'
    else:
        raise ValueError("[get_model_dict] Invalid experiment type.")

    # Adding output folder
    if out_folder is not None:
        result['out_folder'] = out_folder

    return result

def __write_experiments_to_json(experiments, json_file, overwrite=False):
    # Opening or creating json_file
    if os.path.isfile(json_file) is False:
        logger.warning(f"[write_experiments_to_json] The json file {json_file} does not exist. It will be automatically created.")
        with open(json_file, 'w') as f:
            logger.info(f"[write_experiments_to_json] The json file {json_file} created")
    with open(json_file) as fp:
        if os.stat(json_file).st_size == 0:
            models_dict = {}
            logger.info(f'[write_experiments_to_json] Empty JSON file detected.')
        else:
            try:
                models_dict = json.load(fp)
            except:
                logger.error('[write_experiments_to_json] Impossible to load JSON file')

    written_exp = 0
    for exp in experiments:
        name=exp['model']
        if name in models_dict:
            logger.info(f"[write_experiments_to_json] Model {name} already found.")
            if not overwrite:
                logger.info(f'[write_experiments_to_json] Skipping model {name} ')
                continue
            logger.info(f'[write_experiments_to_json] Overwriting model {name}')
        else:
            logger.info(f'[write_experiments_to_json] Writing model {name}')
        written_exp += 1
        models_dict[name] = exp

    try:
        with open(json_file,'w') as fp:
            json.dump(models_dict, fp,
                      indent=4,
                      separators=(',',': '))
        if written_exp == 0:
            logger.info(f'[write_experiments_to_json] No models added to {json_file}')
            return
        logger.info(f'[write_experiments_to_json] {written_exp} models succesfully written to {json_file}')
        return
    except:
        logger.error('[write_experiments_to_json] Impossible to write models')


def compile_results(*argv):
    r'''Method to compile the results on the examples.'''
    ## TODO: add support for analysis example
    if len(argv) > 0: raise TypeError("No optional arguments for command 'compile'. See ''help'' for further information")

    results: list[ResultNumericalExample] = []
    for example, read, matrix in executed_examples:
        logger.log(60, f"[compile_results] Compiling results for {example} with {read=} and {matrix=}...")
        results.extend(ResultNumericalExample.from_file(examples[example].results_path(SCRIPT_DIR,read=read, matrix=matrix)))

    with open(os.path.join(SCRIPT_DIR, "compilation.csv"), "w") as file:
        writer = csv.writer(file, delimiter=";")
        writer.writerow(ResultNumericalExample.CSVRows())
        for result in results:
            try:
                writer.writerow(result.to_csv())
            except Exception as e:
                logger.error(f"[compile_result] Error processing {repr(result)}:\n\t- {e}")

        logger.log(60, f"[compile_results] Compilation complete")

    return

def run_example(*argv):
    r'''Method that run the exact experiment over an example'''
    nargv = len(argv)
    if(nargv == 0):
        logger.error("[run_example] This script must be run with at least one argument for the name of the model")
        print_help()
        return

    ## Getting the arguments for running the example
    example = get_example(argv[0])
    read = example.read; matrix = example.matrix
    observables = example.observables
    timeout: int = example.get("timeout", 0)
    output = example.results_path(SCRIPT_DIR)
    profile: bool = None
    percentage_slope: float | list[float] = None
    percentage_size: float | list[float] = None
    epsilons: float | list[float] = None
    percentage_epsilon: float | list[float] = None
    mid_points: int = example.get("mid_points", 50)
    sample_points: int = example.get("sample_points", 50)
    threshold: float = example.get("threshold", 1e-6)
    type_example: str = example.get("type", "slope")
    epsilon_min: float = example.get("epsilon_min", 0.0)
    epsilon_max: float = example.get("epsilon_max", None)
    t0: float = example.get("t0", 0.0); t1: float = example.get("t1", 1.0); tstep: float = example.get("tstep", None)

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
                    logger.error(f"[run_example # {example.name}] The timeout argument must be an integer, but found {argv[n+1]}")
            elif argv[n] == "-o":
                output = argv[n+1]; n += 2
            elif argv[n] == "-p":
                profile = True; n += 1
            elif argv[n] == "-s": # percentage slope
                try:
                    new_s = float(argv[n+1])
                    if percentage_slope is None:
                        percentage_slope = []
                    percentage_slope.append(new_s); n+=2
                except ValueError:
                    logger.error(f"[run_example # {example.name}] The slope argument must be a float, but found {argv[n+1]}")
            elif argv[n] == "-e": # epsilons
                try:
                    new_e = float(argv[n+1])
                    if epsilons is None:
                        epsilons = []
                    epsilons.append(new_e); n+=2
                except ValueError:
                    logger.error(f"[run_example # {example.name}] The epsilon argument must be a float, but found {argv[n+1]}")
            elif argv[n] == "-sample":
                try:
                    sample_points = int(argv[n+1]); n+=2
                except ValueError:
                    logger.error(f"[run_example # {example.name}] The number of samples argument must be an integer, but found {argv[n+1]}")
            elif argv[n] == "-th":
                try:
                    threshold = float(argv[n+1]); n+=2
                except ValueError:
                    logger.error(f"[run_example # {example.name}] The threshold argument must be a float, but found {argv[n+1]}")
            elif argv[n] == "-i":
                if not argv[n+1] in ("slope", "epsilon"):
                    logger.error(f"[run_example # {example.name}] The type of input argument must be one of ['slope','epsilon'], but found {argv[n+1]}")
                else:
                    type_example = argv[n+1]; n+=2
            elif argv[n] == "-t0":
                try:
                    t0 = float(argv[n+1]); n+=2
                except ValueError:
                    logger.error(f"[run_example # {example.name}] The initial time argument must be a float, but found {argv[n+1]}")
            elif argv[n] == "-t1":
                try:
                    t1 = float(argv[n+1]); n+=2
                except ValueError:
                    logger.error(f"[run_example # {example.name}] The ending time argument must be a float, but found {argv[n+1]}")
            elif argv[n] == "-tstep":
                try:
                    tstep = float(argv[n+1]); n+=2
                except ValueError:
                    logger.error(f"[run_example # {example.name}] The time-step argument must be a float, but found {argv[n+1]}")
    except IndexError:
        logger.error("Invalid format of arguments. Check 'run' command in the help")
        return

    ## Checking arguments
    profile = example.profile_path(SCRIPT_DIR) if profile else profile
    if t1 < t0: t0,t1 = t1,t0
    tstep = (t1-t0)/200 if tstep is None else tstep
    output = sys.stdout if output == "stdout" else sys.stderr if output == "stderr" else output

    if percentage_slope != None and type_example != "slope":
        logger.warning(f"[run_example # {example.name}] Slopes provided but example is not of type 'slope'")
    if type_example == "slope":
        percentage_slope = example.get("slopes", [1.0]) if percentage_slope is None else percentage_slope
        if not isinstance(percentage_slope, (list,tuple)):
            percentage_slope = len(example.observables)*[[percentage_slope]]
        elif isinstance(percentage_slope, (list,tuple)) and any(not isinstance(el, (tuple, list)) for el in percentage_slope):
            percentage_slope = len(example.observables)*[percentage_slope]
        elif not len(percentage_slope) == len(example.observables):
            logger.error(f"[run_example # {example.name}] Slopes must be a list of length {len(example.observables)} of lists or arbitrary length")
    if type_example == "percentage_epsilon":
        percentage_epsilon = example.get("percentage_epsilon", [0.1]) if percentage_epsilon is None else percentage_epsilon
        if not isinstance(percentage_epsilon, (list,tuple)):
            percentage_epsilon = len(example.observables)*[[percentage_epsilon]]
        elif isinstance(percentage_epsilon, (list,tuple)) and any(not isinstance(el, (tuple, list)) for el in percentage_epsilon):
            percentage_epsilon = len(example.observables)*[percentage_epsilon]
        elif not len(percentage_epsilon) == len(example.observables):
            logger.error(f"[run_example # {example.name}] Epsilon percentages must be a list of length {len(example.observables)} of lists or arbitrary length")

    if type_example == "percentage_size":
        percentage_size = example.get("percentage_size", [0.1]) if percentage_size is None else percentage_size
        if not isinstance(percentage_size, (list,tuple)):
            percentage_size = len(example.observables)*[[percentage_size]]
        elif isinstance(percentage_size, (list,tuple)) and any(not isinstance(el, (tuple, list)) for el in percentage_size):
            percentage_size = len(example.observables)*[percentage_size]
        elif not len(percentage_size) == len(example.observables):
            logger.error(f"[run_example # {example.name}] Size percentages must be a list of length {len(example.observables)} of lists or arbitrary length")

    if epsilons != None and type_example != "epsilon":
        logger.warning(f"[run_example # {example.name}] Epsilons provided but example is not of type epsilon")
    if type_example == "epsilon":
        epsilons = example.get("epsilons", [1.0]) if epsilons is None else epsilons
        if not isinstance(epsilons, (list,tuple)):
            epsilons = len(example.observables)*[[epsilons]]
        elif isinstance(epsilons, (list,tuple)) and any(not isinstance(el, (tuple, list)) for el in epsilons):
            epsilons = len(example.observables)*[epsilons]
        elif not len(epsilons) == len(example.observables):
            logger.error(f"[run_example # {example.name}] Epsilons must be a list of length {len(example.observables)} of lists or arbitrary length")

    # if type_example == "analysis":
        # mid_points = example.get("mid_points", 20 ) if mid_points is None else mid_points
    ## Running the requested example
    if not output.parent.exists():
        logger.log(60, f"[run_example # {example.name}] Creating output directory: {output.parent}")
        output.parent.mkdir(parents=True)
        img_dir = output.parent / "images"
        logger.log(60, f"[run_example # {example.name}] Creating output images directory: {img_dir}")
        img_dir.mkdir(parents=True)

    with (open(output, "w") if output not in (sys.stdout, sys.stderr) else nullcontext()) as output:
        logger.log(60, f"[run_example # {example.name}] Running example type: {type_example}")
        with Profile() if profile else nullcontext() as pr:
            if type_example == "slope":
                __run_exact(example, read, matrix, observables, timeout, output, percentage_slope,None,
                            sample_points, threshold, t0, t1, tstep)
            elif type_example == "epsilon":
                __run_exact(example, read, matrix, observables, timeout, output, None,epsilons,
                            sample_points, threshold, t0, t1, tstep)
            elif type_example == "percentage_epsilon":
                __run_exact(example, read, matrix, observables, timeout, output, None, epsilons,
                            sample_points, threshold, t0, t1, tstep, percentage_epsilon)
            elif type_example == "percentage_size":
                __run_exact(example, read, matrix, observables, timeout, output, None, epsilons,
                            sample_points, threshold, t0, t1, tstep,percentage_epsilon, percentage_size=percentage_size)
            elif type_example == "analysis":
                __run_analysis(example = example,
                               read=read, matrix=matrix, observables=observables,timeout=timeout, output=output, num_points=sample_points, threshold=threshold, mid_points=mid_points, epsilon_min=epsilon_min, epsilon_max=epsilon_max)
            elif type_example == "perturbed":
                __run_perturbed()
            else:
                logger.error(f"[run_example # {example.name}] The type of example is not recognized: {type_example}")

        ## Saving the profile (if requested)
        if profile:
            if not Path(profile).parent.exists():
                Path(profile).parent.mkdir(parents=True)

            stats = pstats.Stats(pr)
            stats.sort_stats(pstats.SortKey.TIME)
            stats.dump_stats(filename=profile)

    return

def __run_exact(
        example: Example, read: str, matrix: str, observables: dict[str,list[str]], timeout: int, output: TextIOBase, 
        percentage_slope: list[list[float]], epsilons: list[list[float]], sample_points: int, threshold: float, t0: float, t1: float, tstep: float, percentage_epsilon: list[list[float]],percentage_size: list[list[float]]
):
    ##############################################################################
    ### Reading the system
    logger.log(60, f"[run_exact # {example.name}] Reading the system both exactly and numerical")
    system = FODESystem(file=example.path_model(), read_ic = True, parser=read)
    RRsystem = FODESystem(file=example.path_model(), read_ic = True, parser=example.read, field=RR)
    logger.log(60, f"[run_exact # {example.name}] Removing the parameters of the system")
    system = system.remove_parameters_ic()
    RRsystem = RRsystem.remove_parameters_ic()

    ##############################################################################
    ### Obtaining the initial condition
    logger.log(60, f"[run_exact # {example.name}] Obtaining the initial condition from the system")
    x0 = array([float(system.ic.get(v, 0)) for v in system.variables])
    norm_x0 = norm(x0, ord=2)
    fx0 = array(RRsystem.derivative(..., *x0), dtype=x0.dtype)
    norm_fx0 = norm(fx0, ord=2)
    logger.log(60, f"[run_exact # {example.name}] Initial state of the problem: ||x_0|| = {norm_x0} -- ||f(x_0)|| = {norm_fx0}")

    ##############################################################################
    ### Building the observables from the example
    logger.log(60, f"[run_exact # {example.name}] Building observables")
    observables = {view_name : [SparsePolynomial.from_string(s, system.variables, system.field) for s in obs_set] for (view_name, obs_set) in example.observables.items()}
    observable_matrices = {view_name :SparseRowMatrix.from_vectors([obs.linear_part_as_vec() for obs in observable]) for view_name, observable in observables.items()}

    ##############################################################################
    ### Checking if there is something to execute
    if percentage_slope == None and epsilons == None and percentage_epsilon == None and percentage_size == 0:
        logger.error(f"[run_exact # {example.name}] No slopes nor epsilons are provided!!")
    if percentage_slope != None:
        num_executions = sum(len(el) for el in percentage_slope)
    elif percentage_epsilon != None:
        num_executions = sum(len(el) for el in percentage_epsilon)
    elif percentage_size != None:
        num_executions = sum(len(el) for el in percentage_size)
    else:
        num_executions=sum(len(el) for el in epsilons)

    if num_executions == 0:
        logger.warning(f"[run_exact # {example.name}] No executions for this example. Finishing execution")
        return

    ##############################################################################
    ### Checking the linearity of the observables
    final_observables = {}
    for (view_name,observable) in observables.items():
        if any(not obs.is_linear() for obs in observable):
            logger.error(f"The view ({view_name}) has a non-linear input. Skipping this example.")
        else:
            final_observables[view_name] = observable
    observables = final_observables
    if len(observables) == 0:
        logger.error(f"No valid observables found for this example. Finishing execution.")
        return

    ##############################################################################
    ### Computing the exact lumping for the observables -- reusing the matrix computation
    logger.log(60, f"[run_exact # {example.name}] Computing the exact lumping for each view")
    exact_lumpings = {}
    for view_name, observable in observables.items():
        exact = system.lumping(observable, method=matrix,print_system=False,print_reduction=False)
        if not exact.is_consistent():
            logger.error(f"[run_exact # {example.name}] Exact lumping for {view_name} is NOT CONSISTENT!!")
            raise RuntimeError
            return
        exact_lumpings[view_name] = exact
    RRsystem._lumping_matr[example.matrix] = tuple(M.change_base(RR) for M in system._lumping_matr[matrix])

    ##############################################################################
    ### Creating the Results structures
    logger.log(60, f"[run_exact # {example.name}] Creating the result structures")
    results : list[ResultNumericalExample] = []
    for i, (view_name, observable) in enumerate(observables.items()):
        O = observable_matrices[view_name]; exact_lumping = exact_lumpings[view_name]
        kwds = {"observable_matrix": O, "x0": x0, "norm_x0": norm_x0, "norm_fx0": norm_fx0,
                "system": system, "num_system": RRsystem, "exact_lumping": exact_lumping,
                "t0": t0, "t1": t1, "tstep": tstep, "threshold": threshold, "sample_points": sample_points}
        if percentage_slope != None:
            for percentage in percentage_slope[i]:
                kwds["percentage"] = percentage
                results.append(ResultNumericalExample(example, observable, view_name, **kwds))
        elif percentage_epsilon != None:
            for percentage in percentage_epsilon[i]:
                kwds["percentage_epsilon"] = percentage
                results.append(ResultNumericalExample(example, observable, view_name, **kwds))
        elif percentage_size != None:
            for percentage in percentage_size[i]:
                kwds["percentage_size"] = percentage
                results.append(ResultNumericalExample(example, observable, view_name, **kwds))
        elif epsilons != None:
            kwds["considered_epsilon"] = 1
            for epsilon in epsilons[i]:
                kwds["epsilon"] = epsilon
                results.append(ResultNumericalExample(example, observable, view_name, **kwds))


    ##############################################################################
    ### Running examples
    logger.log(60, f"[run_exact # {example.name}] Running each of the cases")
    for result in results:
        logger.log(60, f"[run_exact # {example.name}] Computing (if needed) epsilon for \n\t{repr(result)}")
        try:
            with Timeout(timeout):
                result.epsilon
        except TimeoutError:
            logger.error(f"[run_exact # {example.name}] Timeout of {timeout} reached while computing optimal epsilon for \n\t{repr(result)}. Trying next.")
            continue
        logger.log(60, f"[run_exact # {example.name}] Computing numerical lumping for \n\t{repr(result)}")
        try:
            with Timeout(timeout):
                result.numerical_lumping
        except TimeoutError:
            logger.error(f"[run_exact # {example.name}] Timeout of {timeout} reached while computing numerical lumping for \n\t{repr(result)}. Trying next.")
            continue

        logger.log(60, f"[run_exact # {example.name}] Generating output for \n\t{repr(result)}")
        result.write_result(output)
        logger.log(60, f"[run_exact # {example.name}] Generating images for \n\t{repr(result)}")
        result.generate_image()
        logger.log(60, f"[run_exact # {example.name}] Finished execution for \n\t{repr(result)}")

def __run_analysis(example: Example,
                   read: str, matrix: str, observables: list[str], timeout: float,
                   output: TextIOBase,
                   num_points: int = 1000, threshold: float = 1e-6,
                   mid_points: int = 20, epsilon_min = None, epsilon_max = None
                   ):
    logger.log(60, f"[run_analysis # {example.name}] Starting epsilon analysis for {example.name}")
    system = FODESystem(file=example.path_model(), read_ic = True, parser=read)
    RRsystem = FODESystem(
        file=example.path_model(), read_ic = True, parser=example.read, field = RR)
   
    logger.log(60, f"[run_analysis # {example.name}] Removing the parameters of the system")
    system = system.remove_parameters_ic()
    RRsystem = RRsystem.remove_parameters_ic()

    logger.log(60, f"[run_analysis # {example.name}] Obtaining Jacobian matrices for exact system... (shared among examples)")
    system.construct_matrices(matrix)
    RRsystem._lumping_matr[example.matrix] = tuple(M.change_base(RR) for M in system._lumping_matr[matrix]) 

    logger.log(60, f"[run_analysis # {example.name}] Obtaining the initial condition from the system")
    x0 = array([float(RRsystem.ic.get(v, 0)) for v in RRsystem.variables])
    norm_x0 = norm(x0, ord=2)

    logger.log(60, f"[run_analysis # {example.name}] Building observables")
    observables = {view_name : [SparsePolynomial.from_string(s, system.variables, system.field) for s in obs_set] for (view_name, obs_set) in example.observables.items()}

    final_observables = {}
    for (view_name,observable) in observables.items():
        if any(not obs.is_linear() for obs in observable):
            logger.error(f"The view ({view_name}) has a non-linear input. Skipping this example.")
        else:
            final_observables[view_name] = observable
    observables = final_observables

    if len(observables) == 0:
        logger.error(f"No valid observables found for this example. Finishing execution.")
        return


    ## Creating the matrices for lumping
    logger.log(60, f"[run_analysis # {example.name}] Building matrices for observables")
    observable_matrices = {view_name :SparseRowMatrix.from_vectors([obs.linear_part_as_vec() for obs in observable]) for view_name, observable in observables.items()}

    ## Processing the bound for sampling 
    logger.log(60, f"[run_analysis # {example.name}] Processing bound for sampling...")

    results : list[AnalysisExample] = list()
    ## Generating results structures
    for (view_name,observable) in observables.items():
        results.append(AnalysisExample(example, observable, observable_name=view_name, observable_matrix = observable_matrices[view_name], max_perturbation = None,
                 x0 = x0, norm_x0 = norm_x0, norm_fx0 = None, system = system, num_system = RRsystem, 
                 exact_lumping = None, size = system.size, exact_size = None, threshold = threshold,
                 sample_points = num_points, max_epsilon = None, max_dev = None,
                 ## FROM ANALYSIS EXPERIMENT
                 epsilons = None, sizes = None, deviations = None, mid_points = mid_points, time_total = None, timeout = timeout, epsilon_min = epsilon_min, epsilon_max=epsilon_max
        ))

    for result in results:
        logger.log(60, f"[run_analysis # {example.name}] Generating output for \n\t{repr(result)}")
        result.write_result(output)
        logger.log(60, f"[run_analysis # {example.name}] Generating images for \n\t{repr(result)}")
        result.generate_image()
        logger.log(60, f"[run_analysis # {example.name}] Finished execution for \n\t{repr(result)}")

def __run_perturbed():
    logger.error("NotImplementedError: The example of perturbed models is not implemented")
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
        "will compile all the results from the defined examples in 'data.json' to a CSV. No arguments are allowed.\n"
        "--------------------------------------------------------------------------------------------------------------------------\n"
        "\tpython3 clue_example.py run <<example>> [-r ()] [-m ()] [-t ()] [-o ()] [-p ()] [-i ()] [-s ()]* [-sample ()] \n"
        "\t                                        [-th ()] [-t0 ()] [-t1 ()] [-tstep ()]\n"
        "executes the given example with the given arguments, where the options mean:\n"
        "  * -r     : defines the reading algorithm for the given example. Only 'polynomial', 'rational' and 'sympy' are allowed.\n"
        "  * -m     : defines the algorithm to compute matrices for lumping. Only 'polynomial', 'rational' and 'auto_diff' are allowed.\n\n"
        "  * -t     : defines a timeout for parts of the execution. Must be a float.\n"
        "  * -o     : defines an output file for saving the result of the example. It must be a valid PATH or 'stdout' or 'stderr'.\n"
        "  * -p     : defines whether a profile will be saved for this execution.\n"
        "  * -i     : defines the type of example to be executed. It can be 'slope', 'epsilon' or 'perturbed'.\n"
        "  * -s     : defines the argument of slopes (for examples of type 'slope'). Several can be given and must be always floats.\n"
        "  * -sample: defines number of samples used to compute deviation of systems.\n"
        "  * -th    : defines a threshold to compare floats to be equal. Must be a float.\n"
        "  * -t0    : defines the initial time for simulations. Must be a float\n"
        "  * -t1    : defines the time horizon for simulations. Must be a float.\n"
        "  * -tstep : defines time steps for simulations. Must be a float.\n"
        "--------------------------------------------------------------------------------------------------------------------------\n"
        "--------------------------------------------------------------------------------------------------------------------------\n"
        )

if __name__ == "__main__":
    try:
        if len(sys.argv) > 1 and sys.argv[1] == "list":
            list_examples(*sys.argv[2:])
        elif len(sys.argv) > 1 and sys.argv[1] == "add":
            add_examples_in_folder(*sys.argv[2:])
        elif len(sys.argv) > 1 and sys.argv[1] == "compile":
            compile_results(*sys.argv[2:])
        elif len(sys.argv) > 1 and sys.argv[1] == "run":
            run_example(*sys.argv[2:])
        else:
            print_help()
    except KeyboardInterrupt:
        logger.error(f"[numerical_example] Process interrupt by user.")
    sys.exit(0)
