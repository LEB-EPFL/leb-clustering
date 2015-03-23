# Used to rebuild entire Telomere STORM project analysis.
ML = matlab -nodesktop -r
ANALYSES_DIR = analyses
SAVED_DATA_DIR = saved_distrs

.PHONY: analyses
.PHONY: saveData

# Runs all data processing steps
all: analyses saveData

# Process the localization data
analyses:
	$(MAKE) -C $(ANALYSES_DIR)

# Save processed Matlab data to text files
saveData:
	$(MAKE) -C $(SAVED_DATA_DIR)
