import unittest
import stats

# === Unit tests for stats ===
# use like this: python stats_unittest.py
# acceptance tests are in the file testStats.py

  # define a class inheriting from unittest.TestCase  
  # that will contain as methods all the unit tests.
class statsTest(unittest.TestCase):

    def SetUp(self):
        # put here all the initializations
        pass
        
    # mean
        
    def testEmptyMean(self):
            # passing empty list to mean() must raise exception
        self.assertRaises(stats.StatsError, stats.mean, [])
        
    def testSingleMean(self):
            # passing only one data point to mean() must return the same value
        self.assertEqual(stats.mean([25]), 25)
        
    def testDefaultPrecisionMean(self):
        X = [10, 4, 12, 15, 20, 5, 7]
        self.assertEqual(stats.mean(X), 10.429)

    def testOtherPrecisionMean(self):
        X = [10, 4, 12, 15, 20, 5, 7]
        self.assertEqual(stats.mean(X,4), 10.4286)

    # median
        
    def testEmptyMedian(self):
            # passing empty list to median() must raise exception
        self.assertRaises(stats.StatsError, stats.mean, [])

    def testSingleMedian(self):
            # passing only one data point to median() must return the same value
        self.assertEqual(stats.median([7]), 7)
        
    # mode

    def testEmptyMode(self):
            # passing empty list to mode() must raise exception
        self.assertRaises(stats.StatsError, stats.mode, [])

    def testSingleMode(self):
            # passing only one data point to mode() must return a list with that value
        self.assertEqual(stats.mode([25.7]), [25.7])
        
    # standard deviation

    def testEmptyStdDev(self):
            # passing empty list to stdDev() must raise exception
        self.assertRaises(stats.StatsError, stats.stdDev, [])
      
    def testSingleStdDev(self):
            # passing only one data point to stdDev() must return zero (no deviation!)
        self.assertEqual(stats.stdDev([5]), 0.0)
          
    def testDefaultPrecisionStdDev(self):
        X = [1, 2, -2, 4, -3]
        self.assertEqual(stats.stdDev(X), 2.577)

    def testOtherPrecisionStdDev(self):
        X = [1, 2, -2, 4, -3]
        self.assertEqual(stats.stdDev(X,4), 2.5768)

    # coefficient of variation

    def testEmptyCoeffVar(self):
            # passing empty list must raise exception
        self.assertRaises(stats.StatsError, stats.coeffVar, [])

    def testZeroMeanCoeffVar(self):
            # passing mixed list with mean=0 must raise exception
        self.assertRaises(stats.StatsError, stats.coeffVar, [-3,0,3])

    def testSingleCoeffVar(self):
            # passing only one data point must return zero (no deviation!)
        self.assertEqual(stats.coeffVar([5]), 0.0)
          
    def testDefaultPrecisionCV(self):
        X = [1, 2, 2, 4, 3]
        self.assertEqual(stats.coeffVar(X), 0.425)

    def testOtherPrecisionCV(self):
        X = [1, 2, 2, 4, 3]
        self.assertEqual(stats.coeffVar(X,5), 0.42492)

    # range
    
    def testRange(self):
                # passing empty list must raise exception
        self.assertRaises(stats.StatsError, stats.range, [])
        
    def testSingleRange(self):
            # passing only one data point must return zero
        self.assertEqual(stats.range([5]), 0)        
        
    def testNoRange(self):
            # passing two equal data points must return zero
        self.assertEqual(stats.range([5.3,5.3]), 0.0)
        
    # covariance
    def testCovarianceInput(self):
                # passing too few parameters must raise exception
        self.assertRaises(TypeError, stats.covariance, [])

    def testCovarianceNull(self):
                # passing empty lists must raise exception
        self.assertRaises(stats.StatsError, stats.covariance, [], [])

    def testCovarianceOne(self):
                # passing only one point must raise exception
        self.assertRaises(stats.StatsError, stats.covariance, [1], [2])
        
    def testCovarianceDifferent(self):
                # passing different lenghts must raise exception
        self.assertRaises(stats.StatsError, stats.covariance, [1,2], [3])

    def testSingleCovariance(self):
            # passing only one data point must raise exception
        self.assertRaises(stats.StatsError, stats.covariance, [2], [3])        

    #correlation from sample
    def testCorrInput(self):
                # passing too few parameters must raise exception
        self.assertRaises(TypeError, stats.correlation, [])

    def testCorrNull(self):
                # passing empty lists must raise exception
        self.assertRaises(stats.StatsError, stats.correlation, [], [])

    def testCorrDifferent(self):
                # passing different lengths must raise exception
        self.assertRaises(stats.StatsError, stats.correlation, [1,2,3], [3,4,5,6])
        
    def testSingleCorr(self):
            # passing only one data point must raise exception
        self.assertRaises(stats.StatsError, stats.correlation, [2], [3])        

            #correlation from population
    def testCorrPInput(self):
                # passing too few parameters must raise exception
        self.assertRaises(TypeError, stats.correlationPop, [])

    def testCorrPNull(self):
                # passing empty lists must raise exception
        self.assertRaises(stats.StatsError, stats.correlationPop, [], [])

    def testCorrPDifferent(self):
                # passing different lengths must raise exception
        self.assertRaises(stats.StatsError, stats.correlationPop, [1,2,3], [3,4,5,6])
        
    def testSingleCorrP(self):
            # passing only one data point must return zero 
        self.assertEqual(stats.correlationPop([1], [2]), 0)        

if __name__ == "__main__":
    unittest.main()