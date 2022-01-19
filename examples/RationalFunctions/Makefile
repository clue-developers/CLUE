SHELL:=/bin/bash

MODELS=BIOMD0000000013 BIOMD0000000023 BIOMD0000000033 BIOMD0000000033_sympy MODEL1502270000

all: $(MODELS)
	@echo "Finished all the models"
	
%:
	@python3 $@.py > results$@.txt