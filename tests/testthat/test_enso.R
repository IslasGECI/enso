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
