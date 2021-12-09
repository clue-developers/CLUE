## File to process all the csv and create summarized version of them
## The results will a table with a 3 column key (branch, model)
## and the columns will index the timing taken. There will be the following columns (8 in total)
## time to read (one per algorithm), time to compute matrices (one per algorithm), time to lumping

import csv, os, sys

from math import sqrt

class Stats:
    def __init__(self, data : list):
        # Checking input
        if(len(data) == 0):
            raise TypeError("No data to compute stats")
        self._data = [float(d) for d in data] # casting everything to float. Raising error if something is not on format

        # Generating values
        self._m = min(data)
        self._M = max(data)
        self._avg = sum(data)/len(data)
        self._var = sum((self._avg - d)**2 for d in data)/len(data)
        self._std_dev = sqrt(self._var)

    @property
    def min(self): return self._m
    @property
    def max(self): return self._M
    @property
    def avg(self): return self._avg
    @property
    def var(self): return self._var
    @property
    def std_der(self): return self._std_der
    @property
    def size(self): return len(self._data)

    def merge(self, other):
        if(other is None):
            return self
        return Stats(self._data + other._data)

def process_file(path_file):
    r'''
        Read a file and generate data for the three columns
    '''
    with open(path_file, "r") as file:
        reader = csv.reader(file, delimiter=";")
        data = [[],[],[]]
        line_count = 0
        for row in reader:
            if(line_count == 0): # header line
                line_count += 1
            else:
                tr, tm, tl = [
                                float("NaN") if el  == "Error" else float("infinity") if el == "Not finished" else float(el) 
                             for el in row]

                data[0].append(tr); data[1].append(tm); data[2].append(tl) 
            
        return [Stats(d) for d in data]

if __name__ == "__main__":
    directory = "./results"
    output = {}
    for file in os.listdir(directory):
        if(file.endswith(".csv") and file != "summary.csv"):
            print("#### Processing file %s" %file)
            st_read, st_mat, st_lum = process_file(os.path.join(directory, file))
            ## Do something
            fragments = file.split(".")[0].split("_")
            model, branch, ralg = fragments[0], fragments[1], fragments[2]
            malg = "_".join(fragments[3:])

            if(not (branch, model) in output):
                output[(branch, model)] = [None for _ in range(9)]

            ## Updating reading stats
            if(ralg == "polynomial"): output[(branch, model)][0] = st_read.merge(output[(branch, model)][0])
            if(ralg == "rational"): output[(branch, model)][1] = st_read.merge(output[(branch, model)][1])
            if(ralg == "sympy"): output[(branch, model)][2] = st_read.merge(output[(branch, model)][2])

            ## Updating building matrices stats
            if(malg == "polynomial"): output[(branch, model)][3] = st_mat.merge(output[(branch, model)][3])
            if(malg == "rational"): output[(branch, model)][4] = st_mat.merge(output[(branch, model)][4])
            if(malg == "random"): output[(branch, model)][5] = st_mat.merge(output[(branch, model)][5])
            if(malg == "auto_diff"): output[(branch, model)][6] = st_mat.merge(output[(branch, model)][6])

            ## Updating lumping stats
            if(ralg != "sympy" and malg in ("polynomial", "rational")): 
                output[(branch, model)][7] = st_lum.merge(output[(branch, model)][7])
            else: 
                output[(branch, model)][8] = st_lum.merge(output[(branch, model)][8])
            
    # Writing the processed data
    columns = ["branch", "model", "read:poly", "read:rat", "read:sympy", "mat:poly", "mat:rat", "mat:random", "mat:auto_diff", "lump_det", "lump_rand"]
    data = []
    for key,value in output.items():
        data.append([key[0],key[1]] + ["f{%s}" %st.avg if st != None else "None" for st in value])

    with open("./results/summary.csv", "w") as file:
        writer = csv.writer(file, delimiter=";")
        writer.writerow(columns)
        for row in data:
            writer.writerow(row)
    
    sys.exit(0)


