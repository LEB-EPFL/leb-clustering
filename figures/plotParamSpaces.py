"""Script for generating the publication quality parameter-space plots
for the telomere manuscript.

"""

import numpy as np
import matplotlib.pyplot as plt
import matplotlib.font_manager as font_manager
from matplotlib import rcParams
from PolymerPy.PolymerPy_helpers import unpackLLH, loadModel

# Set global matplotlib settings
journalFontSize = 7
figureSize = (3.46, 2.5)

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


"""The following was originally and mostly written in an IPython
notebook, so the formatting reflects this style.

"""

results = {'Hela L' : {'LLH' : None,
                       'packRatio' : None,
                       'pLength' : None},
           'Hela S' : {'LLH' : None,
                       'packRatio' : None,
                       'pLength' : None}}

### Read in the log-likelihood data

# In[2]:

# Read in Hela L
currDataset = '../simulation_data/llh_Original_Data_L_dataset_RgTrans2015-8-19.npy'

with open(currDataset, mode = 'rb') as inFile:
    hl = np.load(inFile)

# Unpack the dataset
results['Hela L']['packRatio']   = hl['f0']
results['Hela L']['pLength']     = hl['f1']
(_, _, results['Hela L']['LLH']) = unpackLLH(hl)


# In[3]:

# Read in Hela S
currDataset = '../simulation_data/llh_Original_Data_S_dataset_RgTrans2015-8-21.npy'

with open(currDataset, mode = 'rb') as inFile:
    hs = np.load(inFile)

# Unpack the dataset
results['Hela S']['packRatio']   = hs['f0']
results['Hela S']['pLength']     = hs['f1']
(_, _, results['Hela S']['LLH']) = unpackLLH(hs)

### Setup plots for the parameter space close to the mean

# The log-likelihood gives us a relative measure of the similarity
# between the measured distribution and the simulated one. However,
# higher log-likelihood values may not necessarily correspond to
# better simulated distributions. We should also consider looking at
# all simulated distributions with means that are a certain distance
# from the experimental mean, say +/- 5 nm. This is a very rough
# estimate of the day-to-day variation in the mean values of the
# distributions.

# In[6]:

from scipy.stats import sem

# Experimental distributions
LExpDist = np.loadtxt('../saved_distrs/Original_Data_L_dataset_RgTrans')
SExpDist = np.loadtxt('../saved_distrs/Original_Data_S_dataset_RgTrans')

LMean = np.mean(LExpDist)
SMean = np.mean(SExpDist)

LSEM = sem(LExpDist)
SSEM = sem(SExpDist)

# Model distributions
LModelDists = loadModel(['../simulation_data/simData_HeLaL_WT_2015-8-19'])
SModelDists = loadModel(['../simulation_data/simData_HeLaS_WT_2015-8-21'])

LModelMeans = {k: np.mean(v[1]) for k, v in LModelDists.items()}
SModelMeans = {k: np.mean(v[1]) for k, v in SModelDists.items()}


# In[7]:

# Set the +/- amount around the experimental mean for filtering out
# incorrect parameter space values
err = 5

# Filter out datasets with means far from the experimental mean
LMeansFiltered = {k: v for k, v in LModelMeans.items() if np.abs(LMean - v) < err}
SMeansFiltered = {k: v for k, v in SModelMeans.items() if np.abs(SMean - v) < err}

# Convert the filtered parameter space values into arrays for plotting
LGoodParams = list(LMeansFiltered.keys())
SGoodParams = list(SMeansFiltered.keys())


### Make distribution plots for the paper

##### Hela L

# In[8]:

c  = [35, 60,  30, 80]
lp = [40, 150, 80, 90]

myBins = np.arange(10, 250, 5)

fig, ((ax1, ax2),(ax3, ax4)) = plt.subplots(2, 2, sharex = True, sharey = True)

ax1.hist(LExpDist,
         bins = myBins,
         histtype = 'stepfilled',
         color = '#333333',
         label = 'Experiment',
         normed = True)
ax1.hist(LModelDists[(c[0],lp[0])][1],
         bins = myBins,
         histtype = 'stepfilled',
         color = '#AAAAAA',
         alpha = 0.5,
         normed = True)
ax1.text(20, 0.022, r'c = %i, $\ell_p$ = %i' % (c[0], lp[0]))

ax2.hist(LExpDist,
         bins = myBins,
         histtype = 'stepfilled',
         color = '#333333',
         label = 'Experiment',
         normed = True)
ax2.hist(LModelDists[(c[1],lp[1])][1],
         bins = myBins,
         histtype = 'stepfilled',
         color = '#AAAAAA',
         alpha = 0.5,
         normed = True)
ax2.text(20, 0.022, r'c = %i, $\ell_p$ = %i' % (c[1], lp[1]))

ax3.hist(LExpDist,
         bins = myBins,
         histtype = 'stepfilled',
         color = '#333333',
         label = 'Experiment',
         normed = True)
ax3.hist(LModelDists[(c[2],lp[2])][1],
         bins = myBins,
         histtype = 'stepfilled',
         color = '#AAAAAA',
         alpha = 0.5,
         normed = True)
ax3.text(20, 0.022, r'c = %i, $\ell_p$ = %i' % (c[2], lp[2]))

ax4.hist(LExpDist,
         bins = myBins,
         histtype = 'stepfilled',
         color = '#333333',
         label = 'Experiment',
         normed = True)
ax4.hist(LModelDists[(c[3],lp[3])][1],
         bins = myBins,
         histtype = 'stepfilled',
         color = '#AAAAAA',
         alpha = 0.5,
         label = 'Simulation',
         normed = True)
ax4.text(20, 0.022, r'c = %i, $\ell_p$ = %i' % (c[3], lp[3]))

ax1.set_ylim((0, 0.025))
ax2.set_ylim((0, 0.025))
ax3.set_ylim((0, 0.025))
ax4.set_ylim((0, 0.025))

fig.text(0.525, 0.019, 'Radius of gyration, nm', ha='center', va='center')
fig.text(0.015, 0.5, 'Normalized frequency', ha='center', va='center', rotation='vertical')

ax1.spines['top'].set_visible(False);   ax1.xaxis.set_ticks_position('bottom')
ax1.spines['right'].set_visible(False); ax1.yaxis.set_ticks_position('left')
ax2.spines['top'].set_visible(False);   ax2.xaxis.set_ticks_position('bottom') 
ax2.spines['right'].set_visible(False); ax2.yaxis.set_ticks_position('left')
ax3.spines['top'].set_visible(False);   ax3.xaxis.set_ticks_position('bottom') 
ax3.spines['right'].set_visible(False); ax3.yaxis.set_ticks_position('left')
ax4.spines['top'].set_visible(False);   ax4.xaxis.set_ticks_position('bottom') 
ax4.spines['right'].set_visible(False); ax4.yaxis.set_ticks_position('left')

ax1.spines['bottom'].set_linewidth(0.5); ax1.spines['left'].set_linewidth(0.5)
ax2.spines['bottom'].set_linewidth(0.5); ax2.spines['left'].set_linewidth(0.5)
ax3.spines['bottom'].set_linewidth(0.5); ax3.spines['left'].set_linewidth(0.5)
ax4.spines['bottom'].set_linewidth(0.5); ax4.spines['left'].set_linewidth(0.5)

# Place legend above subplots
leg = plt.legend(bbox_to_anchor=(0.65, 0.98),
                 bbox_transform=plt.gcf().transFigure)
leg.draw_frame(False)

# Squeeze subplots into a smaller bounding box, relative to the figure
plt.tight_layout(w_pad = 0.5, rect = [0, 0, 1, 0.9])
plt.savefig('output_figs/HelaL_param_space_dists.svg')
plt.savefig('output_figs/HelaL_param_space_dists.pdf')
plt.savefig('output_figs/HelaL_param_space_dists.png')

# Plot the parameter space

# In[9]:

packRatio, pLength = zip(*LGoodParams)

options = {'vmin'   : -1.6e4,
           'vmax'   : -8000,
           'origin' : 'lower',
           'extent' : [results['Hela L']['packRatio'].min(), results['Hela L']['packRatio'].max(),
                       results['Hela L']['pLength'].min(),   results['Hela L']['pLength'].max()],
           'aspect' : 'auto'}

fig = plt.figure()

# Log-likelihood map
plt.imshow(results['Hela L']['LLH'], **options)
cbar = plt.colorbar(label = 'Log-likelihood', ticks = [-16000, -15000, -14000, -13000, -12000, -11000, -10000, -9000])
cbar.ax.set_yticklabels(['< -16000', '-15000', '-14000', '-13000', '-12000', '-11000', '-10000', '-9000'])

# Plot simulated points
props = {'alpha' : 0.6,
         'edgecolors' : None}
plt.scatter(packRatio, 
            pLength,
            s = 10,
            c = 'white',
            **props)

# Plot points from distributions
props = {'marker' : '^'}
plt.scatter(c, lp, s = 25, c = 'red', **props)

plt.xlim((results['Hela L']['packRatio'].min(), results['Hela L']['packRatio'].max()))
#plt.ylim((results['Hela L']['pLength'].min(),   results['Hela L']['pLength'].max()))
plt.ylim((results['Hela L']['pLength'].min(),   200))
plt.xlabel('Packing ratio, bp/nm')
plt.ylabel('Persistence length, nm')
plt.savefig('output_figs/HelaL_param_space.svg')
plt.savefig('output_figs/HelaL_param_space.pdf')
plt.savefig('output_figs/HelaL_param_space.png')


##### Hela S

# In[10]:

c  = [25, 40,  20,  60]
lp = [45, 110, 80, 110]

myBins = np.arange(10, 200, 5)

fig, ((ax1, ax2),(ax3, ax4)) = plt.subplots(2, 2, sharex = True, sharey = True, figsize = (3.46, 2.7), dpi = 600)

ax1.hist(SExpDist,
         bins = myBins,
         histtype = 'stepfilled',
         color = '#333333',
         label = 'Experiment',
         normed = True)
ax1.hist(SModelDists[(c[0],lp[0])][1],
         bins = myBins,
         histtype = 'stepfilled',
         color = '#AAAAAA',
         alpha = 0.5,
         normed = True)
ax1.text(20, 0.045, r'c = %i, $\ell_p$ = %i' % (c[0], lp[0]))

ax2.hist(SExpDist,
         bins = myBins,
         histtype = 'stepfilled',
         color = '#333333',
         label = 'Experiment',
         normed = True)
ax2.hist(SModelDists[(c[1],lp[1])][1],
         bins = myBins,
         histtype = 'stepfilled',
         color = '#AAAAAA',
         alpha = 0.5,
         normed = True)
ax2.text(20, 0.045, r'c = %i, $\ell_p$ = %i' % (c[1], lp[1]))

ax3.hist(SExpDist,
         bins = myBins,
         histtype = 'stepfilled',
         color = '#333333',
         label = 'Experiment',
         normed = True)
ax3.hist(SModelDists[(c[2],lp[2])][1],
         bins = myBins,
         histtype = 'stepfilled',
         color = '#AAAAAA',
         alpha = 0.5,
         normed = True)
ax3.text(20, 0.045, r'c = %i, $\ell_p$ = %i' % (c[2], lp[2]))

ax4.hist(SExpDist,
         bins = myBins,
         histtype = 'stepfilled',
         color = '#333333',
         label = 'Experiment',
         normed = True)
ax4.hist(SModelDists[(c[3],lp[3])][1],
         bins = myBins,
         histtype = 'stepfilled',
         color = '#AAAAAA',
         alpha = 0.5,
         label = 'Simulation',
         normed = True)
ax4.text(20, 0.045, r'c = %i, $\ell_p$ = %i' % (c[3], lp[3]))

ax1.set_ylim((0, 0.05))
ax2.set_ylim((0, 0.05))
ax3.set_ylim((0, 0.05))
ax4.set_ylim((0, 0.05))

fig.text(0.525, 0.019, 'Radius of gyration, nm', ha='center', va='center')
fig.text(0.015, 0.5, 'Normalized frequency', ha='center', va='center', rotation='vertical')

ax1.spines['top'].set_visible(False);   ax1.xaxis.set_ticks_position('bottom')
ax1.spines['right'].set_visible(False); ax1.yaxis.set_ticks_position('left')
ax2.spines['top'].set_visible(False);   ax2.xaxis.set_ticks_position('bottom') 
ax2.spines['right'].set_visible(False); ax2.yaxis.set_ticks_position('left')
ax3.spines['top'].set_visible(False);   ax3.xaxis.set_ticks_position('bottom') 
ax3.spines['right'].set_visible(False); ax3.yaxis.set_ticks_position('left')
ax4.spines['top'].set_visible(False);   ax4.xaxis.set_ticks_position('bottom') 
ax4.spines['right'].set_visible(False); ax4.yaxis.set_ticks_position('left')

ax1.spines['bottom'].set_linewidth(0.5); ax1.spines['left'].set_linewidth(0.5)
ax2.spines['bottom'].set_linewidth(0.5); ax2.spines['left'].set_linewidth(0.5)
ax3.spines['bottom'].set_linewidth(0.5); ax3.spines['left'].set_linewidth(0.5)
ax4.spines['bottom'].set_linewidth(0.5); ax4.spines['left'].set_linewidth(0.5)

# Place legend above subplots
leg = plt.legend(bbox_to_anchor=(0.65, 0.98),
                 bbox_transform=plt.gcf().transFigure)
leg.draw_frame(False)

# Squeeze subplots into a smaller bounding box, relative to the figure
plt.tight_layout(w_pad = 0.5, rect = [0, 0, 1, 0.9])
plt.savefig('output_figs/HelaS_param_space_dists.svg')
plt.savefig('output_figs/HelaS_param_space_dists.pdf')
plt.savefig('output_figs/HelaS_param_space_dists.png')

# Plot the parameter space

# In[11]:

packRatio, pLength = zip(*SGoodParams)

options = {'vmin'   : -1.6e4,
           'vmax'   : -4000,
           'origin' : 'lower',
           'extent' : [results['Hela S']['packRatio'].min(), results['Hela S']['packRatio'].max(),
                       results['Hela S']['pLength'].min(),   results['Hela S']['pLength'].max()],
           'aspect' : 'auto'}

fig = plt.figure()

# Log-liklihood map
plt.imshow(results['Hela S']['LLH'], **options)
cbar = plt.colorbar(label = 'Log-likelihood', ticks = [-16000, -14500, -13000, -11500, -10000, -8500, -7000, -5500])
cbar.ax.set_yticklabels(['< -16000', '-14500', '-13000', '-11500', '-10000', '-8500', '-7000', '-5500'])

# Plot simulated points
props = {'alpha' : 0.6,
         'edgecolors' : None}
plt.scatter(packRatio, 
            pLength,
            s = 10,
            c = 'white',
            **props)

# Plot points from distributions
props = {'marker' : '^'}
plt.scatter(c, lp, s = 25, c = 'red', **props)

plt.xlim((results['Hela S']['packRatio'].min(), results['Hela S']['packRatio'].max()))
plt.ylim((results['Hela S']['pLength'].min(),   results['Hela S']['pLength'].max()))
plt.xlabel('Packing ratio, bp/nm')
plt.ylabel('Persistence length, nm')
plt.savefig('output_figs/HelaS_param_space.svg')
plt.savefig('output_figs/HelaS_param_space.pdf')
plt.savefig('output_figs/HelaS_param_space.png')
