#' Classify ENSO phase based on ONI values
#'
#' @param oni_values A numeric vector of ONI values
#' @return "Niño" if there are 5 or more consecutive values >= 0.5
classify_enso_phase <- function(oni_values) {
  count <- 0
  for (v in oni_values) {
    if (v >= 0.5) {
      count <- count + 1
      if (count >= 5) {
        return("Niño")
      }
    } else {
      count <- 0
    }
  }
}
