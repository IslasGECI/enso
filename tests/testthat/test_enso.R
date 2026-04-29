describe("Return season by given date", {
  it("Return winter for month 1", {
    expected <- "Winter"
    obtained <- compute_season("2026-01-01")
    expect_equal(expected, obtained)
  })
  it("Return spring for month 4", {
    expected <- "Spring"
    obtained <- compute_season("2026-04-01")
    expect_equal(expected, obtained)
  })
  it("Return summer for month 7", {
    expected <- "Summer"
    obtained <- compute_season("2026-07-01")
    expect_equal(expected, obtained)
  })
  it("Return fall for month 10", {
    expected <- "Fall"
    obtained <- compute_season("2026-10-01")
    expect_equal(expected, obtained)
  })
  it("Return winter for month 2", {
    expected <- "Winter"
    obtained <- compute_season("2026-02-01")
    expect_equal(expected, obtained)
  })
  it("Return winter for month 2", {
    expected <- "Summer"
    obtained <- compute_season("2026-09-01")
    expect_equal(expected, obtained)
  })
})

describe("Return if the date corresponds to an El Niño, La Niña or neutral event🥇", {
  noaa_data_df <- read_csv("/workdir/tests/data/roni_data.csv", show_col_types = FALSE)
  it("Return niño for month 8", {
    expected <- "Niño"
    obtained <- compute_enso("2023-08-01", noaa_data_df)
    expect_equal(expected, obtained)
  })
  it("Return niña for month 1", {
    expected <- "Niña"
    obtained <- compute_enso("2025-01-01", noaa_data_df)
    expect_equal(expected, obtained)
  })
  it("Return Neutral", {
    expected <- "Neutral"
    obtained <- compute_enso("2024-04-01", noaa_data_df)
    expect_equal(expected, obtained)
  })
})
describe("Get index time series from NOAA data", {
  noaa_data_df <- read_csv("/workdir/tests/data/roni_data.csv", show_col_types = FALSE)
  it("Return correct ONI value for 2023-08-01", {
    obtained <- lookup_oni_values(noaa_data_df, 2023, "JAS")
    expected <- c(-0.2, 0.1, 0.4, 0.6, 0.9, 1.1, 1.4, 1.5, 1.5)
    expect_equal(expected, obtained)
    expected_length <- length(expected)
    expect_equal(expected_length, length(obtained))
  })
  it("Return correct ONI values for edge cases", {
    obtained <- lookup_oni_values(noaa_data_df, 2024, "DJF")
    expected <- c(1.1, 1.4, 1.5, 1.5, 1.2, 0.9, 0.5, 0.1, -0.3)
    expect_equal(expected, obtained)
  })
})
