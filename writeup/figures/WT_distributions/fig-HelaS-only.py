"""Code for generating Fig. distribution of gyration radii for WT Hela
L and Hela S cells.

See
https://bespokeblog.wordpress.com/2011/07/11/basic-data-plotting-with-matplotlib-part-3-histograms/

"""

import numpy as np
import matplotlib.pyplot as plt
import matplotlib.font_manager as font_manager
from matplotlib import rcParams


fontpath = '/usr/share/fonts/truetype/msttcorefonts/Arial.ttf'
prop = font_manager.FontProperties(fname = fontpath)
rcParams['font.family'] = prop.get_name()
rcParams.update({'font.size' : 7})
rcParams.update({'legend.fontsize' : 7})
rcParams.update({'axes.titlesize' : 7})

hs = np.loadtxt('../figure_data/Original_Data_S_dataset_RgTrans')

# For plotting the means
hsMean = [np.mean(hs), np.mean(hs)]
ysMean = [0, 0.025]

myBins = np.arange(10, 200, 5)
fig, ax = plt.subplots(1, 1, figsize = (3.46 , 2.5), dpi = 300)

nH, binsH, patchesH = ax.hist(hs,
                               bins = myBins,
                               histtype = 'stepfilled',
                               color = '#AAAAAA',
                               alpha = 0.5,
                               label = 'N = %i' % len(hs),
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
#plt.show()
plt.savefig('fig-HelaS-only.png')
plt.close()
