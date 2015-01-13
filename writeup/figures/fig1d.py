"""Code for generating Fig. 1D -- Southern blots for Hela L and Hela S

"""

import numpy as np
import matplotlib.pyplot as plt

hl = np.loadtxt('figure_data/HelaL_SBlot', delimiter = ',')
hs = np.loadtxt('figure_data/HelaS_SBlot', delimiter = ',')

NL = hl[:,0]; BlotL = -hl[:,1] + 255
NS = hs[:,0]; BlotS = -hs[:,1] + 255

plt.plot(NL, BlotL, label='Hela L', color = "#333333", linewidth = 2.0)
plt.plot(NS, BlotS,
         label='Hela S',
         color = "#AAAAAA",
         linewidth = 2.0,
         linestyle = '--')

plt.xlabel('Genomic length, kb')
plt.ylabel('Inverse grayscale')
plt.xlim((0, 50))
plt.grid(True)
plt.legend()
plt.savefig('fig1d.pdf')
plt.close()
