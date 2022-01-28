SHELL:=/bin/bash
REPETITIONS=5

all: $(shell python3 times_data.py -a) MMK summary
	@echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	@echo "Finished all tests"
	@echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

poly: $(shell python3 times_data.py -t polynomial)
	@echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	@echo "Finished all polynomial tests"
	@echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

rational: $(shell python3 times_data.py -t rational)
	@echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	@echo "Finished all rational tests"
	@echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

# Special test for the MMK models for some sizes
MMK:
	@echo "####################################################################################"
	@echo "## Running test for MMK ## min=4, max=10"
	@echo "####################################################################################"
	@ind=4; while [[ $$ind -le 10 ]]; do \
		rep=1 ; while [[ $$rep -le $(REPETITIONS) ]]; do \
			echo "Executing with n=$$ind; repetition $$rep/$(REPETITIONS)..." ; \
			python3 run_time_MMK.py results/MMK.results.csv --f $$ind --t 1800 ; \
			(( rep = rep + 1 )) ; \
		done; \
		(( ind = ind + 1 )) ; \
	done
	@echo -e "\nFinished"
	@echo "####################################################################################"

# summary goal
summary:
	@echo "Generating statistics in a summary file..."
	@python3 process_data.py
	@echo "Finished."

%.m: 
	$(MAKE) $(shell python3 times_data.py -n $(basename $@))
	@echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	@echo "Finished all tests for $(basename $@)"
	@echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

%:
	@echo "####################################################################################"
	@echo "## Running test for $@"
	@echo "####################################################################################"
	@rep=1 ; while [[ $$rep -le $(REPETITIONS) ]]; do \
		echo "Executing repetition $$rep/$(REPETITIONS) in branch $(BRANCH)..." ; \
		python3 run_time.py $@ ; \
		(( rep = rep + 1 )) ; \
	done
	@echo -e "\nFinished"
	@echo "####################################################################################"
