test_that("classify_by_season_and_enso_phase returns a data frame with columns Date, Season, ENSO_Phase", {
  noaa_data <- readr::read_csv("/workdir/tests/data/roni_data.csv", show_col_types = FALSE)
  data_with_date <- data.frame(Date = c("2023-08", "2025-01", "2024-04"))
  result <- classify_by_season_and_enso_phase(data_with_date, noaa_data)
  expect_s3_class(result, "data.frame")
  expect_named(result, c("Date", "Season", "ENSO_Phase"))
})
