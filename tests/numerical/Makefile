ALL=$(shell python3 numerical_example.py list)
POLY=$(shell python3 numerical_example.py list -p)
RATIONAL=$(shell python3 numerical_example.py list -r)
GOOD=ProteinPhosphorylation[2] BioNetGen_CCP BIOMD0000000448 BIOMD0000000437 BIOMD0000000488 BIOMD0000000634
CMSB=CMSB2023[0] CMSB2023[1] CMSB2023[2] 
PYTHON=python3
FLAGS=-p -t 600 

all: $(ALL)
	@echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	@echo "Finished all examples"
	@echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

cmsb: $(CMSB)
	@echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	@echo "Finished all examples from the CMSB paper"
	@echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"


good: $(GOOD)
	@echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	@echo "Finished good examples"
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

%:
	$(PYTHON) numerical_example.py run $@ $(FLAGS)
