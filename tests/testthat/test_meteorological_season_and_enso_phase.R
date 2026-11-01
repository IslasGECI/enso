test_that("the table verb appends both labels and keeps the other columns", {
  oni_data <- readr::read_csv("/workdir/tests/data/roni_data.csv", show_col_types = FALSE)
  data_with_date <- tibble::tibble(
    Date = c("2023-08", "2025-01", "2024-04"),
    station = c("A", "B", "C")
  )
  result <- compute_meteorological_season_and_enso_phase(data_with_date, "Date", oni_data)

  expect_s3_class(result, "tbl_df")
  expect_named(result, c("Date", "station", "Meteorological_Season", "ENSO_Phase"))
  expect_equal(result$Meteorological_Season, c("Summer", "Winter", "Spring"))
  expect_equal(result$ENSO_Phase, c("Niño", "Niña", "Neutral"))
})

test_that("the table verb reads a date column with another name", {
  oni_data <- readr::read_csv("/workdir/tests/data/roni_data.csv", show_col_types = FALSE)
  data_with_date <- tibble::tibble(Fecha = "2023-08")
  result <- compute_meteorological_season_and_enso_phase(data_with_date, "Fecha", oni_data)

  expect_named(result, c("Fecha", "Meteorological_Season", "ENSO_Phase"))
})

test_that("the table verb fails when the date column is missing", {
  oni_data <- readr::read_csv("/workdir/tests/data/roni_data.csv", show_col_types = FALSE)
  data_with_date <- tibble::tibble(dates = "2023-08")

  expect_error(
    compute_meteorological_season_and_enso_phase(data_with_date, "Date", oni_data),
    "doesn't exist"
  )
})
