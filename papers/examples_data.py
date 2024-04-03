from __future__ import annotations

import json, logging, os

from itertools import product
from functools import lru_cache

import models.models_data
from typing import TextIO

logger = logging.getLogger("clue." + __name__)
logger.setLevel(logging.DEBUG)

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
    def __init__(self, name, read=None, matrix=None, observables=None, **kwds):
        self.__name = name
        self.__read = read
        self.__matrix = matrix
        self.__observables = observables

        self.__ref = kwds.pop("ref", None)
        self.__json = kwds

        self.__valid = False

        # if self.__ref == None and (self.__read == None or self.__matrix == None or self.__observables == None):
            # raise ValueError("Without references the arguments 'read', 'matrix' and 'observables' are mandatory")

        self.__solved = False

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
    def model(self): return self.__json.get("model", self.ref.get("model", None)) if self.ref != None else self.__json.get("model", self.name)
    @property
    def range(self): return self.__json.get("range", self.ref.get("range", None)) if self.ref != None else self.__json.get("range", None)
    @property
    def ref(self): return self.__ref
    @property
    def valid(self):
        if not (self.ref == None and (self.read == None or self.matrix == None or self.observables == None)):
            self.__valid = True
        return self.__valid



    def solve_reference(self, context: dict[str, Example]): 
        if not self.__solved:
            self.__solved = True
            if self.ref == None:
                self.__solved = True
            elif not self.ref in context: 
                raise KeyError(f"The reference {self.ref} was not found in given context")
            else: # if there is a reference and is found
                self.__ref = context[self.ref]
                self.ref.solve_reference(context)
                ## Checking for circular references
                current = self.ref
                while(current != None):
                    if current.name == self.name:
                        raise KeyError(f"Circular reference found for {self.name}")
                    current = current.ref
                    
                if self.read == None: self.__read = self.ref.read
                if self.matrix == None: self.__matrix = self.ref.matrix
                if self.observables == None: self.__observables = self.ref.observables
             
    def get(self, attribute: str, default):
        # we first look it in self
        try:
            if hasattr(self, attribute):
                return self.__getattr__(attribute)
            elif self.__solved and self.ref != None: # we look in the reference if exists
                return self.ref.get(attribute, default)
            else: 
                return default
        except AttributeError as e:
            return default

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
    def results_path(self, basedir, read = None, matrix = None,extra=None):
        return os.path.join(
            self.base_path(basedir), 
            f"[result{f'#{extra}' if extra != None else ''}]{self.base_file_name(read, matrix)}{Example.ResultExtension}"
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
        elif hasattr(self.ref, name):
            return self.ref.get(name, None)
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

def Load_Examples_Folder(dir: str, examples_json: str = 'data.json', valid_read: list[str] = None, valid_matrix: list[str] = None) -> tuple[dict[str,Example], list[tuple[str,str,str]]]:
    valid_read = VALID_READ if valid_read is None else valid_read
    valid_matrix = VALID_MATRIX if valid_matrix is None else valid_matrix
    examples = {}
    with open(os.path.join(dir,examples_json)) as f:
        data = json.load(f)
        examples = {}
        for key in data:
            example = Example(key, **data[key])
            if example.valid:
                examples[key] = example
            else:
               logger.error(f'[Load_Examples_Folder] Example {key} is not a valid example. Make sure it has a valid ref or all three read, matrix, and observables fields')

    for example in examples.values():
        example.solve_reference(examples)

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
        
