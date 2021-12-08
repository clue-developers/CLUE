SHELL:=/bin/bash
REPETITIONS=10

FOLDER=results
EXT=results.csv
BRANCH=rational
CURRENT:=$(shell echo $$(git rev-parse --abbrev-ref HEAD))

RALG=sympy
MALG=auto_diff
TIME=1000

FILES=BIOMD0000000013 BIOMD0000000023 BIOMD0000000033
BIOMD0000000013_OBS=x_CO2
BIOMD0000000023_OBS=Fru
BIOMD0000000033_OBS=freeEGFReceptor

## Rules of the makefile
all: $(FILES)
	@echo "Finished all the tests"

clean:
	@rm -f ./reslts/*.$(EXT)

%:
	@echo "####################################################################################"
	@echo "## Running test for $@"
	@echo "####################################################################################"
	@echo "## Moving to $(BASE) branch"
	@git checkout $(BASE)
	@rep=1 ; while [[ $$rep -le $(REPETITIONS) ]]; do \
		echo -ne "Executing repetition $$rep/$(REPETITIONS) in branch $(BASE)...\r" ; \
		python3 test_time.py $@ $(FOLDER)/$@_$(BASE)_$(RALG)_$(MALG).$(EXT) --r $(RALG) --m $(MALG) --t $(TIME) $($@_OBS) ; \
		(( rep = rep + 1 )) ; \
	done
	@echo -e "\nFinished"
	@echo "## Returning to original branch..."
	@git checkout $(CURRENT)
	@echo "####################################################################################"
