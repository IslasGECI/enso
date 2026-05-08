describe("Classify by season and enso phase", {
  data_with_date <- tibble::tibble(
    Date = c("2023-08-20", "2025-01-11", "2024-04-18")
  )
  it("Return the season and enso phase for each date", {
    obtained <- classify_by_season_and_enso_phase(data_with_date)
    expected <- c("Date", "Season", "ENSO_Phase")
    expect_equal(colnames(obtained), expected)
    obtained_seasons <- obtained$Season
    expected_seasons <- c("Summer", "Winter", "Spring")
    expect_equal(obtained_seasons, expected_seasons)
  })
})
