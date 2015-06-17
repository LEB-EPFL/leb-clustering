# Used to rebuild the entire Telomere STORM project analysis.
ML = matlab -nodesktop -r
ANALYSES_DIR = analyses
FIGURES_DIR = figures
SAVED_DATA_DIR = saved_distrs

LLH_REQS = \
	saved_distrs/Original_Data_L_dataset_RgTrans \
	saved_distrs/Original_Data_S_dataset_RgTrans \
	simulation_data/rw_2015-1-26_HelaL* \
	simulation_data/rw_2015-2-2_HelaS*

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
.PHONY: MLDataVis

# Runs all data processing steps. The first two (analyses and
# saveData) generate the text data in the saved_distrs folder for the
# last two steps (calcLLH and pubPlots).
all: analyses saveData MLDataVis calcLLH pubPlots

# Process the localization data
analyses:
	$(MAKE) -C $(ANALYSES_DIR)

# Save processed Matlab data to text files
saveData:
	$(MAKE) -C $(SAVED_DATA_DIR)

# Run the Matlab visualization scripts.
MLDataVis:
	echo "Generating Matlab plots for process inspection."
	$(ML) "data_visualization_main(); exit"

# Calculate the log-likelihood (llh) data files.
calcLLH: $(LLH_REQS)
	@echo "Computing the likelihood data from the measurements and simulations..."
	@echo "(This step can take a couple hours or more.)"
	@echo "Hela L Wildtype..."
	cd simulation_data && python LLH_HelaL_WT.py && cd ..
	@echo "Creating file simulation_data/llh_Original_Data_L_dataset_RgTrans2015-1-26.npy..."
	@echo "Done computing likelihood for Hela L Wildtype."
	@echo "Hela S Wildtype..."
	cd simulation_data && python LLH_HelaS_WT.py && cd ..
	@echo "Creating file simulation_data/llh_Original_Data_S_dataset_RgTrans2015-2-2.npy..."
	@echo "Done computing likelihood for Hela S wildtype."

# Makes publication-quality plots, including
#     + wild type distributions
#     + parameter spaces
#     + comparison of simulated and measured distributions
#     + TODO: Day-to-day variations
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
	@echo "Generating plots on Shelterin knockdowns from plotShelterinKDs.py"
	cd figures && python plotShelterinKDs.py && cd ..
	@echo "The following figures were generated:"
	@echo "figures/output_figs/Hela_L_TRF_KDs.pdf"
	@echo "figures/output_figs/Hela_S_TRF_KDs.pdf"
	@echo "All publication figures have been generated."
