#' Compute the ONI trimester abbreviation of a month
#'
#' @param month A numeric month (1-12)
#' @return The trimester abbreviation, from DJF through NDJ
compute_trimester <- function(month) {
  trimester_columns <- c(
    "DJF", "JFM", "FMA", "MAM", "AMJ", "MJJ",
    "JJA", "JAS", "ASO", "SON", "OND", "NDJ"
  )
  trimester_columns[month]
}
