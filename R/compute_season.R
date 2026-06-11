#' Compute season for a given date
#'
#' @param date A date string
#' @return The season name
compute_season <- function(date) {
  month_str <- substr(date, 6, 7)
  if (month_str == "04") "Spring" else "Winter"
}
