r'''
    Module to extend the functionality of simulations to the CLUE differential systems.
'''
from numpy.random import normal
from scipy.integrate._ivp.ivp import OdeResult

class Simulation(OdeResult):
    r'''
        Class that extends the functionality of a :class:`~scipy.integrate._ivp.ivp.OdeResult`.
    '''
    def __init__(self, *args, ode_result = None, **kwds):
        if ode_result != None:
            self.__ode_result = ode_result
        super().__init__(*args, **kwds)

    def __getattr__(self, name):
        try:
            return self.__ode_result.__getattr__(name)
        except KeyError:
            return super().__getattr__(name)

    def perturb(self, distribution = lambda val, size : normal(0, val, size), is_relative : bool = False, perturbation_val : float = 1e-4):
        r'''
            Method that perturb a simulation and creates a new simulation with different values.

            The method adds noise to a simulation using a given noise ``distribution``. We can decide
            whether to add an absolute noise or relative to the values of the simulation (by using the 
            argument ``is_relative``) and the amount of noise is then fixed by the ``pertturbation_val``.

            INPUT:

            * ``distribution``: a method or function that takes two arguments ``val`` and ``size``. The method must return a list of 
              ``size`` values using some random distribution set up by ``val``.
            * ``is_relative``: if set to ``True`` the noise will be added in proportion to the maximal difference between the values in 
              the simulation.
            * ``perturbation_val``: value for the noise to be add. If ``is_relative``, this means the proportion of the maximal difference 
              of a function. Otherwise, it is an absolute parameter.
        '''
        from numpy import max, min
        t = self.t
        m = len(t) # number of time steps

        diffs = [max(y) - min(y) for y in self.y] if is_relative else [1 for _ in self.y]

        noise = [distribution(perturbation_val*diff / 2, m) for diff in diffs]

        new_sym = Simulation(ode_result=self.__ode_result.copy())
        new_sym.y = new_sym.y + noise

        return new_sym

    def uncertain_perturbation(self, is_relative : bool = False, perturbation_val : float = 1e-4):
        r'''
            Method to create a uncertain interval from a simulation.
        '''
        from numpy import array
        return self.perturb(lambda val, size : array(size*[val]), is_relative, perturbation_val), self.perturb(lambda val, size : array(size*[val]), is_relative, -perturbation_val)

    def apply_matrix(self, matrix):
        r'''
            Method that apply a matrix to a simulation. 
            
            This means that we combine the functions simulated in ``self`` using a linear combination given by a matrix. We return a new simulation.
        '''
        from numpy import array, ndarray
        if not isinstance(matrix, ndarray):
            matrix = array(matrix)
        if len(matrix.shape) != 2: # it is not a matrix
            raise TypeError("The input 'matrix' must be a matrix (i.e., have two indices for its shape)")

        ts = self.t
        ys = self.y
        if len(ys) != matrix.shape[1]:
            raise ValueError(f"The given matrix must have {len(ys)} columns but it has {matrix.shape[1]}")

        ys = matrix*ys
        return Simulation(t=ts, y=ys, sol=self.sol, t_events=self.t_events, y_events=self.y_events,
                     nfev=self.nfev, njev=self.njev, nlu=self.nlu,
                     status=self.status, message=self.message, success=self.status >= 0)

