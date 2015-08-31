"""Script for plotting the results of the denaturation experiment.

"""

import numpy as np
import matplotlib.pyplot as plt
import matplotlib.font_manager as font_manager
from matplotlib import rcParams
import pandas as pd

# Set global matplotlib settings
journalFontSize = 16
figureSize = (8, 6)

fontpath = '/usr/share/fonts/truetype/msttcorefonts/Arial.ttf'
prop = font_manager.FontProperties(fname = fontpath)
rcParams['font.family'] = prop.get_name()
rcParams.update({'font.size'       : journalFontSize,
                 'legend.fontsize' : journalFontSize,
                 'axes.titlesize'  : journalFontSize,
                 'figure.figsize'  : figureSize,
                 'figure.dpi'      : 600,
                 'figure.edgecolor' : (1,1,1,0),
                 'figure.facecolor' : (1,1,1,0),
                 'figure.subplot.bottom' : 0.125})

# Load the distributions into memory
control   = pd.read_csv('../analyses/Experiment_7_Denaturation/Rg_Control.csv',
                        header = None)
denatured = pd.read_csv('../analyses/Experiment_7_Denaturation/Rg_Denatured.csv',
                        header = None)

# Rename columns
control.columns   = ['Control Rg']
denatured.columns = ['Denatured Rg']

myBins = np.arange(0, 250, 5)
plt.hist(control['Control Rg'], bins = myBins)
plt.xlabel('Radius of gyration, nm')
plt.ylabel('Count')
plt.savefig('presentation_figs/denatTest_control.svg')
plt.savefig('presentation_figs/denatTest_control.png')
plt.savefig('presentation_figs/denatTest_control.pdf')
plt.close()

myBins = np.arange(0, 250, 5)
plt.hist(denatured['Denatured Rg'], bins = myBins)
plt.xlabel('Radius of gyration, nm')
plt.ylabel('Count')
plt.savefig('presentation_figs/denatTest_denatured.svg')
plt.savefig('presentation_figs/denatTest_denatured.png')
plt.savefig('presentation_figs/denatTest_denatured.pdf')
plt.close()

plt.hist(control['Control Rg'],     bins = myBins, histtype = 'step', label = 'Control', linewidth = 2)
plt.hist(denatured['Denatured Rg'], bins = myBins, color='black', histtype = 'step', label = 'Denatured', linewidth = 2)
plt.xlabel('Radius of gyration, nm')
plt.ylabel('Count')
plt.grid(True)
plt.legend()
plt.savefig('presentation_figs/denatTest_both.svg')
plt.savefig('presentation_figs/denatTest_both.png')
plt.savefig('presentation_figs/denatTest_both.pdf')
plt.close()

