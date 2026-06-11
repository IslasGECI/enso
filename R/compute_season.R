#' Compute season for a given date
#'
#' @param date A date string
#' @return The season name
compute_season <- function(date) {
  month <- as.integer(substr(date, 6, 7))
  seasons <- c(
    "Winter", "Winter", "Winter",
    "Spring", "Spring", "Spring",
    "Summer", "Summer", "Summer",
    "Fall", "Fall", "Fall"
  )
  seasons[month]
}
