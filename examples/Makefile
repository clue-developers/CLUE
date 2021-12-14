SHELL:=/bin/bash

FOLDERS=Barua.f BIOMD0000000504.f fceri_ji.f MODEL1001150000.f MODEL8262229752.f OrderedPhosphorylation.f ProteinPhosphorylation.f RationalFunctions.f

all: $(FOLDERS)
	@echo "Finished all the folders"
	
%.f:
	@echo "######################################"
	@echo "Running all the models in $(basename $@)..."
	@$(MAKE) -C $(basename $@)
	@echo "Finished the models in $(basename $@)"
	@echo "######################################"