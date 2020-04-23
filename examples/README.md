## Examples of exact reduction with CLUE

This folder contains examples of applying CLUE to several models appearing in literature. 
Each model is in a separate folder, there are up to four files corresponding to each model:
* `ModelName.py` contains the model in the format accepted by CLUE and the code that performs the reduction
* `resultsModelName.txt` is the output of `ModelName.py`, i.e., the reduced model.
* *(optional)* `ModelName.ode` is the specification of the model in [ERODE](https://www.erode.eu) format
* *(optional, for large models)* `ModelName.poly` a separate file containing the right-hand side of the system which is parsed and loaded by `ModelName.py`

The header in `ModelName.py` file contains information about the model's origin (e.g., url or paper).

The following examples have been used as case studies in the paper "CLUE: Exact maximal reduction of kinetic models by constrained lumping of differential equations"

* `MODEL0000000504` and `BIOMD0000000504` in Section 4.1
* `ProteinPhosphorylation` in Section 4.2
* `OrderedPhosphorylation` in Section 4.3
