#private function that finds the mean given the number of trials and probability
aux_mean = function(trials, prob) {
  return(trials * prob)
}

#private function that finds the variance given the number of trials and probability
aux_variance = function(trials, prob) {
  return(trials * prob * (1 - prob))
}

#private function that finds the mode given the number of trials and probability
aux_mode = function(trials, prob) {
  m = trials * prob + prob
  if (m %% 1 == 0) {
    return(c(m, m - 1))
  }
  return (floor(m))
}

#private function that finds the skewness given the number of trials and probability
aux_skewness = function(trials, prob) {
  s = (1 - (2 * prob)) / sqrt(aux_variance(trials, prob))
  return(s)
}

#private function that finds the kurtosis given the number of trials and probability
aux_kurtosis = function(trials, prob) {
  k = (1 - (6 * prob * (1 - prob))) / aux_variance(trials, prob)
  return(k)
}
