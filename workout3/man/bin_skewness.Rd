% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/binomial.R
\name{bin_skewness}
\alias{bin_skewness}
\title{binomial skewness}
\usage{
bin_skewness(trials, prob)
}
\arguments{
\item{trials}{the number of trials (numeric)}

\item{prob}{the probability of one success (numeric)}
}
\value{
the skewness of the binomial distribution (numeric)
}
\description{
finds the skewness of the binomial distribution
}
\examples{
bin_skewness(10, 0.3)
}
