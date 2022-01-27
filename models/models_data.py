import json, os

class Model:
    @staticmethod
    def process_range(rng):
        ## No range case
        if(rng in (None, "")):
            return []

        ## We first remove spaces
        rng = rng.replace(" ", "")
        separate_values = rng.split(",")
        values = []
        for value in separate_values:
            if(value.find("..") > 0):
                limits = value.split("..")
                values += [el for el in range(int(limits[0]), int(limits[1]))]
            else:
                values += [int(value)]
        return list(set(values))

    @staticmethod
    def process_doi(doi):
        if(doi.find("doi.org/") > 0):
            return doi.split("doi.org/")[1]
        return doi

    def __init__(self, name, type, ref_title, ref_doi, range=None):
        self.__name = name
        self.__type = type
        self.__range = Model.process_range(range)
        self.__title = ref_title
        self.__doi = Model.process_doi(ref_doi)

    @property
    def name(self): return self.__name
    @property
    def type(self): return self.__type
    @property
    def range(self): return self.__range
    @property
    def title(self): return self.__title
    @property
    def doi(self): return self.__doi

    def path(self, range=None):
        if(len(self.range) == 0):
            return os.path.join(script_dir, f"{self.type}/{self.name}.ode")
        elif(range in self.range):
            return os.path.join(script_dir, f"{self.type}/{self.name}[{range}].ode")
        
        raise IndexError("The index %d is not valid for the ranged model %s" %(range, self.name))

script_dir = os.path.dirname(__file__) if __name__ != "__main__" else "./"
with open(os.path.join(script_dir,'data.json')) as f:
    data = json.load(f)
    models = {key : Model(key, **data[key]) for key in data}
    
## Script area
if __name__ == "__main__":
    ## Reading and sorting the models
    by_types = {}
    for key in models:
        model = models[key]
        if(not model.type in by_types):
            by_types[model.type] = []
        by_types[model.type] += [model]

    ## We create a README.md file for each type
    for type in by_types:
        by_types[type].sort(key=lambda m: m.name.upper())
        with open(os.path.join(script_dir,f"{type}/README.md"), "w") as readme:
            ## First part of the file
            header = (f"## {type.capitalize()} Models\n\n"
                            "This folder contains a sequence of `.ode` files with different models from the [BioModels]"
                            f"(https://www.ebi.ac.uk/biomodels/) database whose dynamics are of type `{type}`. "
                            "The name of each model is either given by the theme of the model or the name in the database.\n\n"
                            "Below are the references to the original papers for some of the models:\n")
            readme.write(header)
            for model in by_types[type]:
                if(all(el in ("", None) for el in (model.title, model.doi))): # no reference
                    readme.write(f"* {model.name}: No reference\n")
                elif(model.title in ("", None)): # no title but doi
                    readme.write(f"* {model.name}: [{model.doi}](https://doi.org/{model.doi})\n")
                elif(model.doi in ("", None)): # no doi but title
                    readme.write(f"* {model.name}: {model.title}\n")
                else: # both title and doi
                    readme.write(f"* {model.name}: [{model.title}](https://doi.org/{model.doi})\n")
            readme.write("\n")
