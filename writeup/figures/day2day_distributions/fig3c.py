"""Code for generating Fig. 3C -- Distribution of gyration radii for
Hela L and Hela S cells in the TRF1, TRF2, and TRF1/TRF2 KD
experiments.

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

pSupL = np.loadtxt('figure_data/Pooled_pSuper_L_dataset_RgTrans')
TRF1L = np.loadtxt('figure_data/Pooled_TRF1_L_dataset_RgTrans')
TRF2L = np.loadtxt('figure_data/Pooled_TRF2_L_dataset_RgTrans')
TRF1TRF2L = np.loadtxt('figure_data/Pooled_TRF1_TRF2_L_dataset_RgTrans')

pSupS = np.loadtxt('figure_data/Pooled_pSuper_S_dataset_RgTrans')
TRF1S = np.loadtxt('figure_data/Pooled_TRF1_S_dataset_RgTrans')
TRF2S = np.loadtxt('figure_data/Pooled_TRF2_S_dataset_RgTrans')
TRF1TRF2S = np.loadtxt('figure_data/Pooled_TRF1_TRF2_S_dataset_RgTrans')

myBins = np.arange(10, 200, 5)
fig, ((ax1, ax2), (ax3, ax4), (ax5, ax6)) = plt.subplots(3, 2, sharex = True, sharey = True, figsize = (7.2 , 5), dpi = 300)

# Hela L TRF1
ax1.hist(pSupL,
         bins = myBins,
         histtype = 'step',
         color = '#333333',
         label = 'pSuper',
         normed = True)
ax1.hist(TRF1L,
         bins = myBins,
         histtype = 'step',
         color = '#AAAAAA',
         label = 'TRF1',
         normed = True)
ax1.grid(True)
ax1.legend()
ax1.set_title('Hela L\n(pSuper N = %d)' %len(pSupL))
ax1.set_ylim(0, 0.025)
ax1.annotate('N = %d' % len(TRF1L), xy = (10, 0.016), xytext = (10, 0.016))

# Hela S TRF1
ax2.hist(pSupS,
         bins = myBins,
         histtype = 'step',
         color = '#333333',
         label = 'pSuper, N = %d' % len(pSupS),
         normed = True)
ax2.hist(TRF1S,
         bins = myBins,
         histtype = 'step',
         color = '#AAAAAA',
         label = 'TRF1',
         normed = True)
ax2.grid(True)
ax2.legend()
ax2.set_title('Hela S\n(pSuper N = %d)' %len(pSupS))
ax2.set_ylim(0, 0.025)
ax2.annotate('N = %d' % len(TRF1S), xy = (10, 0.016), xytext = (10, 0.016))

# Hela L TRF2
ax3.hist(pSupL,
         bins = myBins,
         histtype = 'step',
         color = '#333333',
         label = 'pSuper',
         normed = True)
ax3.hist(TRF2L,
         bins = myBins,
         histtype = 'step',
         color = '#AAAAAA',
         label = 'TRF2',
         normed = True)
ax3.grid(True)
ax3.legend()
ax3.set_ylim(0, 0.025)
ax3.set_ylabel('Normalized frequency')
ax3.annotate('N = %d' % len(TRF2L), xy = (10, 0.016), xytext = (10, 0.016))

# Hela S TRF2
ax4.hist(pSupS,
         bins = myBins,
         histtype = 'step',
         color = '#333333',
         label = 'pSuper',
         normed = True)
ax4.hist(TRF2S,
         bins = myBins,
         histtype = 'step',
         color = '#AAAAAA',
         label = 'TRF2',
         normed = True)
ax4.grid(True)
ax4.legend()
ax4.set_ylim(0, 0.025)
ax4.annotate('N = %d' % len(TRF2S), xy = (10, 0.016), xytext = (10, 0.016))

# Hela L TRF1/TRF2
ax5.hist(pSupL,
         bins = myBins,
         histtype = 'step',
         color = '#333333',
         label = 'pSuper',
         normed = True)
ax5.hist(TRF1TRF2L,
         bins = myBins,
         histtype = 'step',
         color = '#AAAAAA',
         label = 'TRF1/TRF2',
         normed = True)
ax5.grid(True)
ax5.legend()
ax5.set_ylim(0, 0.025)
ax5.set_xlabel('Radius of gyration, nm')
ax5.annotate('N = %d' % len(TRF1TRF2L), xy = (10, 0.016), xytext = (10, 0.016))

# Hela S TRF1/TRF2
ax6.hist(pSupS,
         bins = myBins,
         histtype = 'step',
         color = '#333333',
         label = 'pSuper',
         normed = True)
ax6.hist(TRF1TRF2S,
         bins = myBins,
         histtype = 'step',
         color = '#AAAAAA',
         label = 'TRF1/TRF2',
         normed = True)
ax6.grid(True)
ax6.legend()
ax6.set_ylim(0, 0.025)
ax6.set_xlabel('Radius of gyration, nm')
ax6.annotate('N = %d' % len(TRF1TRF2S), xy = (10, 0.016), xytext = (10, 0.016))

fig.tight_layout(pad = 1.5)

plt.savefig('fig3c.png')
plt.close()
