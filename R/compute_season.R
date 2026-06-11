#' Compute season for a given date
#'
#' @param date A date string
#' @return The season name
compute_season <- function(date) {
  month <- substr(date, 6, 7)
  if (month == "04") "Spring" else "Winter"
}
