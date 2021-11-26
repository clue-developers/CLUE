## Examples of exact reduction with CLUE

This folder contains examples of applying CLUE to several models appearing in literature. 
Each model is in a separate folder, there are up to four files corresponding to each model:
* `ModelName.ode` is the specification of the model in [ERODE](https://www.erode.eu) format
* `ModelName.py` reads the model from the `\*.ode` file and applies CLUE
* `resultsModelName.txt` is the output of `ModelName.py`, i.e., the reduced model.

The folder `RationalFunctions` include a set of models with their corresponding `*.ode`, `*.py` and 
`results*.txt` in which the right hand side of the differential systems are rational functions 
(instead of polynomials).

Below are the references to the original papers for some of the models:
* ProteinPhosphorylation: [Efficient modeling, simulation and coarse-graining of biological complexity with NFsim](https://doi.org/10.1038/nmeth.1546)
* OrderedPhosphorylation: [Domain-oriented reduction of rule-based network models](https://dx.doi.org/10.1049%2Fiet-syb%3A20070081)
* BIOMD0000000504: [A computer simulation approach to assessing therapeutic intervention points for the prevention of cytokine‐induced cartilage breakdown](https://doi.org/10.1002/art.38297)
* Barua: [A bipolar clamp mechanism for activation of Jak-family protein tyrosine kinases](http://dx.doi.org/10.1371/journal.pcbi.1000364)
* MODEL1001150000: [A dynamic model of interactions of Ca2+, calmodulin, and catalytic subunits of Ca2+/calmodulin-dependent protein kinase II](https://doi.org/10.1371/journal.pcbi.1000675)
* MODEL8262229752: [A stochastic model of Escherichia coli AI‐2 quorum signal circuit reveals alternative synthesis pathways](https://dx.doi.org/10.1038/msb4100107)
* fceri_ji: [Investigation of Early Events in FceRI-Mediated Signaling Using a Detailed Mathematical Model](https://doi.org/10.4049/jimmunol.170.7.3769)
