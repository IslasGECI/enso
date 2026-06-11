#' Look up the season column name for a given month
#'
#' @param month An integer month (1-12)
#' @return The season column name (e.g., "DJF")
lookup_season_column <- function(month) {
  season_columns <- c("DJF", "JFM", "FMA", "MAM", "AMJ", "MJJ", "JJA", "JAS", "ASO", "SON", "OND", "NDJ")
  season_columns[month]
}
