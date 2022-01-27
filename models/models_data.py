import json, os

script_dir = os.path.dirname(__file__) if __name__ != "__main__" else "./"
with open(os.path.join(script_dir,'data.json')) as f:
    data = json.load(f)
    
def model_path(name):
    for model in data:
        if(model['name'] == name):
            return os.path.join(script_dir, f"{model['type']}/{name}.ode")
    raise IndexError(f"The model {name} is not in the database")

def model_doi(model):
    doi = model['ref_doi']
    if(doi.find("doi.org/") > 0):
        return doi.split("doi.org/")[1]
    return doi

## Script area
if __name__ == "__main__":
    ## Reading and sorting the models
    data.sort(key = lambda model : (model['type'].upper(), model['name'].upper()))
    by_types = {}
    for model in data:
        if(not model['type'] in by_types):
            by_types[model['type']] = []
        by_types[model['type']] += [model]

    ## We create a README.md file for each type
    for type in by_types:
        with open(os.path.join(script_dir,f"{type}/README.md"), "w") as readme:
            ## First part of the file
            header = (f"## {type.capitalize()} Models\n\n"
                            "This folder contains a sequence of `.ode` files with different models from the [BioModels]"
                            f"(https://www.ebi.ac.uk/biomodels/) database whose dynamics are of type `{type}`. "
                            "The name of each model is either given by the theme of the model or the name in the database.\n\n"
                            "Below are the references to the original papers for some of the models:\n")
            readme.write(header)
            for model in by_types[type]:
                if(all(el in ("", None) for el in (model['ref_title'], model['ref_doi']))): # no reference
                    readme.write(f"* {model['name']}: No reference\n")
                elif(model['ref_title'] in ("", None)): # no title but doi
                    doi = model_doi(model)
                    readme.write(f"* {model['name']}: [{doi}](https://doi.org/{doi})\n")
                elif(model['ref_doi'] in ("", None)): # no doi but title
                    readme.write(f"* {model['name']}: {model['ref_title']}\n")
                else: # both title and doi
                    doi = model_doi(model)
                    readme.write(f"* {model['name']}: [{model['ref_title']}](https://doi.org/{doi})\n")
            readme.write("\n")
