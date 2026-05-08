classify_by_season_and_enso_phase <- function(data_with_date) {
  data_with_date |>
    dplyr::mutate(
      Season = 1,
      ENSO_Phase = "A"
    )
}
