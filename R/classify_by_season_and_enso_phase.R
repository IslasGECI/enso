#' @export
classify_by_season_and_enso_phase <- function(data_with_date, nooa_data) {
  enso_classification <- comprehenr::to_list(for (day in data_with_date$Date) xxcompute_enso(day, nooa_data))
  data_with_date |>
    dplyr::mutate(
      Season = compute_season(Date),
      ENSO_Phase = enso_classification
    )
}
