"""Code for generating Fig. 1B -- Distribution of gyration radii for
WT Hela L and Hela S cells.

See
https://bespokeblog.wordpress.com/2011/07/11/basic-data-plotting-with-matplotlib-part-3-histograms/
"""

import numpy as np
import matplotlib.pyplot as plt

hl = np.loadtxt('figure_data/Original_Data_L_dataset_RgTrans.txt')
hs = np.loadtxt('figure_data/Original_Data_S_dataset_RgTrans.txt')

myBins = np.arange(10, 200, 5)
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

plt.title('Non-transfected cell lines')
plt.xlabel('Radius of gyration, nm')
plt.ylabel('Normalized frequency')
plt.grid(True)
plt.legend()
plt.savefig('fig1b.pdf')
plt.close()
