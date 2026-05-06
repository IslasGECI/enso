compute_season <- function(date) {
  month <- substr(date, 6, 7)
  dplyr::case_when(
    month %in% c("01", "02", "03") ~ "Winter",
    month %in% c("04", "05", "06") ~ "Spring",
    month %in% c("07", "08", "09") ~ "Summer",
    month %in% c("10", "11", "12") ~ "Fall"
  )
}

trimester <- c("DJF", "JFM", "FMA", "MAM", "AMJ", "MJJ", "JJA", "JAS", "ASO", "SON", "OND", "NDJ")

lookup_season_column <- function(month) {
  trimester[month]
}


lookup_oni_value <- function(oni_data, year, trimester) {
  oni_data[oni_data$Year == year, ][[trimester]]
}

lookup_nine_oni_values <- function(oni_data, year, trimester) {
  row_index <- which(oni_data$Year == year & oni_data$months == trimester)
  oni_data[(row_index - 4):(row_index + 4), ]$values
}

classify_enso <- function(oni_value) {
  if (oni_value > 0.5) {
    "Niño"
  } else if (oni_value < -0.5) {
    "Niña"
  } else {
    "Neutral"
  }
}

classify_enso_phase <- function(oni_values) {
  runs_niña <- rle(oni_values <= -0.5)
  if (has_consecutive_threshold_values(runs_niña)) {
    return("Niña")
  }
  runs_niño <- rle(oni_values >= 0.5)
  if (has_consecutive_threshold_values(runs_niño)) {
    return("Niño")
  }
  "Neutral"
}
has_consecutive_threshold_values <- function(runs) {
  consecutive_threshold <- 5
  any(runs$lengths[runs$values] >= consecutive_threshold)
}

transform_roni_data_to_longer <- function(roni_data) {
  roni_data |>
    tidyr::pivot_longer(
      cols = -Year,
      names_to = "months",
      values_to = "values"
    )
}

compute_enso <- function(date, oni_data) {
  date <- as.Date(date)
  year <- as.numeric(format(date, "%Y"))
  month <- as.numeric(format(date, "%m"))
  trimester <- lookup_season_column(month)
  oni_value <- lookup_oni_value(oni_data, year, trimester)
  classify_enso(oni_value)
}
