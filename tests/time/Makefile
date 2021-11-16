SHELL:=/bin/bash
REPETITIONS=10

FOLDER=results
EXT=results.txt
BASE=rational
TEST=caching
CURRENT:=$(shell echo $$(git rev-parse --abbrev-ref HEAD))

FILES=BIOMD0000000013 BIOMD0000000023 BIOMD0000000033

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
		python3 $@.py >> $(FOLDER)/$@_$(BASE).$(EXT) ; \
		(( rep = rep + 1 )) ; \
	done
	@echo "## Moving to $(TEST) branch"
	@git checkout $(TEST)
	@rep=1 ; while [[ $$rep -le $(REPETITIONS) ]]; do \
		echo -ne "Executing repetition $$rep/$(REPETITIONS) in branch $(TEST)...\r" ; \
		python3 $@.py >> $(FOLDER)/$@_$(TEST).$(EXT) ; \
		(( rep = rep + 1 )) ; \
	done
	@echo -e "\nFinished"
	@echo "## Returning to original branch..."
	@git checkout $(CURRENT)
	@echo "####################################################################################"
