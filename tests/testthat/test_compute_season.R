test_that("compute_season returns Winter for January dates", {
  actual <- compute_season("2026-01-01")
  expect_equal(actual, "Winter")
})
