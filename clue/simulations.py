r'''
    Module to extend the functionality of simulations to the CLUE differential systems.
'''
from matplotlib.pyplot import subplots
from numpy import array, concatenate, matmul, ndarray
from scipy.integrate._ivp.ivp import OdeResult
from typing import Collection

def apply_matrix(simulation : OdeResult, matrix : ndarray):
    ##############################################################################################
    ## Checking the matrix argument
    if not isinstance(matrix, ndarray):
        matrix = array(matrix)
    if len(matrix.shape) != 2:
        raise TypeError("The 'matrix' argument is not valid: it does not have a matrix shape")
    elif matrix.shape[1] != len(simulation.y):
        raise TypeError(f"The 'matrix' argument is not valid: wrong number of columns [got {matrix.shape[1]}, expected {len(simulation.y)}]")

    ##############################################################################################
    ## Building the new simulation
    kwds = {key : simulation.__getattr__(key) for key in dir(simulation)}
    kwds["y"] = matmul(matrix, simulation.y)

    ## Building the new names
    if hasattr(simulation, "names"):
        names = simulation.names
        new_names = []
        for row in matrix: ## TODO: Fix this
            if all(el == 0 for el in row):
                new_names.append("0")
            else:
                parts = []
                for i in range(len(row)):
                    c = row[i]; v = names[i]
                    if c != 0 and len(parts) == 0:
                        parts.append(f"{'-' if c < 0 else ''}{'' if c in (1, -1) else f'{abs(c)}*'}{v}")
                    elif c != 0:
                        parts.append(f"{'+ ' if c > 0 else '- '}{'' if c in (1,-1) else f'{abs(c)}*'}{v}")
                new_names.append(" ".join(parts))
        kwds["names"] = new_names
        
    return OdeResult(**kwds)

def merge_simulations(sim1 : OdeResult, sim2 : OdeResult):
    if (sim1.t == sim2.t).all():
        kwds = {
            "message" : "merged simulation",
            "success" : sim1.success and sim2.success,
            "t" : sim1.t,
            "y" : concatenate((sim1.y, sim2.y))
        }
        if all(hasattr(sim, "names") for sim in (sim1,sim2)): kwds["names"] = list(sim1.names) + list(sim2.names)
        return OdeResult(**kwds)
    raise TypeError("Incompatible simulations to be merged")

def create_figure(simulation : OdeResult, names : str | Collection[str] = "x", format : str = "o-"):
    r'''
        Method to create a matplotlib figure from a simulation.

        Given some data from a simulation using :func:`scipy.integrate.solve_ivp` it is very common to
        display it result on a graphical view. This method automatizes this procedure so it is simpler to
        see the simulation on a new window.

        INPUT:

        * ``simulation``: a :class:`scipy.integrate._ivp.ivp.OdeResult` with a simulation.
        * ``name``: name for the functions we are simulation. It is an optional argument (by default "x").

        OUTPUT:

        A figure that can be display using method ``show``.
    '''
    n = len(simulation["y"]) # number of output functions
    m = len(simulation["t"]) # number of time steps

    names = simulation.names if hasattr(simulation, "names") else names if isinstance(names, (list,tuple)) else [f"{names}{i+1}" for i in range(n)]

    # Computing the interval for time
    xinterval = (simulation["t"][0], simulation["t"][-1])
    
    # Computing the interval for values
    ymin = (min(min(simulation["y"][i][j] for j in range(m)) for i in range(n))) - 0.1
    ymax = (max(max(simulation["y"][i][j] for j in range(m)) for i in range(n))) + 0.1
    yinterval = (ymin, ymax)

    fig, ax = subplots(1,1, figsize=(8,4))
    for i in range(n):
        ax.plot(simulation['t'], simulation['y'][i], format, label=names[i])

    ax.legend(); ax.set_xlim(*xinterval); ax.set_ylim(*yinterval)
    return fig