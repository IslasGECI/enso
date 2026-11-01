#' Reshape wide ONI data to long format
#'
#' @param wide_data A data frame with a Year column and one column per trimester
#' @return A data frame with columns Year, months, and values
wide2long <- function(wide_data) {
  tidyr::pivot_longer(wide_data, cols = -Year, names_to = "months", values_to = "values")
}
