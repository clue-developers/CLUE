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
                values += [el for el in range(int(limits[0]), int(limits[1])+1)]
            else:
                values += [int(value)]
        return list(set(values))

    @staticmethod
    def process_doi(doi):
        if(doi.find("doi.org/") > 0):
            return doi.split("doi.org/")[1]
        return doi

    def __init__(self, name, type, ref_title, ref_doi, range=None, json=None):
        self.__name = name
        self.__type = type
        self.__range = Model.process_range(range)
        self.__title = ref_title
        self.__doi = Model.process_doi(ref_doi)
        self.__json = json

    def __getattr__(self, name):
        if name in self.__json:
            return self.__json[name]

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
        if range != None and not (range in self.range):
            raise IndexError("The index %d is not valid for the ranged model %s" %(range, self.name))

        full_path = [script_dir, self.type]
        if "path" in self.__json: full_path.append(self.__json["path"])
        full_path.append(f"{self.name}{f'[{range}]' if (range != None) else ''}.ode")

        return os.path.join(*full_path)

    def range_as_str(self):
        result = []; open_range = []; rng = self.range
        for i in range(len(rng)):
            if len(open_range) > 0:
                if open_range[-1] + 1 == rng[i]: # we increase the range
                    open_range.append(rng[i])
                else:
                    if len(open_range == 1):
                        result.append(f"{open_range[0]}")
                    else:
                        result.append(f"{open_range[0]}..{open_range[-1]}")
                    open_range = [rng[i]]
        return ",".join(result)

    def as_json(self):
        json = {"type": self.type, **self.__json}

        if len(self.range) > 0: json["range"] = self.range_as_str()
        if self.title != '': json["ref_title"] = self.title
        if self.doi != '': json["ref_doi"] = self.doi

        return self.name, json

script_dir = os.path.dirname(__file__) if __name__ != "__main__" else "./"
with open(os.path.join(script_dir,'data.json')) as f:
    data = json.load(f)
    models = {key : Model(
        key, 
        data[key].pop("type", ''),
        data[key].pop("ref_title", ''),
        data[key].pop("ref_doi", ''),
        data[key].pop("range", ''),
        json = data[key]
    ) for key in data}
    
def get_model(name):
    return models[name]

def add_folder(folder, type, title_gen = None, doi_gen = None, subs=False):
    r'''
        Adds a new folder to the JSON file (only the files in the folder are added)
    '''
    print(f"# Adding folder {folder}")
    folder_path = os.path.join(script_dir, type, folder)
    json_entries = {}
    for file in os.listdir(folder_path):
        if file.endswith(".ode"): # it is a ODE file
            name = file.removesuffix(".ode")
            print(f" ## Processing file {name}...")
            if "[" in name: # the model has a range
                parts = name.split("[")
                name = parts[0]
                index = int(parts.split("]")[0])
            else:
                index = None
            if name in json_entries and (index is None or (len(json_entries[name].range) == 0)):
                raise ValueError("Found an entry with conflicting range conditions")
            elif name in json_entries: # we add the new range
                print(f"  #### Found a new range value for {name}")
                json_entries[name]._Model__range.append()
            else: # we create a new entry
                print(f"  #### Found a new entry for {name}")
                json_entries[name] = Model(
                    name, 
                    type,
                    "" if title_gen is None else title_gen(name), 
                    "" if doi_gen is None else doi_gen(name),
                    "" if index is None else [index],
                    {"path" : folder}
                )
    # we sort all the ranges for the models
    print(" ## Sorting entries in range...", end=" ")
    for model in json_entries.values():
        model._Model__range.sort()
    print("Done")

    print(" ## Adding files to the variable ``models``...")
    changed = False
    for (name, model) in json_entries.items():
        if not name in models or subs:
            models[name] = model
            changed = True
        elif not subs and name in models:
            print(f"  #### Model {name} already in the json file -- no substitution required")
    print(f" ## Finished the addition of models to ``models`` (with changes = {changed})")
    
    if changed:
        print(" ## Dumping data...", end=" ")
        with open(os.path.join(script_dir,'data.json'), "w") as f: 
            json.dump({name : model.as_json()[1] for (name, model) in models.items()}, f, indent=4)
        print("Done")

## Script area
if __name__ == "__main__":
    import sys
    from contextlib import redirect_stdout, nullcontext
    from datetime import datetime

    if len(sys.argv) > 1 and sys.argv[1] == "add":
        subs = False; folders = []; type="polynomial"; logfile = None
        args = sys.argv[2:]
        i = 0
        while i < len(args):
            if args[i] in ("-s", "--s", "-subs", "--subs"):
                subs = True
                i += 1
            elif args[i] in ("-t", "--t", "-type", "--type"):
                type = args[i+1]
                i += 2
            elif args[i] in ("-l", "--l", "-logfile", "--logfile"):
                logfile = args[i+1]
                i += 2
            else:
                folders.append(args[i])
                i += 1

        print(f"Running 'adding folder' with arguments:\n\t- {folders=}\n\t- {type=}\n\t- {subs=}")
        if logfile != None:
            print(f"## Requested output in logfile {logfile}")
            logfile = open(os.path.join(script_dir, logfile+".log"), "a")
            logfile.write((f"______________________________________________________________________________________\n"
                            f"--- New execution {datetime.now()}\n"
                            f"______________________________________________________________________________________\n"))

        with redirect_stdout(logfile) if logfile != None else nullcontext():
            for folder in folders:
                add_folder(folder, type, subs=subs)
        
        if logfile != None:
            logfile.write((f"______________________________________________________________________________________\n"
                            f"--- Ending execution {datetime.now()}\n"
                            f"______________________________________________________________________________________\n"))
            logfile.close()
    elif len(sys.argv) > 1 and sys.argv[1] == "readme" or len(sys.argv) == 1:
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

                printed = 0
                for model in by_types[type]:
                    if(model.title in ("", None) and not model.doi in ("", None)): # no title but doi
                        readme.write(f"* {model.name}: [{model.doi}](https://doi.org/{model.doi})\n")
                        printed += 1
                    elif(model.doi in ("", None) and not model.title in ("", None)): # no doi but title
                        readme.write(f"* {model.name}: {model.title}\n")
                        printed += 1
                    elif(any((not el in ("", None)) for el in (model.title, model.doi))): # both title and doi
                        readme.write(f"* {model.name}: [{model.title}](https://doi.org/{model.doi})\n")
                        printed += 1

                if printed != len(by_types[type]):
                    extra_data = "\n\nSome of the models do not have any reference, but are still included:\n"
                    readme.write(extra_data)
                    for model in by_types[type]:
                        if(all(el in ("", None) for el in (model.title, model.doi))): # no reference
                            readme.write(f"* {model.name}: No reference\n")
                readme.write("\n")
