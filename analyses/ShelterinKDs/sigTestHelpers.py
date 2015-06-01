"""Helper functions and variables for running the significance tests
on the telomere data.
"""

__author__ = 'Kyle M. Douglass'
__email__ = 'kyle.douglass@epfl.ch'
__date__ = 'January 23, 2015'

import numpy as np
import matplotlib.pyplot as plt

# How many times will a bootstrap be repeated?
global numBootstraps; numBootstraps = 100000 

def bootstrapWrapper(bsFunc):
    """Wrapper for easily repeating a bootstrap resample.
    
    The number of times the resample is performed is a global variable named numBootstraps.
    
    Returns
    -------
    bsData : array of float
        The statistics determined from every resample performed on the data.
    """
    def repeatBootstrap(data, **kargs):
        
        bsData = np.zeros(numBootstraps) # numBootstraps is a global variable
       
        for ctr in range(numBootstraps):
            bsData[ctr] = bsFunc(data, **kargs)
            
        return bsData
    return repeatBootstrap
    
@bootstrapWrapper
def bootstrap(data, numSamples = None, statistic = 'mean'):
    """Takes an array of measurements and resamples them with replacement.
    
    Arguments
    ---------
    data : array of float
        The data array.
    numSamples : int (optional)
        How many times the distribution will be resampled.
        
    Returns
    -------
    bsStat : float
        The bootstrapped mean value.
    """
    if numSamples is None:
        numSamples = data.size
        
    randInts = np.random.randint(0, high = data.size, size = numSamples)
    resampledData = data[randInts]
    
    if statistic == 'mean':
        bsStat = np.mean(resampledData)
    elif statistic == 'median':
        bsStat = np.median(resampledData)
    try:
        return bsStat
    except:
        print("Error! Was the statistic argument 'mean' or 'median'?")
        raise
        
def bootstrapDiff(data1, data2, alpha = 0.05, statistic = 'mean'):
    """Compute confidence intervals and p-values for testing the null
    hypothesis that two distributions have an equal statistic vs. the
    alternative hypothesis that they are different.
    
    Arguments
    ---------
    data1, data2: array of float
        The input datasets, which need not be of equal length.
    alpha : float (default: 0.05)
        Determines the size of the confidence interval.
    statistic : string (default: 'mean')
        Which statistic will be tested? Currently only 'mean' and 'median' are accepted.
        
    Returns
    -------
    CI : 2-tuple of float
        The confidence interval at the (1 - alpha)% level.
    pValue : float
        The p-value for the test of the null hypothesis.

    """
    bsDiffs = bootstrap(data1, statistic = statistic) - bootstrap(data2, statistic = statistic)
    
    CI = (np.percentile(bsDiffs, 100 * (alpha / 2)),
          np.percentile(bsDiffs, 100 * (1 - alpha / 2)))
    
    # Compute p-value by first shifting bsDiffs to the origin,
    # and then finding the proportion of the distribution beyond the observed value.
    if statistic == 'mean':
        observedStatistic = np.mean(data1) - np.mean(data2)
    elif statistic == 'median':
        observedStatistic = np.median(data1) - np.median(data2)
    
    origin = np.mean(bsDiffs)
    shiftedDiffs = bsDiffs - origin
    
    if observedStatistic > 0:
        pValue = shiftedDiffs[shiftedDiffs > observedStatistic].size / shiftedDiffs.size
    elif observedStatistic < 0:
        pValue = shiftedDiffs[shiftedDiffs < observedStatistic].size / shiftedDiffs.size
    else:
        pValue = 0.5 # When the observed mean difference is indeed zero
        
    return CI, pValue
        
def cmpHistograms(dataset1, dataset2, opt):
    """Compare datasets by plotting them.
    
    Arguments
    ---------
    dataset1, dataset2 : array of float
        The two datasets to plot.
    opt : dictionary of plot options (see below for required keys)
        
        myBins : array of float
            The histogram bins.
        label1, label2 : str
           Labels for each distribution that are displayed in the plot legend.
        title, xlabel, ylabel : str
            Plot and axes labels.
        
    Returns
    -------
    fig, ax : matplotlib figure and axes
        The plot to display.
    """
    fig, ax = plt.subplots(1,1, dpi = 300)

    ax.hist(dataset1,
            bins = opt['myBins'],
            histtype = 'stepfilled',
            color = '#333333',
            label = opt['label1'],
            normed = True)
    ax.hist(dataset2,
            bins = opt['myBins'],
            histtype = 'stepfilled',
            color = '#AAAAAA',
            alpha = 0.5,
            label = opt['label2'],
            normed = True)
    ax.grid(True)
    ax.legend()
    ax.set_title(opt['title'])
    ax.set_xlabel(opt['xlabel'])
    ax.set_ylabel(opt['ylabel'])
    
    return fig, ax

wilcoxonTable = """<h1>Wilcoxon rank-sum test p-values</h1>
<table>
<tr>
  <th>Cell type</th>
  <th>Wild type</th>
  <th>TRF1</th>
  <th>TRF2</th>
  <th>TRF1/2</th>
</tr>
<tr>
  <td><b>Hela L</b></td>
  <td><div align = "right">%0.5f</div></td>
  <td><div align = "right">%0.5f</div></td>
  <td><div align = "right">%0.5f</div></td>
  <td><div align = "right">%0.5f</div></td>
</tr>
<tr>
  <td><b>Hela S</b></td>
  <td><div align = "right">%0.5f</div></td>
  <td><div align = "right">%0.5f</div></td>
  <td><div align = "right">%0.5f</div></td>
  <td><div align = "right">%0.5f</div></td>
</tr>
</table>"""

formattedTable = """<table>
<tr>
  <th>--</th>
  <th>Wild type</th>
  <th>TRF1</th>
  <th>TRF2</th>
  <th>TRF1/2</th>
</tr>
<tr>
  <td><b>95&#37; confidence interval</b></td>
  <td><div align = "right">(%0.5f, %0.5f)</div></td>
  <td><div align = "right">(%0.5f, %0.5f)</div></td>
  <td><div align = "right">(%0.5f, %0.5f)</div></td>
  <td><div align = "right">(%0.5f, %0.5f)</div></td>
</tr>
<tr>
  <td><b>95&#37; p-value</b></td>
  <td><div align = "right">%0.5f</div></td>
  <td><div align = "right">%0.5f</div></td>
  <td><div align = "right">%0.5f</div></td>
  <td><div align = "right">%0.5f</div></td>
</tr>
<tr>
  <td><b>99&#37; confidence interval</b></td>
  <td><div align = "right">(%0.5f, %0.5f)</div></td>
  <td><div align = "right">(%0.5f, %0.5f)</div></td>
  <td><div align = "right">(%0.5f, %0.5f)</div></td>
  <td><div align = "right">(%0.5f, %0.5f)</div></td>
</tr>
<tr>
  <td><b>99&#37; p-value</b></td>
  <td><div align = "right">%0.5f</div></td>
  <td><div align = "right">%0.5f</div></td>
  <td><div align = "right">%0.5f</div></td>
  <td><div align = "right">%0.5f</div></td>
</tr>
</table>"""
