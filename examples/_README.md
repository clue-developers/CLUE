**********************************************
*	Getting started                          *
**********************************************

This folder contains the case studies with biological interpretation mentioned in the Results section.




**********************************************
*	Model information                        *
**********************************************

Each folder has a file <filename>.md containing the following information of the model:

1. TYPE: 
	<MA, NON-MA, MIXED, MME, HILL>
	
2. CATEGORY: 
	<BIO, NET, CURATED, NON-CURATED>
	
3. DESCRIPTION:
	Plain text
	
4. URL:
	Path to the model, or to the source were was taken from.
	
5. REFERENCES:
	@bibTexKey
	
6. INTERNAL REFERENCES:
	[label]@bibTexKey



**********************************************
*	Processing                               *
**********************************************

----------------------------------------------
	1. Encoding             
----------------------------------------------

	*.ode
		- Files with extension ".ode" are ERODE especifications, e.g. BIOMD0000000504_Curry.ode
		- The files that have in the name "FE_B", are the FE reduction of this model constrained to preserve a partition of observables, e.g BIOMD0000000504_curryFE_B2 is the FE reduction preserving B2 (i.e. the second block).

	*.m
		- ODE encoding of the ERODE models.

	*.sage
		- SAGE encoding of the model.
		
	*.py
		- Python encoding of the model.


----------------------------------------------
	2 - Results
----------------------------------------------
	*.txt
		- Each folder contains a file results<Model>_allPartitions.txt, which contains the aggregated systems for ALL the blocks of observables of <Model>. For example results_BIOMD504_allPartitions.txt contains the aggregated systems for B1, B2, B3 and B4.
		
		-The aggregated systems which are obtained over FE models are called results<Model>_curryFEB<blockNumber>.text. For example results_BIOMD504_curry_FEB1.text contains the aggregated system for results_BIOMD504_curry_FEB1.sage


	*species_balance_in_aggregated_system.md
		This file contains the species balance for the reduction results using each block, which is a map from the aggregated system to the original variables names which helps to identify the species which are preserved or simplified in the aggregated system. (Internal file)