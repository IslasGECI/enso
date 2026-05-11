describe("Define domain specific options", {
  obtained_options <- get_domain_specific_options()
  expected_options <- c("data-path", "roni-path", "output-path")
  expect_true(all(expected_options %in% names(obtained_options)))
})
