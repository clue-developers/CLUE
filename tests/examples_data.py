import json, os

from itertools import product
from functools import lru_cache

import models.models_data
from typing import TextIO

VALID_READ = ["polynomial", "rational", "sympy", "uncertain"]
VALID_MATRIX = ["polynomial", "rational", "auto_diff"]

class Example:
    #########################################################
    ### CLASS VARIABLES
    ResultExtension = ".example.txt"
    OutSystemExtension = ".clue"
    ImageExtension = ".png"
    ProfileExtension = ".prf"

    #########################################################
    ### INIT METHOD
    def __init__(self, name, read, matrix, observables, **kwds):
        assert read in VALID_READ and matrix in VALID_MATRIX
        self.__name = name
        self.__read = read
        self.__matrix = matrix
        self.__observables = observables

        self.__model = kwds.pop("model", name)
        self.__range = kwds.pop("range", None)
        self.__json = kwds

    #########################################################
    ### PROPERTIES
    @property
    def name(self): return self.__name
    @property
    def read(self): return self.__read
    @property
    def matrix(self): return self.__matrix
    @property
    def observables(self): return self.__observables
    @property
    def model(self): return self.__model
    @property
    def range(self): return self.__range

    def get(self, attribute: str, default):
        return default if not hasattr(self, attribute) else self.__getattr__(attribute)

    #########################################################
    ### PATH METHODS
    def base_path(self, basedir):
        if hasattr(self, "out_folder"):
            return os.path.join(basedir, self.out_folder)
        else:
            return basedir

    def base_file_name(self, read = None, matrix = None, observables = None):
        read = self.read if read is None else read
        matrix = self.matrix if matrix is None else matrix
        obs_str = "" if observables == None else f"_[obs={observables}]"
        return f"{self.name}[r={read},m={matrix}]{obs_str}"

    @lru_cache(maxsize=None)
    def out_path(self, basedir, read = None, matrix = None, observables = None):
        return os.path.join(
            self.base_path(basedir), 
            "systems", 
            f"{self.base_file_name(read,matrix,observables)}{Example.OutSystemExtension}"
        )

    @lru_cache(maxsize=None)
    def image_path(self, basedir, read = None, matrix = None, extra=None):
        return os.path.join(
            self.base_path(basedir), "images",
            f"{self.base_file_name(read, matrix)}{f'[{extra}]' if extra != None else ''}{Example.ImageExtension}"
        )
    
    @lru_cache(maxsize=None)
    def results_path(self, basedir, read = None, matrix = None):
        return os.path.join(
            self.base_path(basedir), 
            f"[result]{self.base_file_name(read, matrix)}{Example.ResultExtension}"
        )

    @lru_cache(maxsize=None)
    def profile_path(self, basedir, read = None, matrix = None):
        return os.path.join(
            self.base_path(basedir), 
            "profiles",
            f"{self.base_file_name(read, matrix)}{Example.ProfileExtension}"
        )

    def is_executed(self, basedir, read = None, matrix = None):
        return os.path.exists(self.results_path(basedir,read,matrix))

    #########################################################
    ### OTHER METHODS
    def __getattr__(self, name):
        if name in self.__json:
            return self.__json[name]
        raise AttributeError(f"attribute {name} not found in the JSON")

    def get_model(self):
        return models.models_data.models[self.model]
    def path_model(self):
        return self.get_model().path(self.range)

    def as_json(self):
        json = {
            "read" : self.read,
            "matrix" : self.matrix,
            "observables" : self.observables,
            **self.__json
        }
        if self.model != self.name: json["model"] = self.model
        if self.range != None: json["range"] = self.range

        return json

def Load_Examples_Folder(dir: str, valid_read: list[str] = None, valid_matrix: list[str] = None) -> tuple[dict[str,Example], list[tuple[str,str,str]]]:
    valid_read = VALID_READ if valid_read is None else valid_read
    valid_matrix = VALID_READ if valid_matrix is None else valid_matrix
    examples = {}
    with open(os.path.join(dir,'data.json')) as f:
        data = json.load(f)
        examples = {key : Example(key, **data[key]) for key in data}

    executed_examples = [
        (name,read,matrix) 
        for (name, read, matrix) in product(examples.keys(), valid_read, valid_matrix) 
        if examples[name].is_executed(dir, read, matrix)
    ]

    return examples, executed_examples
    
def __read_parameters(file: TextIO):
    line = file.readline().strip()
    parameters = []
    while line != "end parameters":
        if line == "": raise IOError("End of file detected within block of parameters")
        parameters.append(line.split("=")[0].strip())
        line = file.readline().strip()
    
    return parameters

def __read_init(file: TextIO):
    line = file.readline().strip()
    variables = []
    while line != "end init":
        if line == "": raise IOError("End of file detected within block of init")
        variables.append(line.split("=")[0].strip())
        line = file.readline().strip()
    
    return variables

def read_variables_from_system(path:str) -> list[str]:
    with open(path, "r") as file:
        line = file.readline().strip()
        parameters = []; variables = []; not_params = True; not_init = True
        while line != "" and (not_params or not_init):
            if line.startswith("begin parameters"):
                parameters = __read_parameters(file)
                not_params = False
            if line.startswith("begin init"):
                variables = __read_init(file)
                not_init = False
            line = file.readline().strip()
    return variables + parameters
        