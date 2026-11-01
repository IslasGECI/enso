#' Compute the month number from a date string
#'
#' @param date A date string in YYYY-MM or YYYY-MM-DD format
#' @return A numeric month (1-12); NA when the date cannot be parsed
compute_month <- function(date) {
  lubridate::month(lubridate::parse_date_time(date, orders = c("ymd", "ym")))
}

#' Compute the year from a date string
#'
#' @param date A date string in YYYY-MM or YYYY-MM-DD format
#' @return A numeric year; NA when the date cannot be parsed
compute_year <- function(date) {
  lubridate::year(lubridate::parse_date_time(date, orders = c("ymd", "ym")))
}
