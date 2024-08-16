from clue import *
from clue.numerical_domains import RR
import numpy as np
from cProfile import Profile
import pandas as pd
import signal,random,time,json,pstats,logging

random.seed(30)

logger = logging.getLogger("clue." + __name__)
logger.setLevel(logging.DEBUG)

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


def _perturb_values(values, noiseFn):
    return {k: v*noiseFn() for k, v in values.items()} 

def from_perturbed_parameters(model, values, noise):
    model.normalize()

    # checking we do not have non-parameters in the list
    for specie in model.species:
        if specie in values:
            raise ValueError(
                f"Can not evaluate the variable {specie} [it is not a parameter]"
            )

    # removing unnecessary values
    values = {k: v for (k, v) in values.items() if k in model.pars}
    indices_parameters = [model.variables.index(k) for k in values]

    # computing the new equations --> we remove the equations from the evaluated parameters
    new_equations = [
        model.eval_equation(i, _perturb_values(values, noise))
        for i in range(model.size)
        if not (i in indices_parameters)
    ]

    # computing the new observables (if any)
    new_observables = (
        None
        if model.observables == None
        else model.eval_equation(model.observables, values)
    )

    # computing the remaining variables
    new_variables = [
        model.variables[i] for i in range(model.size) if (not i in indices_parameters)
    ]

    # removing parameters from initial conditions (if any)
    if model.ic is None:
        new_ic = {}
    else:
        new_ic = {k: v for (k, v) in model.ic.items() if (not k in values)}

    # setting the new name
    new_name = None
    if model.name != None:
        new_name = f"{model.name}_perturbed" # f"{model.name}_evaluated[{';'.join(f'{k}->{v}' for (k,v) in values.items())}]"

    # returning the resulting system
    return FODESystem(
        new_equations,  # the equations has less variables
        new_observables,  # the observables are also evaluated
        new_variables,  # the remaining variables
        ic = new_ic,  # the initial values do not have the evaluated parameters
        name = new_name,  # we keep the name of the system
    )

def remove_parameters(model: FODESystem) -> FODESystem:
    zero_ind = [ i for i in range(model.size) if model.equations[i] == '0'] 
    new_pars = [model.variables[i] for i in zero_ind]
    new_eqs = [ v for (i,v) in enumerate(model.equations) if i  not in zero_ind]
    return FODESystem(equations=new_eqs, 
                      variables=model.variables,
                      pars=new_pars)

def run_simulations(low, high):
    simulations = []
    results = []

    for i in range(low,high):
        path=f'../../models/polynomial/ProteinPhosphorylation[{i}].ode'
        logger.info(f"Running example {path}")
        PP2 = FODESystem(file=path, field=RR)
        result = {}
        keys = ['name', 
                'size',
                'reduction_size',
                'iterations',
                'lumping_time',
                'exact_sim_time',
                'lumped_sim_time',
                'error_T',
                'error_relative_T',
                'max_error',
                'max_epsilon'
                ]
        result = {k: None for k in keys}

        result['name'] = PP2.name
        result['size'] = PP2.size
        logger.info(f"Succesfully loaded model {PP2}")

        initial_conditions = {'S0': 300.0, 'S1': 300.0, 'S2': 3000.0}
        params = {'kOnE': 0.7, 'kOffE':  3.0, 'kCatE': 5.0, 'kOnF': 0.7,'kOffF': 3.0, 'kCatF': 5.1}

        pert_fn = lambda: random.uniform(0.95, 1.05)
        
        PP2_pert = remove_parameters(PP2)
        PP2_pert = from_perturbed_parameters(PP2_pert, params, pert_fn)
        PP2_pert.set_ic(initial_conditions, fill=True)
        result['max_epsilon']  = PP2_pert.find_maximal_threshold(['S0'], matrix_algorithm='polynomial')

        logger.info(f"Maximum Epsilon {result['max_epsilon']} for model {PP2.name}")

        logger.info(f"Intiating lumping for model {PP2.name}")
        try:
            with Timeout(60*60*60):
                time_0 = time.time()
                lumped, tries = PP2_pert.app_lumping(['S0'], max_size=10, threshold=1e-2, with_tries=True, out_format='internal', relative_search=True)
                print(lumped)
                time_lumping = time.time()-time_0
                result['reduction_size'] = lumped.size
                result['iterations'] = tries
                result['lumping_time'] = time_lumping
        except TimeoutError:
            logger.error(f'Lumping for model {PP2.name} timed out')
            results.append(result)
            continue

        n=100
        tend=2e-3
        tstep=tend/n

        logger.info(f"Intiating exact simulations for model {PP2.name}")
        try:
            with Timeout(6*60*60):
                time_0 = time.time()
                sim1 = PP2_pert.simulate(0,tend,view=["S0"], method='LSODA',tstep=tstep)
                time_sim1 = time.time()-time_0
                result['exact_sim_time'] = time_sim1
        except TimeoutError:
            logger.error(f'Exact simulation for model {PP2.name} timed out')
            results.append(result)
            continue

        logger.info(f"Intiating reduced simulations for model {PP2.name}")
        try:
            with Timeout(60*60*60):
                time_0 = time.time()
                sim2 = lumped.simulate(0,tend,view=['y0'], method='LSODA',tstep=tstep)
                time_sim2 = time.time()-time_0
                result['lumped_sim_time'] = time_sim2
        except TimeoutError:
            logger.error(f'Reduced simulation for model {PP2.name} timed out')
            results.append(result)
            continue

        sims = {'exact': [sim1.t, np.array(sim1.y[0])], 'reduced': [sim2.t, np.array(sim2.y[0])]}
        sims_data= pd.DataFrame.from_dict(sims)

        error = sim1.y[0] - sim2.y[0]

        max_error = max(abs(error))

        result['error_T'] = abs(error[-1])
        result['error_relative_T'] = abs(error[-1]/sim1.y[0][-1])
        result['max_error'] = max_error
        results.append(result)
        logger.info(f"Finished model {PP2.name} with results {result}")

        name = f'results[{i}]-compiled'

        logger.info(f"Saving results to {name}.json")

        with open('./phosphorylation/results/'+name+'.json', 'w', encoding='utf-8') as f:
            json.dump(result, f, ensure_ascii=False, indent=4)

        simulations.append((sim1,sim2))
        results.append(result)
    return simulations, results



if __name__ == "__main__":
    low = int(sys.argv[1])
    high = int(sys.argv[2]) if len(sys.argv) > 2 else low+1 
    results = []

    with Profile() as pr: 
        simulations, results = run_simulations(low,high)
        stats = pstats.Stats(pr)
        stats.dump_stats(filename=f'./phosphorylation/profiles/perturbed[{low}-{high}].prf')
    
    # for sims in simulations:
        # sim1,sim2= sims
        # merged = merge_simulations(sim1,sim2)
        # create_figure(merged)

