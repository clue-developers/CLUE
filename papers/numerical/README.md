# Approximate Constrained Lumping of Chemical Reaction Networks

The following repository contains all the experiments from the paper "Approximate Constrained Lumping of Chemical Reaction Networks".
The experiments are organized as follows:
```
numerical
├── json_results
├── paper
│   ├── polynomial
│   └── rational
├── phosphorylation
├── numerical_example.py
└── phosphorylation.py
```
The scripts `numerical_example.py` and `phosphorylation.py` are used to run the examples.
The aggregation power experiments are run using `numerical_example.py` and the experiment described in `paper.json`.
Its summary results are stored in the `paper/` folder and the consolidated results are show in `compilation.csv`.
The results for the specific simulations are stored in the `json_results/` folder.

The `phosphorylation.py` is used to run the escalability example.
Its results are stored in the `phosphorylation/` folder.

# Numerical examples

The numerical examples are compiled in the file `data.json` and allow the following arguments:

* `read` (MANDATORY): value for describing how the system is read from the system.
* `matrix` (MANDATORY): value for describing how the matrices for lumping are computed.
* `observables` (MANDATORY): a list of observable sets. It is a list of lists of strings.
* `model`: if the name of the example do not coincide with a name for a model, here we 
  indicate the name of the model associated to this example.
* `range`: if the model has a range, this argument specifies which one will be used.
* `timeout`: value for timeout for this example. If not given, no timeout is applied.
* `sample_points`: number of points to be sample when computing the deviation. If not
  given, a default value of 50 is used.
* `threshold`: numerical tolerance when checking numerical equalities. If not given, a 
  default value of "1e-6" is used.
* `type`: indicates the type of example it will execute. It may be the following: 
    - `slope`: then the epsilon will be computed using a heuristic. 
    - `epsilon`: then the values on the argument `epsilons` will be use directly as epsilons for numerical lumping.
    - `analysis`: an analysis of progressive epsilons will be generated.
* `slopes`/`epsilons`: only used if `type` is defined as `slope` or `epsilon`. Define the argument use on the exact tests. They can be a simple list or a list of lists: one for each observable.
* `t0`, `t1`, `tstep`: arguments for the time span in the simulations. If not given, we 
  use "0.0", "1.0" and "None" will be used as default.
* `sim_method`: indicates the solver used by SciPy to simulate the systems. By default, is 'RK45', but 'LSODA' tends to work faster in very stiff models.
