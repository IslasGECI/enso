#' Extract the month number from a date string in YYYY-MM or YYYY-MM-DD format
#'
#' @param date A date string where characters 6-7 represent the month
#' @return An integer month (1-12)
extract_month <- function(date) {
  as.integer(substr(date, 6, 7))
}

#' Extract the year number from a date string in YYYY-MM or YYYY-MM-DD format
#'
#' @param date A date string where characters 1-4 represent the year
#' @return An integer year
extract_year <- function(date) {
  as.integer(substr(date, 1, 4))
}
