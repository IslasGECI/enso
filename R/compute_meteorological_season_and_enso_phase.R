#' Label a tibble by meteorological season and ENSO phase
#'
#' @param data_with_date A tibble with a column of dates in YYYY-MM or YYYY-MM-DD format
#' @param date_column_name The name of the date column
#' @param oni_data Wide-format ONI data with a Year column and twelve trimester columns
#' @return The input tibble with the Meteorological_Season and ENSO_Phase columns appended
#' @export
compute_meteorological_season_and_enso_phase <- function(data_with_date, date_column_name, oni_data) {
  dates <- dplyr::pull(data_with_date, date_column_name)

  dplyr::mutate(
    data_with_date,
    Meteorological_Season = vapply(
      dates, compute_meteorological_season, character(1),
      USE.NAMES = FALSE
    ),
    ENSO_Phase = vapply(
      dates, compute_enso_phase, character(1), oni_data,
      USE.NAMES = FALSE
    )
  )
}
