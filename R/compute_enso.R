#' Compute ENSO phase for a given date
#'
#' @param date A date string in YYYY-MM format
#' @param noaa_data Wide-format ONI data with Year column and trimester columns
#' @return "Niño", "Niña", or "Neutral"
compute_enso <- function(date, noaa_data) {
  year <- as.integer(substr(date, 1, 4))
  month <- as.integer(substr(date, 6, 7))
  trimester <- lookup_season_column(month)
  oni_data <- transform_roni_data_to_longer(noaa_data)
  oni_values <- lookup_nine_oni_values(oni_data, year, trimester)
  classify_enso_phase(oni_values)
}
