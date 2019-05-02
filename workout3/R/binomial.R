#' @title binomial choose
#' @description finds the number of ways to choose k items from n
#' @param n the number of items to choose from (numeric)
#' @param k the number of items to choose (numeric)
#' @return the number of combinations of k items (numeric)
#' @examples
#' bin_choose(n = 5, k = 2)
#' bin_choose(5, 0)
#' bin_choose(5, 1:3)
#' @export
bin_choose = function(n, k) {
  if ((length(k) > 1 && length(k[k > n]) > 0) ||k > n) {
    stop("k cannot be greater than n")
  }
  return(factorial(n)/(factorial(k) * factorial(n - k)))
}


#' @title binomial probability
#' @description finds the probability of the given number of successes with the given parameters
#' @param success the number of successes (numeric)
#' @param trials the number of trials (numeric)
#' @param prob the probability of a success (numeric)
#' @return the probability of success successes (numeric)
#' @examples
#' bin_probability(success = 2, trials = 5, prob = 0.5)
#' bin_probability(success = 0:2, trials = 5, prob = 0.5)
#' bin_probability(success = 55, trials = 100, prob = 0.45)
#' @export
bin_probability = function(success, trials, prob) {
  check_trials(trials)
  check_prob(prob)
  check_success(success, trials)
  ways = bin_choose(trials, success)
  return(ways * (prob ^ success) * (1 - prob) ^ (trials - success))
}


#' @title binomial distribution
#' @description creates a bindis and data.frame object
#' @param trials the number of trials (numeric)
#' @param prob the probability of one success (numeric)
#' @return an object containing the probability distribution of the given parameters (data.frame, bindis)
#' @examples
#' dis1 <- bin_distribution(trials = 5, prob = 0.5)
#' plot(dis1)
#' @export
bin_distribution = function(trials, prob) {
  success = 0:trials
  dist = data.frame(success, probability = bin_probability(success, trials, prob))
  class(dist) = c("bindis", "data.frame")
  return(dist)
}


#' @export
plot.bindis = function(x, ...) {
  b = barplot(x$probability, xlab ='success', ylab = 'probability', names.arg = x$success, las = 1)
  return(b)
}


#' @title binomial cumulative
#' @description creates a bincum and data.frame object
#' @param trials the number of trials (numeric)
#' @param prob the probability of one success (numeric)
#' @return an object containing the cumulative distribution with the given parameters (bincum, data.frame)
#' @examples
#' dis2 <- bin_cumulative(trials = 5, prob = 0.5)
#' plot(dis2)
#' @export
bin_cumulative = function(trials, prob) {
  dist = bin_distribution(trials, prob)
  v = dist$probability
  for (x in 2:length(dist$probability)) {
    v[x] = v[x - 1] + v[x]
  }
  dist = data.frame(success = dist$success, probability = dist$probability, cumulative = v)
  class(dist) = c("bincum", "data.frame")
  return(dist)
}


#' @export
plot.bincum = function(x, ...) {
  plot(x$success, x$cumulative,  type = 'o', xlab = "success", ylab = 'probability', las = 1)
}


#' @title binomial variable
#' @description creates a binvar object with the given parameters
#' @param trials the number of trials (numeric)
#' @param prob the probability of one success (numeric)
#' @return a binomial random variable object (binvar)
#' @examples
#' bin1 <- bin_variable(5, 0.5)
#' binsum1 <- summary(bin1)
#' binsum1
#' @export
bin_variable = function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  variable = list(trials, prob)
  names(variable) = c("trials", 'prob')
  class(variable) = "binvar"
  return(variable)
}


#' @export
print.binvar = function(x, ...) {
  print("Binomial variable")
  print("", quote = FALSE)
  print("Parameters", quote = FALSE)
  print(paste0("- number of trials: ", x['trials']), quote = FALSE)
  print(paste0("- prob of success : ", x['prob']), quote = FALSE)
}


#' @export
summary.binvar = function(x, ...) {
  trials = x[['trials']]
  prob = x[['prob']]
  lst  = list(
    trials = trials,
    prob =prob,
    mean = aux_mean(trials, prob),
    variance = aux_variance(trials, prob),
    mode = aux_mode(trials, prob),
    skewness = aux_skewness(trials, prob),
    kurtosis = aux_kurtosis(trials, prob)
  )
  class(lst) = "summary.binvar"
  return(lst)
}


#' @export
print.summary.binvar = function(x, ...) {
  print("Summary Binomial")
  print("", quote = FALSE)
  print("Parameters", quote = FALSE)
  print(paste0("- number of trials: ", x[['trials']]), quote = FALSE)
  print(paste0("- prob of success : ", x[['prob']]), quote = FALSE)
  print("", quote = FALSE)
  print("Measures", quote = FALSE)
  print(paste0("- mean            : ", x[['mean']]), quote = FALSE)
  print(paste0("- variance        : ", x[['variance']]), quote = FALSE)
  print(paste0("- mode            : ", x[['mode']]), quote = FALSE)
  print(paste0("- skewness        : ", x[['skewness']]), quote = FALSE)
  print(paste0("- kurtosis        : ", x[['kurtosis']]), quote = FALSE)
}


#' @title binomial mean
#' @description finds the mean of the binomial distribution
#' @param trials the number of trials (numeric)
#' @param prob the probability of one success (numeric)
#' @return the mean of the binomial distribution (numeric)
#' @examples
#' bin_mean(10, 0.3)
#' @export
bin_mean = function(trials, prob) {
  check_prob(prob)
  check_trials(trials)
  return(aux_mean(trials, prob))
}


#' @title binomial variance
#' @description finds the variance of the binomial distribution
#' @param trials the number of trials (numeric)
#' @param prob the probability of one success (numeric)
#' @return the variance of the binomial distribution (numeric)
#' @examples
#' bin_variance(10, 0.3)
#' @export
bin_variance = function(trials, prob) {
  check_prob(prob)
  check_trials(trials)
  return(aux_variance(trials, prob))
}


#' @title binomial mode
#' @description finds the mode of the binomial distribution
#' @param trials the number of trials (numeric)
#' @param prob the probability of one success (numeric)
#' @return the mode of the binomial distribution (numeric)
#' @examples
#' bin_mode(10, 0.3)
#' @export
bin_mode = function(trials, prob) {
  check_prob(prob)
  check_trials(trials)
  return(aux_mode(trials, prob))
}


#' @title binomial skewness
#' @description finds the skewness of the binomial distribution
#' @param trials the number of trials (numeric)
#' @param prob the probability of one success (numeric)
#' @return the skewness of the binomial distribution (numeric)
#' @examples
#' bin_skewness(10, 0.3)
#' @export
bin_skewness = function(trials, prob) {
  check_prob(prob)
  check_trials(trials)
  return(aux_skewness(trials, prob))
}


#' @title binomial kurtosis
#' @description finds the kurtosis of the binomial distribution
#' @param trials the number of trials (numeric)
#' @param prob the probability of one success (numeric)
#' @return the kurtosis of the binomial distribution (numeric)
#' @examples
#' bin_kurtosis(10, 0.3)
#' @export
bin_kurtosis = function(trials, prob) {
  check_prob(prob)
  check_trials(trials)
  return(aux_kurtosis(trials, prob))
}
