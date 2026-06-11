#' Check if a vector has N or more consecutive values satisfying a condition
#'
#' @param values A numeric vector
#' @param threshold The threshold value
#' @param comparison Either ">=" or "<="
#' @param min_consecutive The minimum number of consecutive values required
#' @return TRUE if there are `min_consecutive` or more consecutive values meeting the condition
has_consecutive_threshold_values <- function(values, threshold, comparison, min_consecutive) {
  hits_threshold <- if (comparison == ">=") values >= threshold else values <= threshold
  runs <- rle(hits_threshold)
  any(runs$lengths[runs$values] >= min_consecutive)
}

#' Classify ENSO phase based on ONI values
#'
#' @param oni_values A numeric vector of ONI values
#' @return "Niño" if there are 5 or more consecutive values >= 0.5,
#'   "Niña" if there are 5 or more consecutive values <= -0.5
classify_enso_phase <- function(oni_values) {
  el_nino_threshold <- 0.5
  la_nina_threshold <- -0.5
  consecutive_months_required <- 5

  if (has_consecutive_threshold_values(oni_values, el_nino_threshold, ">=", consecutive_months_required)) {
    return("Niño")
  }
  if (has_consecutive_threshold_values(oni_values, la_nina_threshold, "<=", consecutive_months_required)) {
    return("Niña")
  }
  return("Neutral")
}
