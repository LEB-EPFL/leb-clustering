"""Analyze the day-to-day variation in means and medians of the TRF1,
TRF2, and TRF1/2 knockdowns.

"""

__author__ = 'Kyle M. Douglass'
__email__ = 'kyle.douglass@epfl.ch'
__date__ = '2015-02-01'
__version__ = '0.1'

import scipy.io as sio
import numpy as np

def findExpInd(data, listOfNames):
    """Find the numerical indexes of a telomere Matlab data array that
    match the experiment names provided in listOfNames.

    Parameters
    ----------
    data : dict
        Dictionary containing variables from a .mat file.
    listOfNames : list of str
        Names of the experiments to read from the .mat file.
    """
    indexes = []
    for ind, expName in enumerate(data['data']['experimentShortName'][0]):
        if expName[0] in listOfNames:
            indexes.append(ind)

    return indexes

def findStats(data, listOfNames, cellType = 'L', statistic = 'mean'):
    """Computes the mean or median radius of gyration for the telomere
    datasets in listOfNames.

    Parameters
    ----------
    data : dict
        Dictionary containing variables from a .mat file.
    listOfNames : list of str
        Names of the experiments to read from the .mat file.
    cellType : str, default: 'L'
        Either 'L' or 'S' for Hela L or Hela S, respectively.
    statistic : str, default: 'mean'
        Either 'mean' or 'median' for the statistic to compute.
    """
    if statistic == 'mean':
        statFunc = np.mean
    elif statistic == 'median':
        statFunc = np.median
    else:
        print("Error: statistic must be either 'mean' or 'median'.")
        raise

    if cellType == 'L':
        start, spacing = 0, 2
    elif cellType == 'S':
        start, spacing = 1, 2
    else:
        print("Error: cellType must be either 'L' or 'S'.")
        raise

    stats = {}
    stdErr = {}
    indxs = findExpInd(data, listOfNames)
    for nameCtr, dataCtr in enumerate(indxs[start::spacing]):
        currData = data['data'][0, dataCtr]['distributions']['RgTrans'][0][0]
        currStat = statFunc(currData)
        
        # Return the statistic and the standard error of the mean
        stats[listOfNames[nameCtr]] = currStat
        stdErr[listOfNames[nameCtr]] = np.std(currData) / np.sqrt(currData.size)
        
    return stats, stdErr

def sortStats(statsDict):
    """Sort a dictionary of statistics by the key (experiment name) and
    return a numpy array for plotting.

    Parameters
    ----------
    statsDict : dict of float
        Dictionary containing a telomere size statistic.

    Returns
    -------
    sortedArray : numpy array of float
        The same values in the dict but sorted alphabetically by key.
        
    """
    sortedArray = np.zeros(len(statsDict))
    
    for ctr, key in enumerate(sorted(statsDict.keys())):
        sortedArray[ctr] = statsDict[key]

    return sortedArray
    

# Read the Matlab data into the Python namespace
mlData = sio.loadmat('matlab.mat', variable_names = 'data')

# List of experiment names to read
expNamespSup = ['Pooled pSuper',
                '08-09-2014 pSuper',
                '09-09-2014 pSuper',
                '21-10-2014 pSuper',
                '05-11-2014 pSuper',
                '17-11-2014 pSuper']
expNamesTRF2 = ['Pooled TRF2',
                '08-09-2014 TRF2',
                '09-09-2014 TRF2',
                '21-10-2014 TRF2',
                '05-11-2014 TRF2',
                '17-11-2014 TRF2']

meanStats = {'Hela L' : {},
             'Hela S' : {}}
medianStats = {'Hela L' : {},
               'Hela S' : {}}
stdErr = {'Hela L' : {},
          'Hela S' : {}}
    
meanStats['Hela L']['pSuper'], _ = findStats(mlData, expNamespSup, cellType = 'L', statistic = 'mean')
meanStats['Hela L']['TRF2'], _ = findStats(mlData, expNamesTRF2, cellType = 'L', statistic = 'mean')
medianStats['Hela L']['pSuper'], _ = findStats(mlData, expNamespSup, cellType = 'L', statistic = 'median')
medianStats['Hela L']['TRF2'], _ = findStats(mlData, expNamesTRF2, cellType = 'L', statistic = 'median')

meanStats['Hela S']['pSuper'], _ = findStats(mlData, expNamespSup, cellType = 'S', statistic = 'mean')
meanStats['Hela S']['TRF2'], _ = findStats(mlData, expNamesTRF2, cellType = 'S', statistic = 'mean')
medianStats['Hela S']['pSuper'], _ = findStats(mlData, expNamespSup, cellType = 'S', statistic = 'median')
medianStats['Hela S']['TRF2'], _ = findStats(mlData, expNamesTRF2, cellType = 'S', statistic = 'median')

_, stdErr['Hela L']['pSuper'] = findStats(mlData, expNamespSup, cellType = 'L')
_, stdErr['Hela S']['pSuper'] = findStats(mlData, expNamespSup, cellType = 'S')

_, stdErr['Hela L']['TRF2'] = findStats(mlData, expNamesTRF2, cellType = 'L')
_, stdErr['Hela S']['TRF2'] = findStats(mlData, expNamesTRF2, cellType = 'S')

# Plot the TRF2 knockdown data
import matplotlib.pyplot as plt

LStyle = {'linewidth' : 2,
          'color'     : 'blue',
          'marker'    : 'o',
          'markersize' : 7}
SStyle = {'linewidth' : 2,
          'color'     : 'green',
          'marker'    : 'o',
          'markersize' : 7}

fig, ((ax1), (ax2)) = plt.subplots(2, 1, sharex = True)


y1DatapSup = sortStats(meanStats['Hela S']['pSuper'])
y1DataTRF2 = sortStats(meanStats['Hela S']['TRF2'])
yerr1pSup = sortStats(stdErr['Hela S']['pSuper'])
yerr1TRF2 = sortStats(stdErr['Hela S']['TRF2'])

ax1.errorbar(range(len(yerr1pSup)), y1DatapSup, yerr = yerr1pSup, label = 'pSuper', **LStyle)
ax1.errorbar(range(len(yerr1TRF2)), y1DataTRF2,  yerr = yerr1TRF2, label = 'TRF2', **SStyle)
ax1.grid(True)
ax1.legend()
ax1.set_ylim((60, 110))
ax1.set_title('Mean values')

y2DatapSup = sortStats(medianStats['Hela S']['pSuper'])
y2DataTRF2 = sortStats(medianStats['Hela S']['TRF2'])
yerr2pSup = sortStats(stdErr['Hela S']['pSuper'])
yerr2TRF2 = sortStats(stdErr['Hela S']['TRF2'])

ax2.errorbar(range(len(yerr2pSup)), y2DatapSup, yerr = yerr2pSup, label = 'pSuper', **LStyle)
ax2.errorbar(range(len(yerr2TRF2)), y2DataTRF2, yerr = yerr2TRF2, label = 'TRF2', **SStyle)
ax2.grid(True)
ax2.legend()
ax2.set_ylim((60, 110))
ax2.set_title('Median values')

# Remove pSuper from label name
tickLabels = sorted(list(meanStats['Hela S']['pSuper'].keys()))
for indx, label in enumerate(tickLabels):
    tickLabels[indx] = label[:-7]

ax2.set_xticklabels(tickLabels, rotation = 'vertical')
plt.tight_layout()
plt.show()













