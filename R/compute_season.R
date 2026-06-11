MONTH_TO_SEASON <- c(
  rep("Winter", 3),
  rep("Spring", 3),
  rep("Summer", 3),
  rep("Fall", 3)
)

#' Compute season for a given date
#'
#' @param date A date string
#' @return The season name
compute_season <- function(date) {
  month <- extract_month(date)
  MONTH_TO_SEASON[month]
}
