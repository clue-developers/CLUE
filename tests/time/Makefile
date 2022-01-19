SHELL:=/bin/bash
REPETITIONS=5

FOLDER=results
EXT=results.csv
BRANCH=rational
CURRENT:=$(shell echo $$(git rev-parse --abbrev-ref HEAD))

RALG=sympy
MALG=auto_diff
TIME=1000

FILES=BIOMD0000000013 BIOMD0000000023 BIOMD0000000033 Barua e7
BIOMD0000000013_OBS=x_CO2
BIOMD0000000023_OBS=Fru
BIOMD0000000033_OBS=freeEGFReceptor
Barua_OBS=aS000
e7_OBS=S0 S1

BRANCHES=rational.b
READ_ALGS=polynomial.r rational.r sympy.r
MATR_ALGS=polynomial.m auto_diff.m

## Rules of the makefile
all: $(BRANCHES)
	@echo "Finished all the tests"

clean:
	@rm -f ./results/*.$(EXT)

%.r: 
	@$(MAKE) $(FILES) RALG=$(basename $@) MALG=$(MALG) BRANCH=$(BRANCH) TIME=$(TIME)

%.m:
	@$(MAKE) $(READ_ALGS) MALG=$(basename $@) BRANCH=$(BRANCH) TIME=$(TIME)

%.b:
	@$(MAKE) $(MATR_ALGS) BRANCH=$(basename $@)

# Run polynomial models in the three categories
%.poly:
	@$(MAKE) $(basename $@) RALG=polynomial MALG=polynomial BRANCH=$(BRANCH) TIME=$(TIME)
	@$(MAKE) $(basename $@) RALG=polynomial MALG=auto_diff BRANCH=$(BRANCH) TIME=$(TIME)
	@$(MAKE) $(basename $@) RALG=sympy MALG=auto_diff BRANCH=$(BRANCH) TIME=$(TIME)

# Run rational models in the four categories
%.rat_full:
	@$(MAKE) $(basename $@) RALG=rational MALG=rational BRANCH=$(BRANCH) TIME=$(TIME)
	@$(MAKE) $(basename $@) RALG=rational MALG=random BRANCH=$(BRANCH) TIME=$(TIME)
	@$(MAKE) $(basename $@) RALG=rational MALG=auto_diff BRANCH=$(BRANCH) TIME=$(TIME)
	@$(MAKE) $(basename $@) RALG=sympy MALG=auto_diff BRANCH=$(BRANCH) TIME=$(TIME)

# Run quickly rational models in the simplest two categories
%.rat:
	@$(MAKE) $(basename $@) RALG=rational MALG=rational BRANCH=$(BRANCH) TIME=$(TIME)
	@$(MAKE) $(basename $@) RALG=sympy MALG=auto_diff BRANCH=$(BRANCH) TIME=$(TIME)

%:
	@echo "####################################################################################"
	@echo "## Running test for $@ -- [$(BRANCH)]## r=$(RALG) ## m=$(MALG) ## t=$(TIME)"
	@echo "####################################################################################"
	@echo "## Moving to $(BRANCH) branch"
	@git checkout $(BRANCH)
	@rep=1 ; while [[ $$rep -le $(REPETITIONS) ]]; do \
		echo "Executing repetition $$rep/$(REPETITIONS) in branch $(BRANCH)..." ; \
		python3 test_time.py $@ $(FOLDER)/$@_$(BRANCH)_$(RALG)_$(MALG).$(EXT) --r $(RALG) --m $(MALG) --t $(TIME) $($@_OBS) ; \
		(( rep = rep + 1 )) ; \
	done
	@echo -e "\nFinished"
	@echo "## Returning to original branch..."
	@git checkout $(CURRENT)
	@echo "####################################################################################"
