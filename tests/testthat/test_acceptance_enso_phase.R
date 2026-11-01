library(enso)

oni_data_with_window <- function(values) {
  trimester_columns <- c(
    "DJF", "JFM", "FMA", "MAM", "AMJ", "MJJ",
    "JJA", "JAS", "ASO", "SON", "OND", "NDJ"
  )
  columns <- as.list(c(values, rep(0, 3)))
  names(columns) <- trimester_columns
  tibble::as_tibble(c(list(Year = 2020), columns))
}

describe("ENSO phase of a date", {
  it("labels August 2023 as Niño", {
    oni_data <- readr::read_csv("/workdir/tests/data/roni_data.csv", show_col_types = FALSE)
    expect_equal(compute_enso_phase("2023-08", oni_data), "Niño")
  })

  it("labels January 2025 as Niña", {
    oni_data <- readr::read_csv("/workdir/tests/data/roni_data.csv", show_col_types = FALSE)
    expect_equal(compute_enso_phase("2025-01", oni_data), "Niña")
  })

  it("labels April 2024 as Neutral", {
    oni_data <- readr::read_csv("/workdir/tests/data/roni_data.csv", show_col_types = FALSE)
    expect_equal(compute_enso_phase("2024-04", oni_data), "Neutral")
  })
})

describe("Five consecutive months rule", {
  it("declares Niña when five consecutive months reach -0.5", {
    oni_data <- oni_data_with_window(c(0.5, 0.1, -0.3, -0.5, -0.5, -0.6, -0.8, -0.8, -0.9))
    expect_equal(compute_enso_phase("2020-05", oni_data), "Niña")
  })

  it("declares Niño when five consecutive months reach 0.5", {
    oni_data <- oni_data_with_window(c(0.4, 0.7, 1, 1, 1.1, 1.2, 1.3, 1.1, 0.7))
    expect_equal(compute_enso_phase("2020-05", oni_data), "Niño")
  })

  it("stays Neutral when the cold excursion lasts four months", {
    oni_data <- oni_data_with_window(c(0.2, 0.1, 0.1, -0.2, 0.3, -0.6, -0.8, -0.8, -0.9))
    expect_equal(compute_enso_phase("2020-05", oni_data), "Neutral")
  })

  it("stays Neutral when the cold values are not consecutive", {
    oni_data <- oni_data_with_window(c(0.5, 0.1, -0.5, -0.3, -0.5, -0.6, -0.8, -0.8, -0.3))
    expect_equal(compute_enso_phase("2020-05", oni_data), "Neutral")
  })
})
