# ECE472lab
## Problem 1
Currently, three scripts to automate.  Automates creation of configuration files, running them, and cleanup.
### Generation
To generate configuration files;
```sh
$ ./gen_cfg.sh
```
It is assumed that desired block size is 16 and replacement method is LRU
### Run
To run, make sure the SimpleScalare package is installed and configured as per the [assignment instructions](http://web.engr.oregonstate.edu/~chenliz/courses/lab.pdf).  Then run the following:
```sh
$ ./run_cfg.sh
```
To produce two csvs (for $dl1 and $il1, respectively) with each line of format:
```csv
<sets>, <associativity>, <miss rate>
```
