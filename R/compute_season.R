SEASONS <- c(
  "Winter", "Winter", "Winter",
  "Spring", "Spring", "Spring",
  "Summer", "Summer", "Summer",
  "Fall", "Fall", "Fall"
)

#' Compute season for a given date
#'
#' @param date A date string
#' @return The season name
compute_season <- function(date) {
  month <- extract_month(date)
  SEASONS[month]
}
