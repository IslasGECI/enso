library(enso)

describe("Season and ENSO phase table", {
  oni_data <- readr::read_csv("/workdir/tests/data/roni_data.csv", show_col_types = FALSE)
  data_with_date <- tibble::tibble(
    Date = c("2023-08", "2025-01", "2024-04"),
    station = c("A", "B", "C")
  )

  it("keeps the supplied columns and appends the two labels", {
    result <- compute_meteorological_season_and_enso_phase(data_with_date, "Date", oni_data)
    expect_named(result, c("Date", "station", "Meteorological_Season", "ENSO_Phase"))
  })

  it("labels each row with its season and its phase", {
    result <- compute_meteorological_season_and_enso_phase(data_with_date, "Date", oni_data)
    expect_equal(result$Meteorological_Season, c("Summer", "Winter", "Spring"))
    expect_equal(result$ENSO_Phase, c("Niño", "Niña", "Neutral"))
  })

  it("reads the date column the caller names", {
    data_with_fecha <- dplyr::rename(data_with_date, Fecha = Date)
    result <- compute_meteorological_season_and_enso_phase(data_with_fecha, "Fecha", oni_data)
    expect_named(result, c("Fecha", "station", "Meteorological_Season", "ENSO_Phase"))
  })

  it("fails when the named date column is absent", {
    expect_error(
      compute_meteorological_season_and_enso_phase(data_with_date, "Fecha", oni_data),
      "doesn't exist"
    )
  })
})
