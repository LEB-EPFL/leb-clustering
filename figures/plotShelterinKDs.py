
# coding: utf-8

# # Analysis of the Shelterin Knockdown Data #

# This workbook describes the analysis performed on the STORM data of Hela cells with various shelterin knockdowns.
# 
# We started looking at the day-to-day variation in the mean and median radius of gyration ($R_g$) values because we found that some of the datasets were more strongly influencing the shape of the pooled distributions than others. My first attempts at plotting these variations was to plot the mean (or median) radius of gyration as a function of the day the experiment was run. The two time-series curves for the control (pSuper) and the knockdown were compared like this.
# 
# This seemed to incur a lot of opposition from my group, partly because they saw large changes in the absolute size as troublesome. Seamus suggested instead plotting their differences; this makes sense because there's a strong correlation in relative differences when plotted day-to-day, even if the absolute values change by a lot.
# 
# Now, I will try plotting the differences between control and knockdowns to see if this is more informative for assessing the dependence of telomere size on any particular Shelterin component.

# ## Setup the environment ##


import scipy.io as sio
import day2day as d2d
from sigTestHelpers import bootstrapDiff
import numpy as np
import matplotlib.pyplot as plt


# In[2]:

pathToDists = '../analyses/Experiment_6_Pool_TRF1_TRF2/'

# Read the Matlab data into the Python namespace
mlData = sio.loadmat(''.join((pathToDists, 'matlab.mat')), variable_names = 'data')

# List of experiment names to read
# (Note that we're not including the pooled data anymore)
expName = {'pSuper' : ['08-09-2014 pSuper',
                       '09-09-2014 pSuper',
                       '21-10-2014 pSuper',
                       '05-11-2014 pSuper',
                       '17-11-2014 pSuper'],
           'TRF1' :   ['08-09-2014 TRF1',
                       '09-09-2014 TRF1',
                       '21-10-2014 TRF1',
                       '05-11-2014 TRF1',
                       '17-11-2014 TRF1'],
           'TRF2' :   ['08-09-2014 TRF2',
                       '09-09-2014 TRF2',
                       '21-10-2014 TRF2',
                       '05-11-2014 TRF2',
                       '17-11-2014 TRF2'],
           'TRF1/2' : ['08-09-2014 TRF1 TRF2',
                       '09-09-2014 TRF1 TRF2',
                       '21-10-2014 TRF1 TRF2',
                       '05-11-2014 TRF1 TRF2',
                       '17-11-2014 TRF1 TRF2']}

stats = {'Hela L' : {'Mean' : {'Diffs' : {}}, 'Median' : {'Diffs' : {}}, 'Std. Err.' : {'Diffs' : {}}},
         'Hela S' : {'Mean' : {'Diffs' : {}}, 'Median' : {'Diffs' : {}}, 'Std. Err.' : {'Diffs' : {}}}}

# Remove pSuper from experiment names to make plot xtick labels
ticklabels = []
for label in expName['pSuper']:
    ticklabels.append(label[:-7])
ticklabels = sorted(ticklabels)


# ## Read the distributions into memory ##

# In[3]:

# Define the dictionary for holding the distribution data
dists = {'Hela L' : {name: {} for name in expName.keys()},
         'Hela S' : {name: {} for name in expName.keys()}}

# Assign the distribution for each data to a leaf in the tree of distributions above
for name in expName.keys():
    dists['Hela L'][name], _ = d2d.findStats(mlData, expName[name], cellType = 'L', statistic = 'identity')
    dists['Hela S'][name], _ = d2d.findStats(mlData, expName[name], cellType = 'S', statistic = 'identity')


# ## Compute the summary statistics ##

# In[4]:

# Calculate all means, medians, and standard errors of the means
for name in expName.keys():
    stats['Hela L']['Mean'][name],   stats['Hela L']['Std. Err.'][name]   = d2d.findStats(mlData, expName[name], cellType = 'L', statistic = 'mean')
    stats['Hela L']['Median'][name], _                                    = d2d.findStats(mlData, expName[name], cellType = 'L', statistic = 'median')
    
    stats['Hela S']['Mean'][name],   stats['Hela S']['Std. Err.'][name]   = d2d.findStats(mlData, expName[name], cellType = 'S', statistic = 'mean')
    stats['Hela S']['Median'][name], _                                    = d2d.findStats(mlData, expName[name], cellType = 'S', statistic = 'median')


# ### Find differences between knockdowns and control ###

# Now that the means and medians for each experiment have been calculated, we'll compute the difference between each knockdown experiment and the control (labeled pSuper).

# In[5]:

# Filter out pSuper from names of keys
listOfKDs = list(filter(lambda x: (x != 'pSuper') and (x != 'Diffs'), stats['Hela L']['Mean'].keys()))

for knockdown in listOfKDs:
    diffMeanL   = -d2d.sortStats(stats['Hela L']['Mean']['pSuper'])   + d2d.sortStats(stats['Hela L']['Mean'][knockdown])
    diffMedianL = -d2d.sortStats(stats['Hela L']['Median']['pSuper']) + d2d.sortStats(stats['Hela L']['Median'][knockdown])
    diffMeanS   = -d2d.sortStats(stats['Hela S']['Mean']['pSuper'])   + d2d.sortStats(stats['Hela S']['Mean'][knockdown])
    diffMedianS = -d2d.sortStats(stats['Hela S']['Median']['pSuper']) + d2d.sortStats(stats['Hela S']['Median'][knockdown])
    
    diffErrL = np.sqrt(d2d.sortStats(stats['Hela L']['Std. Err.']['pSuper'])**2 + d2d.sortStats(stats['Hela L']['Std. Err.'][knockdown])**2)
    diffErrS = np.sqrt(d2d.sortStats(stats['Hela S']['Std. Err.']['pSuper'])**2 + d2d.sortStats(stats['Hela S']['Std. Err.'][knockdown])**2)
    
    stats['Hela L']['Mean']['Diffs'][knockdown]      = diffMeanL
    stats['Hela L']['Median']['Diffs'][knockdown]    = diffMedianL
    stats['Hela L']['Std. Err.']['Diffs'][knockdown] = diffErrL
    stats['Hela S']['Mean']['Diffs'][knockdown]      = diffMeanS
    stats['Hela S']['Median']['Diffs'][knockdown]    = diffMedianS
    stats['Hela S']['Std. Err.']['Diffs'][knockdown] = diffErrS


# ## Find the bootstrapped confidence intervals ##

# Originally, I was using the standard error of the mean to construct confidence intervals and assess the difference of means between the control (pSuper) and knockdown distributions. However, this requires an assumption of normality which in all likelihood is not satisfied. So, I will instead compute bootstrap estimates for the confidence intervals.

# In[6]:

# Build the bootstrap branch of the stats dictionary
stats['Hela L']['Bootstrap'] = {'TRF1'   : {},
                                'TRF2'   : {},
                                'TRF1/2' : {}}
stats['Hela S']['Bootstrap'] = {'TRF1'   : {},
                                'TRF2'   : {},
                                'TRF1/2' : {}}

for name in listOfKDs:
    # Get the dates from stats['Hela L']['Mean']
    # I could have gotten them from another branch of the stats dictionary as well.
    for key in stats['Hela L']['Mean'][name].keys():
        # Load the the two distributions for which to compute the bootstrap statistics
        currDate  = key[:10]
        
        controlL  = dists['Hela L']['pSuper'][' '.join((currDate, 'pSuper'))]
        controlS  = dists['Hela S']['pSuper'][' '.join((currDate, 'pSuper'))]
        
        currDistL = dists['Hela L'][name][key]
        currDistS = dists['Hela S'][name][key]
        
        # Create two keys in the dictionary: one for the confidence intervals and one for the p-value
        stats['Hela L']['Bootstrap'][name][key] = {'CI': [], 'pValue': []}
        stats['Hela S']['Bootstrap'][name][key] = {'CI': [], 'pValue': []}
        
        print('Now computing bootstrap statistics for knockdown: {0} and date: {1}'.format(name, key))
        
        # Compute the bootstrapped confidence interval and p-values for the difference of means
        stats['Hela L']['Bootstrap'][name][key]['CI'], stats['Hela L']['Bootstrap'][name][key]['pValue'] = bootstrapDiff(currDistL, controlL)
        stats['Hela S']['Bootstrap'][name][key]['CI'], stats['Hela S']['Bootstrap'][name][key]['pValue'] = bootstrapDiff(currDistS, controlS)


# ### Verify everything was computed correctly ###

# You can verify that the numbers are more-or-less the same (they'll differ slightly due to random resampling) by changing the keys in the next two lines so that you compute the bootstrap difference and compare it to the one computed in the previous section inside the **stats** dictionary.

# In[7]:

bootstrapDiff(dists['Hela L']['TRF2']['08-09-2014 TRF2'], dists['Hela L']['pSuper']['08-09-2014 pSuper'])


# In[8]:

stats['Hela L']['Bootstrap']['TRF2']['08-09-2014 TRF2']


# ### Convert confidence intervals to error bars ###

# In[26]:

for experiment in listOfKDs:
    
    # Initialize the array to hold the error bars
    stats['Hela L']['Bootstrap'][experiment]['Error Bars'] = []
    stats['Hela S']['Bootstrap'][experiment]['Error Bars'] = []
    
    for expDate in sorted(stats['Hela L']['Bootstrap'][experiment].keys()):
        
        # Skip the "Error bar key"
        if expDate == 'Error Bars':
            continue
            
        """
        Extract the confidence interval, convert it to a (one-sided) errorbar,
        and append it to the stats dictionary.
        """
        CIL    = stats['Hela L']['Bootstrap'][experiment][expDate]['CI']
        CIS    = stats['Hela S']['Bootstrap'][experiment][expDate]['CI']
    
        errorL = (CIL[1] - CIL[0]) / 2
        errorS = (CIS[1] - CIS[0]) / 2
        
        stats['Hela L']['Bootstrap'][experiment]['Error Bars'].append(errorL)
        stats['Hela S']['Bootstrap'][experiment]['Error Bars'].append(errorS)

# -----
# # Plot the results

# Check out [this link](http://nbviewer.ipython.org/gist/fonnesbeck/5850463) for ideas on plotting the scatter.

# In[67]:

fig, ax1 = plt.subplots(1, 1, figsize = (8,6))

lineprops = dict(linewidth = 1.0, color = 'k')
pointSpread = 0.15 # For spreading the datapoints in the x-direction
pointSize = 4 # Data point marker size

dataLength  = len(stats['Hela L']['Mean']['Diffs']['TRF1'])
positions   = np.linspace(-pointSpread, pointSpread, dataLength) # Where to place the markers
markers     = ['ob', '^y', 'sg', 'Dr', '>k']

# Build legend labels
fullDateStrings = list(sorted(stats['Hela S']['Mean']['TRF1'].keys()))
legendLabel     = [date[:10] for date in fullDateStrings]

# Hela L
# Use a different marker for each date an experiment was performed on
for dateCtr in range(dataLength):
    ax1.errorbar(1 + positions[dateCtr],
                 stats['Hela L']['Mean']['Diffs']['TRF1'][dateCtr],
                 #yerr  = stats['Hela L']['Std. Err.']['Diffs']['TRF1'][dateCtr],
                 yerr  = stats['Hela L']['Bootstrap']['TRF1']['Error Bars'][dateCtr],
                 fmt   = markers[dateCtr],
                 alpha = 0.65,
                 markersize = pointSize,
                 label = legendLabel[dateCtr])

    ax1.errorbar(2 + positions[dateCtr],
                 stats['Hela L']['Mean']['Diffs']['TRF2'][dateCtr],
                 #yerr  = stats['Hela L']['Std. Err.']['Diffs']['TRF2'][dateCtr],
                 yerr  = stats['Hela L']['Bootstrap']['TRF2']['Error Bars'][dateCtr],
                 fmt   = markers[dateCtr],
                 alpha = 0.65,
                 markersize = pointSize)

    ax1.errorbar(3 + positions[dateCtr],
                 stats['Hela L']['Mean']['Diffs']['TRF1/2'][dateCtr],
                 #yerr  = stats['Hela L']['Std. Err.']['Diffs']['TRF1/2'][dateCtr],
                 yerr  = stats['Hela L']['Bootstrap']['TRF1/2']['Error Bars'][dateCtr],
                 fmt   = markers[dateCtr],
                 alpha = 0.65,
                 markersize = pointSize)

ax1.plot([0,4], [0,0], 'k', linewidth = 1)

ax1.spines['top'].set_visible(False)
ax1.spines['right'].set_visible(False)
ax1.xaxis.set_ticks_position('bottom')
ax1.yaxis.set_ticks_position('left')

ax1.set_xlim((0.5, 3.5))
ax1.set_ylim((-20, 30))
ax1.set_xticks([1,2,3])
ax1.set_xticklabels(['TRF1', 'TRF2', 'TRF1/2'])
ax1.set_ylabel(r'Difference between knockdown and control mean $R_g$, nm')
plt.legend(loc = 'upper center')
plt.tight_layout()
plt.savefig('output_figs/Hela_L_TRF_KDs.pdf')

# ### Hela S

# In[68]:

fig, ax2 = plt.subplots(1, 1, figsize = (8,6))

lineprops   = dict(linewidth = 1.0, color = 'k')
pointSpread = 0.15 # For spreading the datapoints in the x-direction
pointSize   = 4    # Data point marker size

dataLength  = len(stats['Hela S']['Mean']['Diffs']['TRF1'])
positions   = np.linspace(-pointSpread, pointSpread, dataLength) # Where to place the markers
markers     = ['ob', '^y', 'sg', 'Dr', '>k']

# Build legend labels
fullDateStrings = list(sorted(stats['Hela S']['Mean']['TRF1'].keys()))
legendLabel     = [date[:10] for date in fullDateStrings]

# Hela S
# Use a different marker for each date an experiment was performed on
for dateCtr in range(dataLength):
    ax2.errorbar(1 + positions[dateCtr],
                 stats['Hela S']['Mean']['Diffs']['TRF1'][dateCtr],
                 #yerr  = stats['Hela S']['Std. Err.']['Diffs']['TRF1'][dateCtr],
                 yerr  = stats['Hela S']['Bootstrap']['TRF1']['Error Bars'][dateCtr],
                 fmt   = markers[dateCtr],
                 alpha = 0.65,
                 markersize = pointSize,
                 label = legendLabel[dateCtr])

    ax2.errorbar(2 + positions[dateCtr],
                 stats['Hela S']['Mean']['Diffs']['TRF2'][dateCtr],
                 #yerr  = stats['Hela S']['Std. Err.']['Diffs']['TRF2'],
                 yerr  = stats['Hela S']['Bootstrap']['TRF2']['Error Bars'][dateCtr],
                 fmt   = markers[dateCtr],
                 alpha = 0.65,
                 markersize = pointSize)

    ax2.errorbar(3 + positions[dateCtr],
                 stats['Hela S']['Mean']['Diffs']['TRF1/2'][dateCtr],
                 #yerr  = stats['Hela S']['Std. Err.']['Diffs']['TRF1/2'],
                 yerr  = stats['Hela S']['Bootstrap']['TRF1/2']['Error Bars'][dateCtr],
                 fmt   = markers[dateCtr],
                 alpha = 0.65,
                 markersize = pointSize)

ax2.plot([0,4], [0,0], 'k', linewidth = 1)

ax2.spines['top'].set_visible(False)
ax2.spines['right'].set_visible(False)
ax2.xaxis.set_ticks_position('bottom')
ax2.yaxis.set_ticks_position('left')

ax2.set_xlim((0.5, 3.5))
ax2.set_ylim((-20, 30))
ax2.set_xticks([1,2,3])
ax2.set_xticklabels(['TRF1', 'TRF2', 'TRF1/2'])
ax2.set_ylabel(r'Difference between knockdown and control mean $R_g$, nm')
plt.legend(loc = 'lower right')
plt.tight_layout()
plt.savefig('output_figs/Hela_S_TRF_KDs.pdf')



