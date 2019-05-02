#private function that checks that the probability is valid
check_prob = function(prob) {
  if (prob <= 1 && prob >= 0) {
    return(TRUE)
  }
  stop("prob should be a number between 0 and 1")
}

#private function that checks that the number of trials is valid
check_trials = function(trials) {
  if (trials %% 1 == 0 && trials >= 0) {
    return(TRUE)
  }
  stop("invalid trials value")
}

#private function that checks that the number of successes is valid
check_success = function(success, trials) {
  for (x in success) {
    if (x < 0 || x > trials) {
      stop("invalid success value")
    }
  }
  return(TRUE)
}
