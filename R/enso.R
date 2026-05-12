compute_enso <- function(date, oni_data) {
  date <- as.Date(date)
  year <- as.numeric(format(date, "%Y"))
  month <- as.numeric(format(date, "%m"))
  trimester <- lookup_season_column(month)
  transformed_oni_data <- transform_roni_data_to_longer(oni_data)
  oni_value <- lookup_nine_oni_values(transformed_oni_data, year, trimester)
  classify_enso_phase(oni_value)
}

xxcompute_enso <- function(date, oni_data) {
  date <- lubridate::ym(date)
  year <- lubridate::year(date)
  month <- lubridate::month(date)
  trimester <- lookup_season_column(month)
  transformed_oni_data <- transform_roni_data_to_longer(oni_data)
  oni_value <- lookup_nine_oni_values(transformed_oni_data, year, trimester)
  classify_enso_phase(oni_value)
}

lookup_season_column <- function(month) {
  trimester <- c("DJF", "JFM", "FMA", "MAM", "AMJ", "MJJ", "JJA", "JAS", "ASO", "SON", "OND", "NDJ")
  trimester[month]
}

transform_roni_data_to_longer <- function(roni_data) {
  roni_data |>
    tidyr::pivot_longer(
      cols = -Year,
      names_to = "months",
      values_to = "values"
    )
}

lookup_nine_oni_values <- function(oni_data, year, trimester) {
  row_index <- which(oni_data$Year == year & oni_data$months == trimester)
  oni_data[(row_index - 4):(row_index + 4), ]$values
}

classify_enso_phase <- function(oni_values) {
  phase_conditions <- list("Niña" = rle(oni_values <= -0.5), "Niño" = rle(oni_values >= 0.5))
  for (phase in names(phase_conditions)) {
    if (has_consecutive_threshold_values(phase_conditions[[phase]])) {
      return(phase)
    }
  }
  "Neutral"
}

has_consecutive_threshold_values <- function(runs) {
  consecutive_threshold <- 5
  any(runs$lengths[runs$values] >= consecutive_threshold)
}
