context("Check summmary measures functions")

test_that("aux_mean works properly", {
  expect_equal(aux_mean(10, 0.5), 5)
  expect_equal(aux_mean(10, 0), 0)
  expect_equal(aux_mean(5, 0.2), aux_mean(10, 0.1))
})

test_that("aux_variance works properly", {
  expect_equal(aux_variance(10, 0.5), 2.5)
  expect_equal(aux_variance(10, 0), 0)
  expect_equal(aux_variance(5, 0.2), aux_variance(5, 0.8))
})

test_that("aux_mode works properly", {
  expect_equal(aux_mode(10, 0.5), 5)
  expect_equal(aux_mode(3, 0.5), c(2, 1))
  expect_equal(aux_mode(5, 0.2), aux_mode(10, 0.1))
})

test_that("aux_mean works properly", {
  expect_equal(aux_mean(10, 0.5), 5)
  expect_equal(aux_mean(10, 0), 0)
  expect_equal(aux_mean(5, 0.2), aux_mean(10, 0.1))
})

test_that("aux_skewness works properly", {
  expect_equal(floor(1000 * aux_skewness(10, 0.3)), 276)
  expect_equal(aux_skewness(15, 0.5), 0)
  expect_equal(aux_skewness(48, 0.25), 0.5/3)
})

test_that("aux_kurtosis works properly", {
  expect_equal(floor(1000 * aux_kurtosis(10, 0.3)), -124)
  expect_equal(aux_kurtosis(20, 0.5), -0.1)
  expect_equal(aux_kurtosis(100, 0.1), 0.46/9)
})
