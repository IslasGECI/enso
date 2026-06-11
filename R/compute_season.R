#' Extract the month number from a date string in YYYY-MM or YYYY-MM-DD format
#'
#' @param date A date string where characters 6-7 represent the month
#' @return An integer month (1-12)
extract_month <- function(date) {
  as.integer(substr(date, 6, 7))
}

#' Compute season for a given date
#'
#' @param date A date string
#' @return The season name
compute_season <- function(date) {
  month <- extract_month(date)
  seasons <- c(
    "Winter", "Winter", "Winter",
    "Spring", "Spring", "Spring",
    "Summer", "Summer", "Summer",
    "Fall", "Fall", "Fall"
  )
  seasons[month]
}
