context("Check checker functions")

test_that("check_prob works properly", {
  expect_true(check_prob(0.1))
  expect_true(check_prob(1))
  expect_error(check_prob(-0.5))
})

test_that("check_trials works properly", {
  expect_true(check_trials(4))
  expect_error(check_trials(4.2))
  expect_error(check_trials(-4))
})

test_that("check_success works properly", {
  expect_true(check_success(2, 3))
  expect_true(check_success(0, 6))
  expect_error(check_success(5, 1))
})
