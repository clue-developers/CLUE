SHELL:=/bin/bash
REPETITIONS=5

FOLDER=results
EXT=results.csv
BRANCH=rational
CURRENT:=$(shell echo $$(git rev-parse --abbrev-ref HEAD))

RALG=sympy
MALG=auto_diff
TIME=1000

## Rational models
RATIONAL=BIOMD0000000013 BIOMD0000000023 BIOMD0000000033 BIOMD0000000113 BIOMD0000000182 BIOMD0000000313 BIOMD0000000448 BIOMD0000000526 BIOMD0000000535 
BIOMD0000000013_OBS=x_CO2
BIOMD0000000023_OBS=Fru
BIOMD0000000033_OBS=freeEGFReceptor
BIOMD0000000113_OBS=Y
BIOMD0000000182_OBS=AC_cyto_mem
BIOMD0000000313_OBS=IL13_DecoyR
BIOMD0000000448_OBS=mTORC1a
BIOMD0000000526_OBS=DISC
BIOMD0000000535_OBS=mw1d9426a3_e1e9_49e0_ad77_eb6833be398a

## Polynomial models
POLYNOMIAL=Barua OrderedPhosphorylation MODEL1001150000 MODEL8262229752 fceri_ji e7
Barua_OBS=aS000
OrderedPhosphorylation_OBS=s0
MODEL1001150000_OBS="CaM_0_0 + CaM_1_0 + CaM_0_1 + CaM_1_1 + CaM_2_2 + CaM_2_0 + CaM_0_2 + CaM_2_1 + CaM_1_2"
MODEL8262229752_OBS=Pfs_mRNA LuxS_mRNA AI2_intra
fceri_ji_OBS="S2 + S178 + S267 + S77"
e7_OBS=S0 S1


## Other configurations
BRANCHES=rational.b
READ_ALGS=polynomial.r rational.r sympy.r
MATR_ALGS=polynomial.m auto_diff.m

## Rules of the makefile
all: $(BRANCHES)
	@echo "Finished all the tests"

clean:
	@rm -f ./results/*.$(EXT)

%.r: 
	@$(MAKE) $(POLYNOMIAL) $(RATIONAL) RALG=$(basename $@) MALG=$(MALG) BRANCH=$(BRANCH) TIME=$(TIME)

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

# Special test for the MMK models for some sizes
MMK.sp:
	@echo "####################################################################################"
	@echo "## Running test for MMK -- [$(BRANCH)]## min=4, max=10 ## t=$(TIME)"
	@echo "####################################################################################"
	@echo "## Moving to $(BRANCH) branch"
	@git checkout $(BRANCH)
	@rep=1 ; while [[ $$rep -le $(REPETITIONS) ]]; do \
		echo "Executing repetition $$rep/$(REPETITIONS) in branch $(BRANCH)..." ; \
		python3 test_time_MMK.py $(FOLDER)/MMK_$(BRANCH).$(EXT) --m 4 --M 10 --t $(TIME) ; \
		(( rep = rep + 1 )) ; \
	done
	@echo -e "\nFinished"
	@echo "## Returning to original branch..."
	@git checkout $(CURRENT)
	@echo "####################################################################################"

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
