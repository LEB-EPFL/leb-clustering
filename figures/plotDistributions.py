"""Script for generating publication-quality figures of the
distributions of the radius of gyration for Hela L and Hela S.

"""

import numpy as np
import matplotlib.pyplot as plt
import matplotlib.font_manager as font_manager
from matplotlib import rcParams

# Set global matplotlib settings
journalFontSize = 7
fontpath = '/usr/share/fonts/truetype/msttcorefonts/Arial.ttf'
prop = font_manager.FontProperties(fname = fontpath)
rcParams['font.family'] = prop.get_name()
rcParams.update({'font.size'       : journalFontSize})
rcParams.update({'legend.fontsize' : journalFontSize})
rcParams.update({'axes.titlesize'  : journalFontSize})

hl = np.loadtxt('../saved_distrs/Original_Data_L_dataset_RgTrans')
hs = np.loadtxt('../saved_distrs/Original_Data_S_dataset_RgTrans')

# For plotting the means
hlMean = [np.mean(hl), np.mean(hl)]
hsMean = [np.mean(hs), np.mean(hs)]
ysMean = [0, 0.025]

myBins = np.arange(10, 200, 5)
fig, ax = plt.subplots(1, 1, figsize = (3.46 , 2.5), dpi = 300)
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
plt.savefig('output_figs/plotDistributions.svg')
plt.savefig('output_figs/plotDistributions.pdf')
plt.savefig('output_figs/plotDistributions.png')
plt.close()
