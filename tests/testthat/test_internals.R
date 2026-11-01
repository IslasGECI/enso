test_that("wide2long returns a data frame with columns Year, months, values", {
  wide_oni <- readr::read_csv("/workdir/tests/data/roni_data.csv", show_col_types = FALSE)
  long_oni <- wide2long(wide_oni)
  expect_s3_class(long_oni, "data.frame")
  expect_named(long_oni, c("Year", "months", "values"))
})

test_that("compute_trimester maps month 1 to DJF", {
  expect_equal(compute_trimester(1), "DJF")
})

test_that("compute_oni_window returns nine consecutive values", {
  wide_oni <- readr::read_csv("/workdir/tests/data/roni_data.csv", show_col_types = FALSE)
  actual <- compute_oni_window(wide2long(wide_oni), 2023, "JAS")
  expect_type(actual, "double")
  expect_length(actual, 9)
})

test_that("is_consecutive_run detects a run of the required length", {
  values <- c(0.2, 0.6, 0.7, 0.8, 0.9, 1.0, 0.1)
  expect_true(is_consecutive_run(values, 0.5, ">=", 5))
})

test_that("is_consecutive_run rejects a run shorter than required", {
  values <- c(0.2, 0.6, 0.7, 0.8, 0.9, 0.1, 0.1)
  expect_false(is_consecutive_run(values, 0.5, ">=", 5))
})
