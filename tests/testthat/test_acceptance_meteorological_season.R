library(enso)

describe("Meteorological season", {
  it("labels January and February as Winter", {
    expect_equal(compute_meteorological_season("2026-01-01"), "Winter")
    expect_equal(compute_meteorological_season("2026-02-01"), "Winter")
  })

  it("labels April as Spring", {
    expect_equal(compute_meteorological_season("2026-04-01"), "Spring")
  })

  it("labels July and September as Summer", {
    expect_equal(compute_meteorological_season("2026-07-01"), "Summer")
    expect_equal(compute_meteorological_season("2026-09-01"), "Summer")
  })

  it("labels October as Fall", {
    expect_equal(compute_meteorological_season("2026-10-01"), "Fall")
  })
})
