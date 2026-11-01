EL_NINO_THRESHOLD <- 0.5
LA_NINA_THRESHOLD <- -0.5
CONSECUTIVE_MONTHS <- 5

#' Compute the ENSO phase of a date
#'
#' @param date A date string in YYYY-MM or YYYY-MM-DD format
#' @param oni_data Wide-format ONI data with a Year column and twelve trimester columns
#' @return One of Niño, Niña, or Neutral
#' @export
compute_enso_phase <- function(date, oni_data) {
  year <- compute_year(date)
  trimester <- compute_trimester(compute_month(date))
  values <- compute_oni_window(wide2long(oni_data), year, trimester)

  if (is_consecutive_run(values, EL_NINO_THRESHOLD, ">=", CONSECUTIVE_MONTHS)) {
    return("Niño")
  }
  if (is_consecutive_run(values, LA_NINA_THRESHOLD, "<=", CONSECUTIVE_MONTHS)) {
    return("Niña")
  }
  "Neutral"
}
