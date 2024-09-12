# TODO

## Meeting 05-07
 1. [ ] Antonio: Why getting optimal epsilons is so slow?
 2. [o] Both: Why CMSB2023[2] Matlab exact is 28 instead of 22?
 3. [x] Antonio: Why average error is "inf"?
 4. [x] Alexander: implement the creation of tests from .ode
 5. [ ] Alexander: generate images for epsilon analysis.

## Meeting 26-05
 1. [x] Alexander: fix the epsilon analysis
 2. [o] Alexander: implement the creation of tests from .ode
 3. [x] Antonio: add type "abstract" to examples.
 4. [x] Antonio: fix the listing and compiling of examples

## Executing

 1. [o] Alexander: script reading .ode to fill the JSON -> 26/05//2
 2. [x] Antonio: Fix parser
 3. [x] Antonio: change observable writing -> require a name for an observable set. By default, it is called `"VIEW_%d"`.
 3. [x] Antonio: Check why not in space (numerical simulation)
 4. [x] Antonio: add references to other examples to reuse data
 5. [o] Alexander: implement epsilon analysis in script -> 26/05//1

## Examples

 1. [x] Alexander: compile list of models
 2. [x] Execute the polynomial models
 3. [o] Compare with paper

## Rationals

 1. [x] Check the rational examples after the polynomial case

## Analysis

 1. [x] Alexander: Implement analysis finding sizes vs epsilon without sampling
 2. [o] Alexander: Refactor to remove deviation (this might involve modifying clue.py)
 3. [ ] Alexander: Add testing for one polynomial and one rational model
  

## Future

 1. [ ] Implement reader/parser of .net
 2. [ ] Fix the reader/parser .ode
 3. [ ] Design a generic parser that the other two parsers implement
