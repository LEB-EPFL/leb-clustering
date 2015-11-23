"""Script for generating publication-quality figures of the
distributions of the radius of gyration for Hela L and Hela S.

"""

import numpy as np
import matplotlib.pyplot as plt
import matplotlib.font_manager as font_manager
from matplotlib import rcParams
from STORMlikeChains.STORMlikeChains_helpers import unpackLLH, loadModel

# Set global matplotlib settings
journalFontSize = 16
figureSize = (8,6)

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

hl = np.loadtxt('../saved_distrs/Original_Data_L_dataset_RgTrans')
hs = np.loadtxt('../saved_distrs/Original_Data_S_dataset_RgTrans')

# For plotting the means
hlMean = [np.mean(hl), np.mean(hl)]
hsMean = [np.mean(hs), np.mean(hs)]
ysMean = [0, 0.025]

myBins = np.arange(10, 200, 5)
fig, ax = plt.subplots(1, 1)
nL, binsL, patchesL = ax.hist(hl,
                               bins = myBins,
                               histtype = 'stepfilled',
                               color = '#333333',
                               label = 'Hela L (N = %i)' % len(hl),
                               normed = True)
nH, binsH, patchesH = ax.hist(hs,
                               bins = myBins,
                               histtype = 'stepfilled',
                               color = '#AAAAAA',
                               alpha = 0.5,
                               label = 'Hela S (N = %i)' % len(hs),
                               normed = True)


'''plt.plot(hlMean,
         ysMean,
         color = '#000000',
         linestyle = '--',
         linewidth = 0.5)
plt.plot(hsMean,
         ysMean,
         color = '#AAAAAA',
         linestyle = '--',
         linewidth = 0.5)'''

fig.tight_layout(pad = 2)

# Remove top and right frame lines
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)

# Only show ticks on the left and bottom parts of the frame
ax.yaxis.set_ticks_position('left')
ax.xaxis.set_ticks_position('bottom')

# Change remaining frame linewidths
ax.spines['left'].set_linewidth(0.5)
ax.spines['bottom'].set_linewidth(0.5)

# Remove the legend frame
leg = plt.legend()
leg.draw_frame(False)   

plt.xlabel('Radius of gyration, nm')
plt.ylabel('Normalized frequency')
plt.ylim(tuple(ysMean))
plt.grid(False)
plt.savefig('presentation_figs/plotDistributions.svg')
plt.savefig('presentation_figs/plotDistributions.pdf')
plt.savefig('presentation_figs/plotDistributions.png')
plt.close()

# Plot just the single simulation distribution
SModelDists = loadModel(['../simulation_data/rw_2015-2-2_HelaS_WT'])
myBins = np.arange(10, 200, 5)
fig, ax = plt.subplots(1, 1, dpi = 600)

ax.hist(SModelDists[(40,50)][1],
         bins = myBins,
         histtype = 'stepfilled',
         color = '#AAAAAA',
         alpha = 0.5,
         label = 'Simulation',
         normed = True)

plt.ylim((0, 0.04))

plt.xlabel('Radius of gyration, nm')
plt.ylabel('Normalized frequency')

plt.savefig('presentation_figs/plotSingleDist_Simulation.svg')
plt.savefig('presentation_figs/plotSingleDist_Simulation.pdf')
plt.savefig('presentation_figs/plotSingleDist_Simulation.png')
plt.close()

# Plot just the Hela L distribution
fig, ax = plt.subplots(1, 1, dpi = 600)

nL, binsL, patchesL = ax.hist(hl,
                              bins = myBins,
                              histtype = 'stepfilled',
                              color = '#333333',
                              label = 'Experiment',
                              normed = True)

plt.ylim((0, 0.04))

plt.xlabel('Radius of gyration, nm')
plt.ylabel('Normalized frequency')

plt.savefig('presentation_figs/plotSingleDist_HelaL_only.svg')
plt.savefig('presentation_figs/plotSingleDist_HelaL_only.pdf')
plt.savefig('presentation_figs/plotSingleDist_HelaL_only.png')
plt.close()


# Plot just the Hela S distribution
fig, ax = plt.subplots(1, 1, dpi = 600)

nH, binsH, patchesH = ax.hist(hs,
                              bins = myBins,
                              histtype = 'stepfilled',
                              color = '#333333',
                              label = 'Experiment',
                              normed = True)

plt.ylim((0, 0.04))

plt.xlabel('Radius of gyration, nm')
plt.ylabel('Normalized frequency')

plt.savefig('presentation_figs/plotSingleDist_HelaS_only.svg')
plt.savefig('presentation_figs/plotSingleDist_HelaS_only.pdf')
plt.savefig('presentation_figs/plotSingleDist_HelaS_only.png')
plt.close()


# Compare Hela S to simulated distribution
fig, ax = plt.subplots(1, 1, dpi = 600)

nH, binsH, patchesH = ax.hist(hs,
                               bins = myBins,
                               histtype = 'stepfilled',
                               color = '#333333',
                               label = 'Experiment',
                               normed = True)

ax.hist(SModelDists[(40,50)][1],
         bins = myBins,
         histtype = 'stepfilled',
         color = '#AAAAAA',
         alpha = 0.5,
         label = 'Simulation',
         normed = True)

plt.ylim((0, 0.04))

plt.xlabel('Radius of gyration, nm')
plt.ylabel('Normalized frequency')

plt.legend()

plt.savefig('presentation_figs/plotSingleDist_HelaS.svg')
plt.savefig('presentation_figs/plotSingleDist_HelaS.pdf')
plt.savefig('presentation_figs/plotSingleDist_HelaS.png')
plt.close()

