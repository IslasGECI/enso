test_that("compute_meteorological_season returns the season of a full date", {
  expect_equal(compute_meteorological_season("2026-01-01"), "Winter")
  expect_equal(compute_meteorological_season("2026-04-01"), "Spring")
  expect_equal(compute_meteorological_season("2026-07-01"), "Summer")
  expect_equal(compute_meteorological_season("2026-10-01"), "Fall")
})

test_that("compute_meteorological_season accepts a year-month date", {
  expect_equal(compute_meteorological_season("2026-01"), "Winter")
})

test_that("compute_meteorological_season returns NA for an unparseable date", {
  expect_true(is.na(suppressWarnings(compute_meteorological_season("garbage"))))
})
