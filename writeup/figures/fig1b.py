"""Code for generating Fig. 1B -- Distribution of gyration radii for
WT Hela L and Hela S cells.

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

hl = np.loadtxt('figure_data/Original_Data_L_dataset_RgTrans.txt')
hs = np.loadtxt('figure_data/Original_Data_S_dataset_RgTrans.txt')

myBins = np.arange(10, 200, 5)
fig = plt.figure(figsize = (3.46 , 3.46), dpi = 300)
nL, binsL, patchesL = plt.hist(hl,
                               bins = myBins,
                               histtype = 'stepfilled',
                               color = '#333333',
                               label = 'Hela L',
                               normed = True)
nH, binsH, patchesH = plt.hist(hs,
                               bins = myBins,
                               histtype = 'stepfilled',
                               color = '#AAAAAA',
                               alpha = 0.5,
                               label = 'Hela S',
                               normed = True)

fig.tight_layout(pad = 2)

plt.title('Non-transfected cell lines')
plt.xlabel('Radius of gyration, nm')
plt.ylabel('Normalized frequency')
plt.grid(True)
plt.legend()
plt.savefig('fig1b.pdf')
plt.close()
