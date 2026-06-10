test_that("compute_season returns Winter for January dates", {
  actual <- compute_season("2026-01-01")
  expected <- "Winter"
  expect_equal(actual, expected)
})
