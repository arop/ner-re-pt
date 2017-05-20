##  Module stats.py
##
##  Copyright (c) 2015 Mashimo
##
##  Licensed under the Apache License, Version 2.0 (the "License");
##  you may not use this file except in compliance with the License.
##  You may obtain a copy of the License at
##
##  http://www.apache.org/licenses/LICENSE-2.0
##
##  Unless required by applicable law or agreed to in writing, software
##  distributed under the License is distributed on an "AS IS" BASIS,
##  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
##  See the License for the specific language governing permissions and
##  limitations under the License.

"""
Basic statistics module for data analysis and inference

This module provides functions for calculating statistics of data, including
averages, variance, and standard deviation.

All values are rounded by default to 3 digits precision after the comma,
but it can be changed using the argument 'precision'.
See python.org for more information about its floating Point architecture: 
issues and limitations.
"""

# === Exceptions ===

class StatsError(ValueError):
    pass


# === Helper functions ===

def _getOccurencies(dataPoints):
    listOfTerms = {} # all terms found

    for x in dataPoints:
        if x in listOfTerms:
            listOfTerms[x] += 1
        else:
            listOfTerms[x] = 1
                    
    return listOfTerms    

def _diff_mean(x):
      # given a x data set, return an array with the distance between each
	# data point in x and the mean of the input data set x.
	x_bar = mean(x)
	return [x_i - x_bar for x_i in x]
    
# === Measures of central tendency (averages) ===
     
def mean(dataPoints, precision=3):
    """
    the arithmetic average of given data
    Arguments:
        dataPoints: a list of data points, int or float
        precision (optional): digits precision after the comma, default=3

    Returns:
        float, the mean of the input
        or StatsError if X is empty.
    """
    try:
        return round(sum(dataPoints) / float(len(dataPoints)), precision)
    except ZeroDivisionError:
        raise StatsError('no data points passed')

def median(dataPoints):
    """
    the median of given data
    Arguments:
        dataPoints: a list of data points, int or float

    Returns:
        the middle number in the sorted list, a float or an int
    """
    if not dataPoints:
        raise StatsError('no data points passed')
        
    sortedPoints = sorted(dataPoints)
    mid = len(sortedPoints) // 2  # uses the floor division to have integer returned
    if (len(sortedPoints) % 2 == 0):
        # even
        return (sortedPoints[mid-1] + sortedPoints[mid]) / 2.0
    else:
        # odd
        return sortedPoints[mid]
        
    
def mode(dataPoints):
    '''
    All modes (you can have multiple modes in a data set) of the given data
    Argument:
        dataPoints: a list of data points, int or float
    Returns:
        list, the most common number(s) in the argument list
    '''
    if not dataPoints:
        raise StatsError('no data points passed')
        
    dataAndOcc = _getOccurencies(dataPoints)
    
    maxOccurence = max(dataAndOcc.values())
    return [k for k,v in dataAndOcc.items() if v == maxOccurence]

# === Measures of spread ===
    
def stdDev(X, precision=3):
    """
    standard deviation of the given data (population)
    Argument:
        X: data points, a list of int
        precision (optional): digits precision after the comma, default=3
    Returns:
        float, the standard deviation of the input sample
    """

    tot = 0.0
    meanX = mean(X,10)

    for x in X:
        tot += (x - meanX) ** 2
    return round((tot/len(X))**0.5, precision)
        
def coeffVar(X, precision=3):
    """
    Coefficient of variation of the given data (population)
    Argument:
        X: data points, a list of int, do not mix negative and positive numbers
        precision (optional): digits precision after the comma, default=3
    Returns:
        float, the cv (measure of dispersion) of the input sample
        or raise StatsError('mean is zero') if the mean = 0
    """
    try:
        return round(stdDev(X, precision) / mean(X, precision), precision)
    except ZeroDivisionError:
        raise StatsError('mean is zero')
    
def stdDevOfLengths(L):
    """
    standard deviation of the lengths of given strings
    Argument:
        L: a list of strings

    Returns:
        float, the standard deviation of the lengths of the strings,
        or StatsError if L is empty.
    """
    if not L:
        raise StatsError('no data points passed')
        
    strLen = []
    for i in L:
        strLen.append(len(i))
    
    return stdDev(strLen)
  
# === Measures of range ===
def range(dataPoints):
    if not dataPoints:
        raise StatsError('no data points passed')
        
    return max(dataPoints) - min(dataPoints)

def quartiles(dataPoints):
    """
    the lower and upper quartile
    Arguments:
        dataPoints: a list of data points, int or float

    Returns:
        the first and the last quarter in the sorted list, a tuple of float or int
    """
    if not dataPoints:
        raise StatsError('no data points passed')
        
    sortedPoints = sorted(dataPoints)
    mid = len(sortedPoints) // 2 # uses the floor division to have integer returned
    
    if (len(sortedPoints) % 2 == 0):
        # even
        lowerQ = median(sortedPoints[:mid])
        upperQ = median(sortedPoints[mid:])
    else:
        # odd
        lowerQ = median(sortedPoints[:mid])
        upperQ = median(sortedPoints[mid+1:])
            
    return (lowerQ, upperQ)

# === Summary ===
def summary(dataPoints):
    if not dataPoints:
        raise StatsError('no data points passed')
        
    print ("Summary statistics")
    print ("Min      : ", min(dataPoints))
    print ("Lower Qu.: ", quartiles(dataPoints)[0])
    print ("Median   : ", median(dataPoints))
    print ("Mean     : ", mean(dataPoints))
    print ("Upper Qu.: ", quartiles(dataPoints)[1])
    print ("Max      : ", max(dataPoints))
    return "That's all" # this avoids printing None
    
# === Measures of relation ===
def covariance(x, y, precision=3):
    """
    Covariance of two variables
    Arguments:
        x,y: lists of data points, int or float
        precision: digits number of precision for resul (default=3)

    Returns:
        the covariance (float)
    """
    # given two data sets x and y, return their linear relationship
    
    if not x or not y:
        raise StatsError('no data points passed')

    n = len(x)

    if (n == 1):
        raise StatsError('Too few data points')
        
    if n != len(y):
        raise StatsError('the two datasets must have the same length')
        
    vectorsProduct = sum(i*j for i,j in zip(_diff_mean(x),_diff_mean(y)))
    return round(vectorsProduct / (n - 1), precision)
    # using numpy : return np.dot(_diff_mean(x), _diff_mean(y)) / (n - 1)

def correlation(x, y, precision=3):
    """
    Correlation between two variables from a sample
    Arguments:
        x,y: lists of data points (sample), int or float
        precision: digits number of precision for resul (default=3)

    Returns:
        the correlation (float) as Pearson coefficient
    """

    if not x or not y:
        raise StatsError('no data points passed')
        
    if len(x) != len(y):
        raise StatsError('the two datasets must have the same length')

    if len(x) < 3:
        raise StatsError('Too few data points')

        
    x_diff = _diff_mean(x)
    y_diff = _diff_mean(y)


    sum_xy = sum([i * j for i, j in zip(x_diff, y_diff)])
    x_diff_sq = sum([i**2 for i in x_diff])
    y_diff_sq = sum([i**2 for i in y_diff])


    return round(sum_xy / ((x_diff_sq * y_diff_sq)**0.5), precision)

    
def correlationPop(x, y, precision = 3):
    """
    Correlation between two variables from a population
    Arguments:
        x,y: lists of data points (sample), int or float
        precision: digits number of precision for resul (default=3)

    Returns:
        the correlation (float) using the covariance
    """

    stdev_x = stdDev(x)
    stdev_y = stdDev(y)
    if stdev_x > 0 and stdev_y > 0:
        return covariance(x, y) / (stdev_x * stdev_y)
    else:
        return 0    # if no variation, correlation is zero


# === Examples of usage : python stats.py ===
if __name__ == "__main__":
    
    X = [10.3, 4.1, 12, 15.5, 20.2, 5.5, 15.5, 4.1]

    print ("=== Stats library - Type help(stats.py) to see the available functions.")
    print ("Examples of usage these functions:")
    print ("-------------")
    print ("X= ", X)
    print ("mean(X) = ", mean(X), " and shall be 10.9")
    print ("median(X) = ", median(X), " and shall be 11.15")
    print ("mode(X) = ", mode(X), " and shall be two: 4.1 and 15.5")
    print ("stdDev(X) = ", stdDev(X), " and shall be 5.613")
    print ("coeffVar(X) = ", coeffVar(X), " and shall be 0.515")
    print ("range(X) = ", range(X), " and shall be 16.1")
    print ("covariance(X,X) = ", covariance(X,X), " and shall be around 36")
    print ("--------------")
    print ("summary(X):")
    summary(X)    
