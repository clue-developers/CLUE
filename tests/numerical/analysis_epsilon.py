import sys

sys.path.insert(0,"./../tests/numerical") # clue_example is here
sys.path.insert(0,"./../") # clue is here

from clue import *
from clue import SparsePolynomial
from numerical_example import *
from sympy import RR

import pandas as pd
import time
from alive_progress import alive_bar

import logging
logger = logging.getLogger("clue")
# logger.setLevel(logging.DEBUG)

def analysis_epsilon(example, num_points = 1000, threshold = 1e-6, mid_points=50):
    ## Reading the system
    logger.info(f"[analysis_epsilon # {example.name}] Starting epsilon analysis for {example.name}")
    system = FODESystem(file=example.path_model(), read_ic = True, parser=example.read).remove_parameters_ic()
    RRsystem = FODESystem(
        file=example.path_model(), read_ic = True, parser=example.read, field = RR).remove_parameters_ic()
    x0 = array([float(RRsystem.ic.get(v, 0)) for v in RRsystem.variables])
    norm_x0 = norm(x0, ord=2)
    
    ## Creating the matrices for lumping
    logger.info(f"[analysis_epsilon # {example.name}] Building matrices for lumping...")
    system.construct_matrices(example.matrix)
    RRsystem._lumping_matr.update({k: tuple([M.change_base(RR) for M in v]) for (k,v) in system._lumping_matr.items()})
    
    ## Processing observables
    logger.info(f"[analysis_epsilon # {example.name}] Building observables...")
    observables = [[SparsePolynomial.from_string(obs, RRsystem.variables, RRsystem.field) for obs in observable] for observable in example.observables]
    ORR = [tuple([obs.linear_part_as_vec().change_base(RR) for obs in observable]) for observable in observables]
    
    ## Processing the bound for sampling 
    logger.info(f"[analysis_epsilon # {example.name}] Processing bound for sampling...")
    bound = RRsystem._FODESystem__process_bound(norm_x0, threshold)
    
    ## Gathering data
    all_data = []
    for observable, O in zip(observables, ORR):
        logger.info(f"[analysis_epsilon # {example.name}] Computing data for {observable}...")
        if any(not poly.is_linear() for poly in observable):
            logger.info(f"[analysis_epsilon # {example.name}] {observable} is not linear. It will be skipped.")
            continue
        max_epsilon, max_deviation = RRsystem.find_maximal_threshold(observable, bound, num_points, threshold, matrix_algorithm=example.matrix);
        max_epsilon, max_deviation
        eps_vs_devs = []

        ## First iteration is the exact lumping
        subspace = find_smallest_common_subspace(system.construct_matrices(example.matrix), tuple(M.change_base(system.field) for M in O), OrthogonalSubspace)
        deviation = RRsystem._deviation(subspace, bound, num_points)
        eps_vs_devs.append((0.0, deviation, subspace))
        ## Other iterations use the numerical lumping
        for i in range(1,mid_points+1):
            epsilon = max_epsilon * (i/(mid_points-1))
            subspace = find_smallest_common_subspace(RRsystem.construct_matrices(example.matrix), O, NumericalSubspace, delta=epsilon)
            deviation = RRsystem._deviation(subspace, bound, num_points)
            eps_vs_devs.append((epsilon, deviation, subspace))
        all_data.append([eps_vs_devs, max(el[1] for el in eps_vs_devs), (system.size, eps_vs_devs[0][2].dim())])

    ## Generating graphics
    logger.info(f"[analysis_epsilon # {example.name}] Generating graphics...")
    graphs, titles = [], []
    for obs, (eps_vs_devs, mdev, (osize,lsize)) in zip(example.observables, all_data):
        x_axis = array([el[0] for el in eps_vs_devs])
        data = array([[el[1]/mdev if mdev != 0 else 0, el[2].dim()] for el in eps_vs_devs]).transpose()
        graphs.append(OdeResult(t=x_axis, y=data, success=True, names=["deviation", "(num size)/(exact size)"]))
        titles.append(f"Lumping evolution for {str(obs) if len(str(obs)) < 100 else 'something'} ({osize}->{lsize})")
        
    fig = create_figure(graphs, title=titles)
    
    logger.info(f"[analysis_epsilon # {example.name}] Finished execution for {example.name}")
    return all_data
