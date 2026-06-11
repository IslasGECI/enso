#' Compute season for a given date
#'
#' @param date A date string
#' @return The season name
compute_season <- function(date) {
  month <- substr(date, 6, 7)
  season <- c(
    "01" = "Winter", "02" = "Winter", "03" = "Winter",
    "04" = "Spring", "05" = "Winter", "06" = "Winter",
    "07" = "Summer", "08" = "Winter", "09" = "Summer",
    "10" = "Fall",   "11" = "Winter", "12" = "Winter"
  )
  result <- season[month]
  if (is.na(result)) "Winter" else unname(result)
}
