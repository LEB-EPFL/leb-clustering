"""Analyze the day-to-day variation in means and medians of the
telomere experiment.

"""

__author__ = 'Kyle M. Douglass'
__email__ = 'kyle.douglass@epfl.ch'
__date__ = '2015-02-12'
__version__ = '0.2'

import scipy.io as sio
import numpy as np
import matplotlib.pyplot as plt

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

    Returns
    -------
    stats : dict
        Dictionary of the statistic for each experiment.
    stdErr : dict
        Dictionary for the standard error of the mean calculated in
        each experiment.
    """
    if statistic == 'mean':
        statFunc = np.mean
    elif statistic == 'median':
        statFunc = np.median
    elif statistic == 'identity':
        statFunc = lambda x: x
    else:
        print("Error: statistic not recognized.")
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

def plotStats(y11, y11e, y12, y12e, y21, y21e, y22, y22e, label2 = 'TRF2', xticks = []):
    """Make a plot showing the day-to-day variation in an experimental
    statistic.

    y11 and y12 are plotted on the top plot; y21 and y22 on the bottom.
    'e' denotes the standard error of the mean.

    Parameters
    ----------
    label2 : str
        Label for the second dataset.
    xticks : array of str
        Labels for the a-axis ticks.
    """

    Style1 = {'linewidth' : 2,
              'color'     : 'blue',
              'marker'    : 'o',
              'markersize' : 7}
    Style2 = {'linewidth' : 2,
              'color'     : 'green',
              'marker'    : 'o',
              'markersize' : 7,
              'label' : label2}

    xLength = range(len(y11))

    fig, ((ax1), (ax2)) = plt.subplots(2, 1,
                                       sharex = True,
                                       figsize = (10, 7),
                                       dpi = 300)
    
    ax1.errorbar(xLength, y11, yerr = y11e, label = 'pSuper', **Style1)
    ax1.errorbar(xLength, y12, yerr = y12e, **Style2)
    ax1.grid(True)
    ax1.legend()
    ax1.set_ylim((80, 130))
    ax1.set_title('Hela L')

    ax2.errorbar(xLength, y21, yerr = y21e, label = 'pSuper', **Style1)
    ax2.errorbar(xLength, y22, yerr = y22e, **Style2)
    ax2.grid(True)
    ax2.legend()
    ax2.set_ylim((60, 110))
    ax2.set_title('Hela S')

    # Remove pSuper from label name
    ax2.set_xticklabels(xticks, rotation = 'vertical')
    plt.tight_layout()

    return fig, ((ax1, ax2))

def plotDistr(data, pool, **options ):
    """Make a histogram of the distributions to compare to the pool.
        
    """
    fig, ax = plt.subplots(1, 1, figsize = (8,6), dpi = 300)

    ax.hist(pool,
            bins = options['myBins'],
            histtype='stepfilled',
            color = '#333333',
            normed = True,
            label = 'Pool')

    ax.hist(data,
            bins = options['myBins'],
            histtype='stepfilled',
            color = '#AAAAAA',
            alpha = 0.5,
            normed = True,
            label = options['label'])

    plt.grid(True)
    plt.legend()
    plt.title(options['title'])
    ax.annotate('N = %d' % len(data), xy = (10, 0.021), xytext = (10, 0.021))    

    return fig, ax
