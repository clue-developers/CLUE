SHELL:=/bin/bash

MODELS=e2 e3 e4 e5 e6 e7 e8

all: $(MODELS)
	@echo "Finished all the models"
	
%:
	@python3 PP.py $@ > results_$@.txt