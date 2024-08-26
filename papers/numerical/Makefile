ALL=$(shell python3 numerical_example.py list)
POLY=$(shell python3 numerical_example.py list -p)
RATIONAL=$(shell python3 numerical_example.py list -r)
PYTHON=python3
FLAGS=-p -t 600 

setup:
	@mkdir -v -p paper/polynomial/images paper/polynomial/profiles paper/rational/images paper/rational/profiles paper/simulations/ phosphorylation/profiles phosphorylation/results

all: $(ALL)
	@echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	@echo "Finished all examples"
	@echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

poly: $(POLY)
	@echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	@echo "Finished all polynomial examples"
	@echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

rational: $(RATIONAL)
	@echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	@echo "Finished all rational examples"
	@echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

uncertain: $(UNCERTAIN)
	@echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	@echo "Finished all examples for uncertain systems"
	@echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

compile:
	@python3 numerical_example.py compile

clean:
	@echo "Removing result files..."
	@find . -name "*.example.txt" -type f -delete
	@echo "Removing images..."
	@find . -name "*.png" -type f -delete
	@echo "Removing execution profiles..."
	@find . -name "*.prf" -type f -delete
	@echo "Removing CSV files..."
	@find . -name "*.csv" -type f -delete
	@echo "Removing simulation files..."
	@find ./json_results/ -name "*.json" -type f -delete
	@find ./phosphorylation/ -name "*.json" -type f -delete

reproduce:$(ALL)
	@FLAGS="-t 600"
	@python3 numerical_example.py compile 
	@python3 phosphorylation.py 2 6 
	@echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	@echo "Reproduced all examples. Compiled results are available in 'compilation.csv'."
	@echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"


%:
	 $(PYTHON) numerical_example.py run $@ $(FLAGS)
