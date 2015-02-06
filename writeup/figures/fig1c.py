"""Code for generating Fig. 1C -- Box plots of gyration radii
distributions.

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

stdprops = dict(linewidth = 1.0, color = 'k')
meanprops = dict(markerfacecolor = 'k', markersize = 2.0)
flierprops = dict(markersize = 2.0)
labels = ['Hela S', 'Hela L']
fig = plt.figure(figsize = (3.46 , 2.5), dpi = 300)
boxL = plt.boxplot([hs, hl],
                   vert = False,
                   sym = 'kD',
                   showmeans = True,
                   boxprops = stdprops,
                   medianprops = stdprops,
                   whiskerprops = stdprops,
                   capprops = stdprops,
                   meanprops = meanprops,
                   flierprops = flierprops,
                   labels = labels)

fig.tight_layout(pad = 1.5)

plt.xlim((0, 200))
plt.xlabel('Radius of gyration, nm')
plt.grid(True)
plt.savefig('fig1c.pdf')
plt.close()
