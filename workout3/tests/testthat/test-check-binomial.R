context("Check binomial functions")

test_that("bin_choose works properly", {
  expect_equal(bin_choose(5, 2), 10)
  expect_error(bin_choose(3, 4))
  expect_equal(bin_choose(10, 10), 1)
})

test_that("bin_probability works properly", {
  expect_equal(bin_probability(2, 5, 0.5), 0.3125)
  expect_error(bin_probability(5, 3, 2))
  expect_equal(bin_probability(10, 10, 1), 1)
})

test_that("bin_distribution works properly", {
  dis1 <- bin_distribution(trials = 5, prob = 0.5)
  expect_equal(class(dis1), c('bindis', 'data.frame'))
  expect_equal(dis1$probability, bin_probability(0:5, 5, 0.5))
  expect_error(bin_distribution(5, 2))
})

test_that("bin_cumulative works properly", {
  dis2 <- bin_cumulative(trials = 5, prob = 0.5)
  expect_equal(class(dis2), c('bincum', 'data.frame'))
  expect_equal(dis2$cumulative[length(dis2$cumulative)], 1)
  expect_error(bin_cumulative(5, -1))
})
