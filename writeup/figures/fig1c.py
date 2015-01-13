"""Code for generating Fig. 1C -- Box plots of gyration radii
distributions.

See
https://bespokeblog.wordpress.com/2011/07/11/basic-data-plotting-with-matplotlib-part-3-histograms/
"""

import numpy as np
import matplotlib.pyplot as plt

hl = np.loadtxt('figure_data/Original_Data_L_dataset_RgTrans.txt')
hs = np.loadtxt('figure_data/Original_Data_S_dataset_RgTrans.txt')

stdprops = dict(linewidth = 2.0, color = 'k')
meanprops = dict(markerfacecolor='k')
labels = ['Hela S', 'Hela L']
boxL = plt.boxplot([hs, hl],
                   vert = False,
                   sym = 'kD',
                   showmeans = True,
                   boxprops = stdprops,
                   medianprops = stdprops,
                   whiskerprops = stdprops,
                   capprops = stdprops,
                   meanprops = meanprops,
                   labels = labels)

plt.xlim((0, 200))
plt.xlabel('Radius of gyration, nm')
plt.grid(True)
plt.savefig('fig1c.pdf')
