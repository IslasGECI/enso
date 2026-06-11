#' Classify dates by season and ENSO phase
#'
#' @param data_with_date A data frame with a Date column (format "YYYY-MM")
#' @param noaa_data Wide-format ONI data
#' @return A data frame with columns Date, Season, ENSO_Phase
classify_by_season_and_enso_phase <- function(data_with_date, noaa_data) {
  dates <- data_with_date$Date
  seasons <- sapply(dates, compute_season)
  phases <- sapply(dates, compute_enso, noaa_data)
  data.frame(
    Date = dates,
    Season = seasons,
    ENSO_Phase = phases,
    stringsAsFactors = FALSE
  )
}
