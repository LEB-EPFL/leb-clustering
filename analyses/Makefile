# Run all clustering, filtering, and analysis steps on the
# localization data files.
ML = matlab -nodesktop -r
MLDAT = matlab.mat
SAVE_DISTRS = ../saveDistFiles.m

.PHONY: experiment0
.PHONY: experiment1
.PHONY: experiment2
.PHONY: experiment4
.PHONY: experiment5
.PHONY: experiment6

# Cluster, filter, and analyze all experiments.
all: \
	experiment0 \
	experiment1 \
	experiment2 \
	experiment4 \
	experiment5 \
	experiment6

# PROCESS MATLAB DATA

# Create .mat data files containing clustered, filtered, and analyzed
# localization data. Also, update the saveDistFiles.m script so that
# output radius of gyration distribution text files will updated.
experiment0:
	$(ML) "cd ..; process_helper('experiment_0_Hela_LS', 'analyses/Experiment_0_Hela_LS'); exit"
	echo "Updating saveDistFiles.m timestamp."
	touch $(SAVE_DISTRS)

experiment1:
	$(ML) "cd ..; process_helper('experiment_1_FISH_immuno', 'analyses/Experiment_1_IF'); exit"
	echo "Updating saveDistFiles.m timestamp."
	touch $(SAVE_DISTRS)

experiment2:
	$(ML) "cd ..; process_helper('experiment_2_method', 'analyses/Experiment_2_Method'); exit"
	echo "Updating saveDistFiles.m timestamp."
	touch $(SAVE_DISTRS)

experiment4:
	$(ML) "cd ..; process_helper('experiment_4_TRF2', 'analyses/Experiment_4_Pool_TRF2'); exit"
	echo "Updating saveDistFiles.m timestamp."
	touch $(SAVE_DISTRS)

experiment5:
	$(ML) "cd ..; process_helper('experiment_5_SmchD1_TRF2', 'analyses/Experiment_5_Pool_SmchD1_TRF2'); exit"
	echo "Updating saveDistFiles.m timestamp."
	touch $(SAVE_DISTRS)

experiment6:
	$(ML) "cd ..; process_helper('experiment_6_TRF1_TRF2', 'analyses/Experiment_6_Pool_TRF1_TRF2'); exit"
	echo "Updating saveDistFiles.m timestamp."
	touch $(SAVE_DISTRS)


