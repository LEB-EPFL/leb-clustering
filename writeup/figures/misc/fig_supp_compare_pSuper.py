"""Compare pSuper distributions to wild type.

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

WTL = np.loadtxt('figure_data/Original_Data_L_dataset_RgTrans.txt')
WTS = np.loadtxt('figure_data/Original_Data_S_dataset_RgTrans.txt')
pSupL = np.loadtxt('figure_data/Pooled_pSuper_L_dataset_RgTrans')
pSupS = np.loadtxt('figure_data/Pooled_pSuper_S_dataset_RgTrans')

myBins = np.arange(10, 200, 5)
fig, ((ax1, ax2)) = plt.subplots(1, 2, figsize = (7.2 , 5), dpi = 300)

ax1.hist(WTL,
         bins = myBins,
         histtype = 'stepfilled',
         color = '#333333',
         label = 'Wild Type, N = %d' % len(WTL),
         normed = True)
ax1.hist(pSupL,
         bins = myBins,
         histtype = 'stepfilled',
         color = '#AAAAAA',
         alpha = 0.5,
         label = 'pSuper, N = %d' % len(pSupL),
         normed = True)
ax1.grid(True)
ax1.legend()
ax1.set_title('Hela L')
ax1.set_ylim((0, 0.025))

ax2.hist(WTS,
         bins = myBins,
         histtype = 'stepfilled',
         color = '#333333',
         label = 'Wild Type, N = %d' % len(WTS),
         normed = True)
ax2.hist(pSupS,
         bins = myBins,
         histtype = 'stepfilled',
         color = '#AAAAAA',
         alpha = 0.5,
         label = 'pSuper, N = %d' % len(pSupS),
         normed = True)
ax2.grid(True)
ax2.legend()
ax2.set_title('Hela S')
ax2.set_xlabel('Radius of gyration, nm')
ax2.set_ylim((0, 0.025))

fig.tight_layout(pad = 1.5)

plt.show()
plt.savefig('fig_supp_compare_pSuper.pdf')
plt.close()
