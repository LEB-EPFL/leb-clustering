leb-clustering
==============

Clustering and analysis software for the Laboratory of Experimental
Biophysics, EPFL

This code automatically filters and analyzes the localization data
from the Telomere/STORM experiments and saves the analyzed size
distributions to text files. These distributions can then be used for
plotting or for further analyses, such as doing maximum likelihood
estimations.

## Contents ##
### Files ###
+ *data_mining.m* - Helper script for investigating new data; use for
  exploring the datasets before processing all the data with main.m.
+ *data_visualization_main.m* - Runs all the different visualization
  scripts for the various experiments. It also generates an HTML
  report for each experiment.
+ *dbscan.m* - DBSCAN implementation in Matlab. Originally written by
  Michal Daszykowski at the University of Silesia.
+ *Makefile* - Used to automatically run the various scripts in the
  correct order for analyzing the localization data and saving the
  results.
+ *process\_helper.m* - The script used for reading in raw localization
  data, setting filtering properties, and sending the data to the
  *process\_data.m* script. *process\_data.m* does the actual
  filtering and computation of the radius of gyration and other
  calculations.
+ *process_data.m* - Primary function for clustering localization data
  and computing cluster statistics.
+ *README.md* - This help file
+ *saveDistFiles.m* Used to save the distribution data to text files.

### Folders ###
+ *analyses* - Contains filtered and clustered data for all the
  experiments, including scripts for automatically generating
  plots. (These are named *data_visualization.m* and are found in each
  sub-directory for the important experiments.)
+ *data_structres* - Matlab files defining where to find the raw
  localization data for each experiment.
+ *misc* - Mostly old, miscellaneous files. Includes some analyses of
  the Southern blots.
+ *org* - Notes kept in org-mode.
+ *private* - Folder containing all the helper functions used for data
  visualization and processing. The name _private_ is a special name
  for folders in Matlab. It designates where functions used in scripts
  located in the directory above _private_ are held.
+ *reports\_and\_meetings* - Various reports and presentations from
  the project.
+ *saved_distrs* - Folder containing the distributions of the
  statistics computed from the clustered localizations. Currently,
  this is only the radius of gyration data.
+ *writeup* - Files for the writeup.

## Instructions ##

### Running the entire analysis ###

The entire analyses can be run simply by navigating to the root
directory (which contains the process\_helper.m and process\_data.m
scripts) and typing

	make

Note that this currently requires that localization data are stored in
a certain directory on the external harddrive on Kyle's office
computer. This is planned to change soon.

It is also assumed that you are using GNU Make on a Linux-based
system. It may be possible to use GNU Make to assemble this analysis
on a Windows system, but this has not been tested.

### Running only selected analyses
Individual analyses may be run by doing one of two steps:

1. Use the *process\_helper.m* and *process\_data.m* scripts to
   generate .mat files containing the processed localizations.
2. Use the Makefile in the _analyses/_ folder with an argument
   corresponding to a certain experiment to process. For example,

```
	make experiment0
```

   generates the Matlab .mat file for experiment number 0, which
   studied the wild type Hela cells. Note that this _will not_
   generate updated distribution files or run the data_visualization
   scripts for the experiment. To do this, you must go to the
   project's root directory and type

```
	make saveData
	make dataVis
```

## Software Versions ##

The following software packages were used to perform this
analysis. This list is not meant to serve as a dependency list, but
instead as documentation for the versions of software used.

### Matlab

+ Matlab R2014a (8.3.0.532) 64-bit

### Linux tools

+ Make (3.81-8.2) 64-bit
