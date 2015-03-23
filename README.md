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

