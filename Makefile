# Used to rebuild entire Telomere STORM project analysis.
ML = matlab -nodesktop -r
ANALYSES_DIR = analyses
FIGURES_DIR = figures
SAVED_DATA_DIR = saved_distrs

PUBPLOT_REQS = \
	saved_distrs/Original_Data_L_dataset_RgTrans \
	saved_distrs/Original_Data_S_dataset_RgTrans

.PHONY: analyses
.PHONY: saveData
.PHONY: MLdataVis

# Runs all data processing steps
all: analyses saveData dataVis plotPlots

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

# Makes publication-quality plots, including
#     + wild type distributions
#     + parameter spaces
#     + comparision of simulated and measured distributions
pubPlots : $(PUBPLOT_REQS)
	@echo "Generating publication figure from plotDistributions.py"
	cd figures && python plotDistributions.py && cd ..
	@echo "The following figures were generated:"
	@echo "figures/output_figs/plotDistributions.svg"
	@echo "figures/output_figs/plotDistributions.pdf"
	@echo "figures/output_figs/plotDistributions.png"
	@echo "Generating publication parameter space plots and distributions from plotParamSpaces.py"
	cd figures && python plotParamSpaces.py && cd ..
