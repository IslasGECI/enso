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
  noaa_data_df <- readr::read_csv("/workdir/tests/data/roni_data.csv", show_col_types = FALSE)
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
describe("transform_roni_data_to_longer", {
  it("Return a data frame with the correct structure", {
    noaa_data_df <- readr::read_csv("/workdir/tests/data/roni_data.csv", show_col_types = FALSE)
    transformed_df <- transform_roni_data_to_longer(noaa_data_df)
    exptected_columns <- c("Year", "months", "values")
    expect_equal(exptected_columns, colnames(transformed_df))
  })
})
describe("Get neccessary oni values to calculate oni phase", {
  noaa_data_df <- readr::read_csv("/workdir/tests/data/roni_data.csv", show_col_types = FALSE)
  it("Lookup oni values from a given year and season", {
    obtained <- lookup_oni_value(noaa_data_df, 2023, "JAS")
    expected_length <- 1
    obtained_length <- length(obtained)
    expect_equal(expected_length, obtained_length)
  })
})
