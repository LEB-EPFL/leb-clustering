# Used to rebuild the entire Telomere STORM project analysis.
ML = matlab -nodesktop -r
ANALYSES_DIR = analyses
FIGURES_DIR = figures
SAVED_DATA_DIR = saved_distrs

LLH_REQS = \
	saved_distrs/Original_Data_L_dataset_RgTrans \
	saved_distrs/Original_Data_S_dataset_RgTrans \

# Pickled database files (rw_2015...) are required for finding the
# simulated distributions with mean values within +/- 5 nm of the
# measured distribution.
PUBPLOT_REQS = \
	saved_distrs/Original_Data_L_dataset_RgTrans \
	saved_distrs/Original_Data_S_dataset_RgTrans \
	simulation_data/llh_Original_Data_L_dataset_RgTrans2015-1-26.npy \
	simulation_data/llh_Original_Data_S_dataset_RgTrans2015-2-2.npy \
	simulation_data/rw_2015-1-26_HelaL* \
	simulation_data/rw_2015-2-2_HelaS*

.PHONY: analyses
.PHONY: saveData
.PHONY: MLdataVis

# Runs all data processing steps
all: analyses saveData dataVis calcLLH pubPlots

# Process the localization data
analyses:
	$(MAKE) -C $(ANALYSES_DIR)

# Save processed Matlab data to text files
saveData:
	$(MAKE) -C $(SAVED_DATA_DIR)

# Run the Matlab visualization scripts.
MLdataVis:
	echo "Generating Matlab plots for process inspection."
	$(ML) "data_visualization_main(); exit"

# Calculate the log-likelihood (llh) data files.

# This is still something that needs to be worked on. Specifically, I
# need to make the Python polymer code into a package and then use
# some of its utilities for computing the LLH datasets.
calcLLH: $(LLH_REQS)
	@echo "TODO: Automatically compute log-likelihood data."

# Makes publication-quality plots, including
#     + wild type distributions
#     + parameter spaces
#     + comparison of simulated and measured distributions
pubPlots : $(PUBPLOT_REQS)
	@echo "Generating publication figure from plotDistributions.py"
	cd figures && python plotDistributions.py && cd ..
	@echo "The following figures were generated:"
	@echo "figures/output_figs/plotDistributions.svg"
	@echo "figures/output_figs/plotDistributions.pdf"
	@echo "figures/output_figs/plotDistributions.png"
	@echo "Generating publication parameter space plots and distributions from plotParamSpaces.py"
	cd figures && python plotParamSpaces.py && cd ..
	@echo "The following figures were generated:"
	@echo "figures/output_figs/HelaL_param_space.svg"
	@echo "figures/output_figs/HelaL_param_space.pdf"
	@echo "figures/output_figs/HelaL_param_space.png"
	@echo "figures/output_figs/HelaS_param_space.svg"
	@echo "figures/output_figs/HelaS_param_space.pdf"
	@echo "figures/output_figs/HelaS_param_space.png"
	@echo "figures/output_figs/HelaL_param_space_dists.svg"
	@echo "figures/output_figs/HelaL_param_space_dists.pdf"
	@echo "figures/output_figs/HelaL_param_space_dists.png"
	@echo "figures/output_figs/HelaS_param_space_dists.svg"
	@echo "figures/output_figs/HelaS_param_space_dists.pdf"
	@echo "figures/output_figs/HelaS_param_space_dists.png"
	@echo "All publication figures have been generated."
