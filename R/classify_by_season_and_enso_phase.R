classify_by_season_and_enso_phase <- function(data_with_date) {
  data_with_date |>
    dplyr::mutate(
      Season = "Fall",
      ENSO_Phase = "A"
    )
}
