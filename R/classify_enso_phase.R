#' Classify ENSO phase based on ONI values
#'
#' @param oni_values A numeric vector of ONI values
#' @return "Niño" if there are 5 or more consecutive values >= 0.5,
#'   "Niña" if there are 5 or more consecutive values <= -0.5
classify_enso_phase <- function(oni_values) {
  el_nino_threshold <- 0.5
  la_nina_threshold <- -0.5
  consecutive_months_required <- 5
  el_nino_count <- 0
  la_nina_count <- 0
  for (v in oni_values) {
    if (v >= el_nino_threshold) {
      el_nino_count <- el_nino_count + 1
      la_nina_count <- 0
      if (el_nino_count >= consecutive_months_required) {
        return("Niño")
      }
    } else if (v <= la_nina_threshold) {
      la_nina_count <- la_nina_count + 1
      el_nino_count <- 0
      if (la_nina_count >= consecutive_months_required) {
        return("Niña")
      }
    } else {
      el_nino_count <- 0
      la_nina_count <- 0
    }
  }
}
