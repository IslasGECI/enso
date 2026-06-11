test_that("transform_roni_data_to_longer returns a data frame with columns Year, months, values", {
  wide_oni <- readr::read_csv("/workdir/tests/data/roni_data.csv", show_col_types = FALSE)
  long_oni <- transform_roni_data_to_longer(wide_oni)
  expect_s3_class(long_oni, "data.frame")
  expect_named(long_oni, c("Year", "months", "values"))
})

test_that("lookup_season_column maps month 1 to DJF", {
  actual <- lookup_season_column(1)
  expect_equal(actual, "DJF")
})

test_that("lookup_nine_oni_values returns a numeric vector of length 9", {
  wide_oni <- readr::read_csv("/workdir/tests/data/roni_data.csv", show_col_types = FALSE)
  long_oni <- transform_roni_data_to_longer(wide_oni)
  actual <- lookup_nine_oni_values(long_oni, 2023, "JAS")
  expect_type(actual, "double")
  expect_length(actual, 9)
})

test_that("classify_enso_phase returns Niño when 5+ consecutive values are >= 0.5", {
  actual <- classify_enso_phase(c(0.4, 0.7, 1, 1, 1.1, 1.2, 1.3, 1.1, 0.7))
  expect_equal(actual, "Niño")
})

test_that("classify_enso_phase returns Niña when 5+ consecutive values are <= -0.5", {
  actual <- classify_enso_phase(c(0.5, 0.1, -0.3, -0.5, -0.5, -0.6, -0.8, -0.8, -0.9))
  expect_equal(actual, "Niña")
})

test_that("compute_enso returns Niño for August 2023", {
  noaa_data <- readr::read_csv("/workdir/tests/data/roni_data.csv", show_col_types = FALSE)
  actual <- compute_enso("2023-08", noaa_data)
  expect_equal(actual, "Niño")
})
