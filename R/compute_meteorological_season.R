MONTH_TO_SEASON <- c(
  rep("Winter", 3),
  rep("Spring", 3),
  rep("Summer", 3),
  rep("Fall", 3)
)

#' Compute the meteorological season of a date
#'
#' @param date A date string in YYYY-MM or YYYY-MM-DD format
#' @return One of Winter, Spring, Summer, or Fall; NA when the date cannot be parsed
#' @export
compute_meteorological_season <- function(date) {
  MONTH_TO_SEASON[compute_month(date)]
}
