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
    obtained <- xxcompute_enso("2023-08", noaa_data_df)
    expect_equal(expected, obtained)
  })
  it("Return niña for month 1", {
    expected <- "Niña"
    obtained <- xxcompute_enso("2025-01", noaa_data_df)
    expect_equal(expected, obtained)
  })
  it("Return Neutral", {
    expected <- "Neutral"
    obtained <- xxcompute_enso("2024-04", noaa_data_df)
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
  transformed_df <- readr::read_csv("/workdir/tests/data/transformed_roni_data.csv", show_col_types = FALSE)
  it("Lookup nine oni values from a given year and season", {
    obtained <- lookup_nine_oni_values(transformed_df, 2023, "JAS")
    expected_length <- 9
    obtained_length <- length(obtained)
    expect_equal(expected_length, obtained_length)
  })
  it("Return 4 consecutive values after and before from a given year and season", {
    obtained <- lookup_nine_oni_values(transformed_df, 2024, "JJA")
    expected_values <- c(0.5, 0.1, -0.3, -0.5, -0.5, -0.6, -0.8, -0.8, -0.9)
    expect_equal(expected_values, obtained)
  })
})
describe("Classify enso phase given 9 oni values", {
  it("classify as niña", {
    niña_values <- c(0.5, 0.1, -0.3, -0.5, -0.5, -0.6, -0.8, -0.8, -0.9)
    obtained <- classify_enso_phase(niña_values)
    expected <- "Niña"
    expect_equal(obtained, expected)
  })
  neutral_values <- c(0.2, 0.1, 0.1, -0.2, 0.3, -0.6, -0.8, -0.8, -0.9)
  it("classify as neutral", {
    obtained <- classify_enso_phase(neutral_values)
    expected <- "Neutral"
    expect_equal(obtained, expected)
    no_niña_values <- c(0.5, 0.1, -0.5, -0.3, -0.5, -0.6, -0.8, -0.8, -0.3)
    obtained <- classify_enso_phase(no_niña_values)
    expect_equal(obtained, expected)
  })
  it("classify as niño", {
    niño_values <- c(0.4, 0.7, 1, 1, 1.1, 1.2, 1.3, 1.1, 0.7)
    obtained <- classify_enso_phase(niño_values)
    expected <- "Niño"
    expect_equal(obtained, expected)
  })
})
