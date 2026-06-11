#' Classify ENSO phase based on ONI values
#'
#' @param oni_values A numeric vector of ONI values
#' @return "Niño" if there are 5 or more consecutive values >= 0.5
classify_enso_phase <- function(oni_values) {
  el_nino_threshold <- 0.5
  consecutive_months_required <- 5
  count <- 0
  for (v in oni_values) {
    if (v >= el_nino_threshold) {
      count <- count + 1
      if (count >= consecutive_months_required) {
        return("Niño")
      }
    } else {
      count <- 0
    }
  }
}
