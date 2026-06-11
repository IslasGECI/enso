#' Transform wide ONI data to longer format
#'
#' @param wide_data A data frame with columns Year and one column per month abbreviation (DJF, JFM, etc.)
#' @return A data frame with columns Year, months, values
#' @export
transform_roni_data_to_longer <- function(wide_data) {
  tidyr::pivot_longer(wide_data, cols = -Year, names_to = "months", values_to = "values")
}
