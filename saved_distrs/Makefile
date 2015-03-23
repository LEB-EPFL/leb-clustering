# Save the processed localization data in the .mat files as raw txt
# for further processing.
ML = matlab -nodesktop -r
SAVE_DISTRS = ../saveDistFiles.m
RESAVE_DISTRS = $(ML) "cd ..; saveDistFiles(); exit"

E0_DISTRS = \
	Original_Data_L_dataset_RgTrans \
	Original_Data_S_dataset_RgTrans
E1_DISTRS = \
	WT_L_dataset_RgTrans \
	TRF1_1000_L_dataset_RgTrans \
	TRF1_2000_L_dataset_RgTrans
E6_DISTRS = \
	Pooled_pSuper_L_dataset_RgTrans \
	Pooled_pSuper_S_dataset_RgTrans \
	Pooled_TRF1_L_dataset_RgTrans \
	Pooled_TRF1_S_dataset_RgTrans \
	Pooled_TRF2_L_dataset_RgTrans \
	Pooled_TRF2_S_dataset_RgTrans \
	Pooled_TRF1_TRF2_L_dataset_RgTrans \
	Pooled_TRF1_TRF2_S_dataset_RgTrans \

all: $(E0_DISTRS) $(E1_DISTRS) $(E6_DISTRS)

# Save radius of gyration distributions if saveDistFiles.m has been
# updated by the analyses Makefile. The use of a pattern-rule here
# ensures that the command to resave the distribution files is run
# only once, regardless of how many *RgTrans files need updating.
%RgTrans: $(SAVE_DISTRS)
	$(RESAVE_DISTRS)
