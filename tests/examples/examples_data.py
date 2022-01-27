import json, os, sys

sys.path.insert(0, "./../../") # models_data is here

import models.models_data

class Example:
    def __init__(self, name, read, matrix, observables, model=None, range=None):
        self.__name = name
        self.__read = read
        self.__matrix = matrix
        self.__observables = observables

        self.__model = model if model != None else name
        self.__range = range

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

    def get_model(self):
        return models.models_data.models[self.model]
    def path_model(self):
        return self.get_model().path(self.range)


script_dir = os.path.dirname(__file__) if __name__ != "__main__" else "./"
examples = {}
with open(os.path.join(script_dir,'data.json')) as f:
    data = json.load(f)
    examples = {key : Example(key, **data[key]) for key in data}
    
def get_example(name):
    return examples[name]

## Script area
if __name__ == "__main__":
    if(len(sys.argv) > 1):
        if(sys.argv[1] in ("-ids", "--ids", "-list", "--list", "-l", "--l")):
            print(" ".join(examples.keys()))
        if(sys.argv[1] in ("-p", "--p", "-poly", "--poly", "-polynomial", "--polynomial")):
            print(" ".join([example.name for example in examples.values() if example.get_model().type=="polynomial"]))
        if(sys.argv[1] in ("-r", "--r", "-rat", "--rat", "-rational", "--rational")):
            print(" ".join([example.name for example in examples.values() if example.get_model().type=="rational"]))