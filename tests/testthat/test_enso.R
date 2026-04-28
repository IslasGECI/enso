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
  it("Return El Niño for month 1", {
    expected <- "El Niño"
    obtained <- compute_enso("2025-01-01")
    expect_equal(expected, obtained)
  })
})
