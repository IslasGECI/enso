test_that("compute_enso_phase returns Niño for August 2023", {
  oni_data <- readr::read_csv("/workdir/tests/data/roni_data.csv", show_col_types = FALSE)
  expect_equal(compute_enso_phase("2023-08", oni_data), "Niño")
})

test_that("compute_enso_phase returns Niña for January 2025", {
  oni_data <- readr::read_csv("/workdir/tests/data/roni_data.csv", show_col_types = FALSE)
  expect_equal(compute_enso_phase("2025-01", oni_data), "Niña")
})

test_that("compute_enso_phase returns Neutral for April 2024", {
  oni_data <- readr::read_csv("/workdir/tests/data/roni_data.csv", show_col_types = FALSE)
  expect_equal(compute_enso_phase("2024-04", oni_data), "Neutral")
})
