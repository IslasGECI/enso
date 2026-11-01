#' Check for a run of consecutive values beyond a threshold
#'
#' @param values A numeric vector
#' @param threshold The threshold value
#' @param comparison Either ">=" or "<="
#' @param min_consecutive The minimum number of consecutive values required
#' @return TRUE when a run of min_consecutive values satisfies the comparison
is_consecutive_run <- function(values, threshold, comparison, min_consecutive) {
  hits_threshold <- if (comparison == ">=") values >= threshold else values <= threshold
  runs <- rle(hits_threshold)
  any(runs$lengths[runs$values] >= min_consecutive)
}
