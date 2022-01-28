## File to process all the csv and create summarized version of them
## The results will a table with a 3 column key (branch, model)
## and the columns will index the timing taken. There will be the following columns (8 in total)
## time to read (one per algorithm), time to compute matrices (one per algorithm), time to lumping

import csv, os, sys

def treat_data(data):
    r''''
        Manipulate the data to cast it (if possible) to a float
    '''
    try:
        return float(data)
    except ValueError:
        if(data == "--"):
            return (None,None)
        if(data.startswith(">")):
            return (">", float(data[1:]))
        if(data == "Error"):
            return ("Error", None)

def special_average(data):
    r'''
        Computes a special average considering special possible inputs
    '''
    float_data = [el for el in data if isinstance(el, float)]
    other_data = [el for el in data if not el in float_data]

    avg = sum(float_data)/len(float_data)

    if len(other_data) == 0 or all(el[0] is None for el in other_data): # nothing special
        return avg
    
    if(any(el[0] == "Error" for el in other_data)):
        return f"Error ({avg})"

    max_timeout = max([el[1] for el in other_data if el[0]==">"])
    return f">{max_timeout}"

def process_file(path_file):
    r'''
        Read a file and generate data for the three columns
    '''
    with open(path_file, "r") as file:
        reader = csv.reader(file, delimiter=",")
        data = [[],[],[],[]]
        line_count = 0
        for row in reader:
            if(line_count == 0): # header line
                line_count += 1
            else:
                tr, tm, tl, tt = [treat_data(el) for el in row]

                data[0].append(tr); data[1].append(tm); data[2].append(tl); data[3].append(tt) 
            
        return [special_average(d) for d in data]

def process_mmk_file(path_file):
    r'''
        Read a file and generate data for the four columns of the mmk file
    '''
    with open(path_file, "r") as file:
        reader = csv.reader(file, delimiter=",")
        data = {}
        line_count = 0
        for row in reader:
            if(line_count == 0): # header line
                line_count += 1
            else:
                n, tr, tm, tl, tt = [treat_data(el) for el in row]
                n = int(n)
                if not n in data:
                    data[n] = [[],[],[],[]]

                data[n][0].append(tr); data[n][1].append(tm); data[n][2].append(tl); data[n][3].append(tt) 
            
        return {key : [special_average(d) for d in data[key]] for key in data}

if __name__ == "__main__":
    directory = "./results"
    output = {}
    for file in os.listdir(directory):
        if(file.endswith(".csv") and file != "summary.csv" and file != "MMK.results.csv"):
            print("#### Processing file %s... " %file, end="")
            data = process_file(os.path.join(directory, file))
            ## getting the information of the model
            fragments = file.split(".")[0].split("_")
            model, ralg = fragments[0], fragments[1]
            malg = "_".join(fragments[2:])

            if((model, ralg, malg) in output): 
                raise ValueError("the same model and algorithms are treated twice: IMPOSSIBLE!!")

            output[(model, ralg, malg)] = data
            print("Finished.")
        if(file == "MMK.results.csv"):
            print("#### Processing file %s... " %file, end="")
            data = process_mmk_file(os.path.join(directory, file))
            for key in data:
                model = f"MMK[{key}]"; ralg = "sympy"; malg = "auto_diff"
                output[(model,ralg,malg)] = data[key]
            print("Finished.")


    # Writing the processed data
    columns = ["model", "RALG", "MALG", "read", "matrix", "lumping", "total"]
    data = []
    for key,value in output.items():
        data.append(list(key) + list(value))

    with open("./results/summary.csv", "w") as file:
        writer = csv.writer(file, delimiter=",")
        writer.writerow(columns)
        for row in data:
            writer.writerow(row)
    
    sys.exit(0)


