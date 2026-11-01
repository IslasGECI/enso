#' Compute the nine ONI values centered on a year and trimester
#'
#' @param oni_data Long-format ONI data with columns Year, months, and values
#' @param year The target year
#' @param trimester The target trimester abbreviation
#' @return A numeric vector of nine ONI values
compute_oni_window <- function(oni_data, year, trimester) {
  window_radius <- 4
  target_index <- which(oni_data$Year == year & oni_data$months == trimester)
  oni_data$values[(target_index - window_radius):(target_index + window_radius)]
}
