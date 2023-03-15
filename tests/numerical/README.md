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
* `type_input`: indicates the meaning of the `slope` argument. If it starts with 
  "slope", then the epsilon will be computed using a heuristic. If it is "epsilon", the 
  values will be used directly as epsilons. If not given, `slope-brute` is used as
  default.
* `slopes`: see `type_input` for further information. It can be a float or a list of 
  floats. If nothing is given, the value "1.0" is used as default. We always recommend 
  fixing this value.
* `t0`, `t1`, `tstep`: arguments for the time span in the simulations. If not given, we 
  use "0.0", "1.0" and "None" will be used as default.