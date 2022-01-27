## Models prepared for CLUE

This folder contains models that can be read directly with CLUE in order to 
perform exact reduction. Each model is specified in `*.ode` format (see [ERODE](https://www.erode.eu)).

The folder is split into two different classes of models:
* **Polynomial models**: the folder `polynomial` contains the example models with Polynomial dynamics. This means
  that the corresponding differential system has a polynomial right-hand side and a direct approach can be used
  (see [this paper](https://doi.org/10.1093/bioinformatics/btab010)).
* **Rational models**: the folder `rational` contains the example models with Rational dynamics, i.e., the differential
  systems associated with them have a right-hand side with rational functions. CLUE provides both a deterministic and a 
  probabilistic approach to handle these models (see [this paper](http://www.lix.polytechnique.fr/Labo/Gleb.POGUDIN/files/rational.pdf)).

Check the `README` files in each folder for a further detail and documentation on each of the models.

We include the file `data.json` file to unify the access to these models and provide an easy way to update the database 
in the future. Also, the script `models_data.py` will update the `README.md` files in the inner folders to include the new models and
references. With all of these, in order to add a new model the following procedure must be done:
1. Add the `.ode` file to the corresponding folder.
2. Add the data to `data.json` with the following fields:
    * Name: must coincide with the name of the folder
    * Type: either `polynomial` or `rational`. This indicates the folder to find the model.
    * Range: in case there are several files associated with this model. The name of the `.ode` files must be "{name}({range})".
    * Reference (title): title of the reference paper. May be empty.
    * Reference (doi): doi link to the reference paper. May be empty.
3. Run in this folder the script `models_data.py` by using the command `python3 models_data.py`.