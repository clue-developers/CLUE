import json, os, sys

sys.path.insert(0, "./../../") # clue, models, tests is here

import tests.examples_data as EXAMPLES
import models.models_data as MODELS

def pass_filter(filter, data):
    return filter is None or data in filter

class TimeTest:
    def __init__(self, name, type=None, inputs=None,example=None,model=None,observables=None,timeout=None):
        self.__name = name

        ## Processing the inputs we want to test for this model
        if(type in ("polynomial", "rational")):
            if(type == "polynomial"):
                self.__inputs = [["polynomial", "polynomial"], ["polynomial", "auto_diff"], ["sympy", "auto_diff"]]
            else:
                self.__inputs = [["rational", "rational"], ["rational", "auto_diff"], ["sympy", "auto_diff"]]
        else:
            ## We need the value of inputs
            self.__inputs = inputs

        ## Processing the model we are considering
        if(example != None): # a particular example is requested
            example = EXAMPLES.get_example(example)
            self.__model = example.get_model()
            self.__observables = example.observables[0]
        elif(model != None and observables != None): # a particular model and observable is requested
            self.__model = MODELS.get_model(model)
            self.__observables = observables
        else: # default case: the name gives the example already
            example = EXAMPLES.get_example(name)
            self.__model = example.get_model()
            self.__observables = example.observables[0]

        self.__timeout = 1800 if timeout is None else int(timeout)
    
    @property
    def name(self): return self.__name
    @property
    def inputs(self): return self.__inputs
    @property
    def model(self): return self.__model
    @property
    def observables(self): return self.__observables
    @property
    def timeout(self): return self.__timeout

    def get_executions(self, filter_read=None, filter_matrix=None):
        return [
            f"{self.name}~{input[0]}~{input[1]}" 
            for input in self.inputs 
            if (pass_filter(filter_read,input[0]) and pass_filter(filter_matrix, input[1]))
            ]

script_dir = os.path.dirname(__file__) if __name__ != "__main__" else "./"
with open(os.path.join(script_dir,'data.json')) as f:
    data = json.load(f)
    time_tests = {key : TimeTest(key, **data[key]) for key in data}
    
def get_test(name):
    return time_tests[name]

## Script area
if __name__ == "__main__":
    if(len(sys.argv) > 1):
        ## print all: this cancel other inputs
        if(any(el in sys.argv for el in ("-l", "--l", "-list", "--list", "-a", "--a", "-all", "--all"))):
            print(" ".join(sum([test.get_executions() for test in time_tests.values()], [])))
            sys.exit(0)

        ## Other filtering types
        filtering = {'names': [], 'read': [], 'matrix': [], 'type' : []}
        active = 'names'
        names = []
        read = []
        matrix = []
        type = []
        n = 1; nargs = len(sys.argv)
        while(n < nargs):
            if(sys.argv[n].startswith("-")):
                if(sys.argv[n] in ("-n", "--n", "-name", "--name")):
                    active = 'names'
                if(sys.argv[n] in ("-r", "--r", "-read", "--read")):
                    active = 'read'
                if(sys.argv[n] in ("-m", "--m", "-matrix", "--matrix")):
                    active = 'matrix'
                if(sys.argv[n] in ("-t", "--t", "-type", "--type")):
                    active = 'type'
            else:
                filtering[active].append(sys.argv[n])
            n+=1

        for key in filtering:
            if(len(filtering[key]) == 0):
                filtering[key] = None

        ## applying the filter
        executions = []
        for test in time_tests.values():
            if(pass_filter(filtering['names'], test.name) and pass_filter(filtering['type'], test.model.type)):
                executions += test.get_executions(filtering['read'], filtering['matrix'])
        
        print(" ".join(executions))
        sys.exit(0)
