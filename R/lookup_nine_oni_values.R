#' Look up nine consecutive ONI values centered on a given year and trimester
#'
#' @param oni_data A data frame with columns Year, months, values (long format)
#' @param year The target year
#' @param trimester The target trimester abbreviation
#' @return A numeric vector of nine ONI values
lookup_nine_oni_values <- function(oni_data, year, trimester) {
  window_radius <- 4
  target_index <- which(oni_data$Year == year & oni_data$months == trimester)
  oni_data$values[(target_index - window_radius):(target_index + window_radius)]
}
