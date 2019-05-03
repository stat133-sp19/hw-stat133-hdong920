Readme File for binomial

Completed on 1 May 2019

Description
===========
`"binomial"` is an R package that lets the user calculate and display the properites of the binomial distribution and variable. Functions include:
+ `bin_choose()` finds the number of ways to choose k items from n 
+ `bin_probability()` finds the probability of a particular number of successes 
+ `bin_distribution()` creates a `"bindis"` and `"data.frame"` object that can be visualized with `plot()`
+ `bin_cumulative()`creates a `"bincum"` and  `"data.frame"` object that can be visualized with `plot()`
+ `bin_variable()` creates a `"binvar"` object that can be summarized with `summary()`
+ `bin_mean()` finds the mean
+ `bin_variance()` finds the variance
+ `bin_mode()` finds the mode
+ `bin_skewness()` finds the skewness
+ `bin_kurtosis()` finds the kurtosis


File Structure
==============
The package is divided into 4 main folders: R, tests, man, and vignettes. These folders contain the R code for the functions in the package, the tests for these functions, the description of each function, and a demo of that explains and gives examples of the uses of the package, respectively. There is also a DESCRIPTION, NAMESPACE, and devtools-flow file.


Motivation
==========
This package was developed to learn the basics of creating a package. The binomial distribution is a simple concept to implement in code, so it is great for learning as a proof of concept.


Author Information
==================
+ Author: Harry Dong
+ Email: hdong920@gmail.com
+ School: UC Berkeley
+ Class: Stat 133 (Section 109)
+ Instructor: Gaston Sanchez
