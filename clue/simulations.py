r'''
    Module to extend the functionality of simulations to the CLUE differential systems.
'''
from math import ceil
from matplotlib.pyplot import subplots
from numpy import array, concatenate, diff, inf, matmul, ndarray, nditer
from numpy.linalg import norm
from scipy.integrate._ivp.ivp import OdeResult
from typing import Collection

from .linalg import SparseRowMatrix

def apply_matrix(simulation : OdeResult, matrix : ndarray | SparseRowMatrix):
    ##############################################################################################
    ## Checking the matrix argument
    if isinstance(matrix, SparseRowMatrix):
        matrix = array(matrix.to_list())
    elif not isinstance(matrix, ndarray):
        matrix = array(matrix)
    if len(matrix.shape) != 2:
        raise TypeError("The 'matrix' argument is not valid: it does not have a matrix shape")
    elif matrix.shape[1] != len(simulation.y):
        raise TypeError(f"The 'matrix' argument is not valid: wrong number of columns [got {matrix.shape[1]}, expected {len(simulation.y)}]")
    matrix = matrix.astype(simulation.y.dtype)

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

def compare_simulations(sim1 : OdeResult, sim2 : OdeResult, measures=[]):
    r'''
        Method to generate a new simulation with the difference between two simulations.

        This method also computes the different measures of differences between the two 
        simulations. The available measures are:
        
        * A list of valid measures
        * Any function that will work with the corresponding tensors.
        * ``"l2avg"`` (default): a normalized L2 norm will be computed normalized by the size of the simulation interval.
        * ``"l1avg"``: a normalized L1 norm will be computed normalized by the size of the simulation interval.
        * ``"loo"``: a L-`\infty` norm will be used to compare the two simulations.
        * ``"l2"``: a normalized L2 norm will be computed to compare the two simulations.
        * ``"l1"``: a normalized L1 norm will be computed to compare the two simulations.
    '''
    if sim1.y.shape != sim2.y.shape:
        raise ValueError("The two simulations are not comparable")

    # Basic values for the new simulation
    new_t = sim1.t
    new_y = sim1.y - sim2.y
    new_status = sim1.status
    new_message = "difference between two simulations"
    success = sim1.success and sim2.success
    names = sim1.names if hasattr(sim1, "names") else sim2.names if hasattr(sim2, "names") else None

    # Creating object for comparison
    sim = OdeResult(t=new_t, y=new_y, 
                     status=new_status, message=new_message, success=success)

    # Computing the measures (if required)
    if not isinstance(measures, (tuple, list)):
            measures = [measures]
    array_to_measure = None
    if len(measures) > 0:
        array_to_measure = ((sim.y[...,:-1] + sim.y[...,1:])/2 * diff(sim.t))
        lt = sim.t.max() - sim.t.min()
    for i in range(len(measures)):
        measure = measures[i] # getting the i-th element
        if isinstance(measure, str):
            if measure == "l2avg":
                measure = lambda arr : norm(arr, 2, -1)/lt
            elif measure == "l1avg":
                measure = lambda arr : norm(arr, 1, -1)/lt
            elif measure == "loo":
                measure = lambda arr : norm(arr, inf, -1)
            elif measure == "l2":
                measure = lambda arr : norm(arr, 2, -1)
            elif measure == "l1":
                measure = lambda arr : norm(arr, 1, -1)
            measures[i] = measure

    if names != None: sim.names = names

    measuring = [measure(array_to_measure) for measure in measures]
    
    return sim, measuring
 
def create_figure(simulation : OdeResult | Collection[OdeResult], names : str | Collection[str] = "x", legend=True, **kwds):
    r'''
        Method to create a matplotlib figure from a simulation.

        Given some data from a simulation using :func:`scipy.integrate.solve_ivp` it is very common to
        display it result on a graphical view. This method automatizes this procedure so it is simpler to
        see the simulation on a new window.

        INPUT:

        * ``simulation``: a :class:`scipy.integrate._ivp.ivp.OdeResult` with a simulation (or a collection of those)
        * ``names``: name for the functions we are simulation. It is an optional argument (by default "x").
        * ``kwds``: optional arguments that will be use for improving or changing the figure. The valid options are:
            - ``title``: provides title(s) for the plot(s) in the figure
            - ``format``: provides the format(s) for the lines in the figure
            - ``force_unsuccess``: boolean to force the creation of a figure even when the simulation was not successful
            - Any other argument that will passed to subplots

        OUTPUT:

        A figure that can be display using method ``show``.
    '''
    ## Processing all the arguments
    if not isinstance(simulation, (list,tuple)):
        simulation = [simulation]
        format = [kwds.pop("format", "o-")]
        title = [kwds.pop("title", "Plot")]
    else:
        simulation = list(simulation)
        format = kwds.pop("format", len(simulation)*["o-"])
        title = kwds.pop("title", len(simulation)*["Plot"])
    force_unsuccess = kwds.pop("force_unsuccess", True)

    if any(not sim.success for sim in simulation) and not force_unsuccess:
        raise ValueError("The simulation was not successful. Impossible to create figure")

    names = [sim.names if hasattr(sim, "names") else names if isinstance(names, (list, tuple)) else [f"{names}{i+1}" for i in range(len(sim.y))] for sim in simulation]

    ##########################################################################################
    ### TREATMENT OF ARGUMENTS FOR PLOTTING
    ##########################################################################################
    # Computing the interval for time
    if kwds.get("sharex", False):
        xinterval = len(simulation)*[(min(sim.t.min() for sim in simulation), max(sim.t.max() for sim in simulation))]
    else:
        xinterval = [(sim.t.min(), sim.t.max()) for sim in simulation]    
    
    # Computing the interval for values
    yinterval = []
    for sim in simulation:
        ymin, ymax = sim.y.min(), sim.y.max()
        padding = 0.01*(ymax-ymin)
        ymin, ymax = ymin - padding, ymax + padding
        yinterval.append((ymin, ymax))

    # Computing the grid dimension
    nrows = ceil(len(simulation)/3)
    ncols = min(len(simulation), 3)

    figsize = (8*ncols, 4*nrows)

    ###########################################################################################
    ### CREATING THE FIGURE
    ###########################################################################################
    fig, ax = subplots(nrows, ncols, figsize = figsize, **kwds)
    for i,a in enumerate(nditer(ax, ("refs_ok",))): # iterating by rows through all subplots
        if i >= len(simulation): break # we do not fill all the plots if there are not enough
        a = a.item() # removing the numpy.ndarray class
        for j in range(len(simulation[i].y)):
            format_to_use = format[i] if not isinstance(format[i], (tuple, list)) else format[i][j]
            a.plot(simulation[i].t, simulation[i].y[j], format_to_use, label=names[i][j])
        if i == 0 and legend:
            a.legend()
        a.title.set_text(title[i]); a.set_xlim(*xinterval[i]); a.set_ylim(*yinterval[i])
        
    return fig

def sim_to_IO_format(simulation : OdeResult, tstep : float = .0, what : str = "derivative"):
    r'''
        Method to transform a simulation into a input-output table

        A simulation provide plenty of data for training something starting from a 
        first order differential system. The input are the values at a point and the output are
        the values after the time step.

        Hence, we need to link every vector on the simulation with the next one. 

        INPUT: 
        
        * ``simulation``: a :class:`scipy.integrate._ivp.ivp.OdeResult` with a simulation.
        * ``tstep``: we will take only the data from a simulation that has a distance at least ``tstep``. If set
          to 0, then all steps in the simulation are included.
        * ``what``: the type of data we will extract from the simulation. It can be either ``"value"`` 
          for extracting the value for the next time step, or it can be ``"derivative"`` to extract the 
          approximate derivative at a point.

        OUTPUT:

        A list containing 2-tuples with format (input, output).
    '''
    if not simulation.success:
        return []
    
    t = simulation.t
    m = len(t) # number of time steps
    y = simulation.y.transpose() # each row is the value of each function at a time from `t`

    if what == "value": # the data is the next position in time
        output = [(y[i], y[i+1]) for i in range(m-1) if t[i+1] - t[i] > 0.9*tstep]
    elif what == "derivative": # the data is the derivative of the point
        output = [(y[i], (y[i+1] - y[i])/(t[i+1]- t[i])) for i in range(m-1) if t[i+1] - t[i] > 0.9*tstep]
    else:
        raise ValueError("The requested data (see argument ``what``) is not recognized.")
    return output

__all__ = ["apply_matrix", "merge_simulations", "compare_simulations", "create_figure", "sim_to_IO_format"]