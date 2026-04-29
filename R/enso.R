compute_season <- function(date) {
  month <- substr(date, 6, 7)
  dplyr::case_when(
    month %in% c("01", "02", "03") ~ "Winter",
    month %in% c("04", "05", "06") ~ "Spring",
    month %in% c("07", "08", "09") ~ "Summer",
    month %in% c("10", "11", "12") ~ "Fall"
  )
}

season_columns <- c("DJF", "JFM", "FMA", "MAM", "AMJ", "MJJ", "JJA", "JAS", "ASO", "SON", "OND", "NDJ")
HALF_WINDOW <- 4

lookup_season_column <- function(month) {
  season_columns[month]
}

oni_season_window <- function(season) {
  season_index <- which(season_columns == season)
  raw_start <- season_index - HALF_WINDOW
  raw_end <- season_index + HALF_WINDOW
  list(
    season_index = season_index,
    start = max(raw_start, 1),
    end = min(raw_end, length(season_columns)),
    needs_prev = raw_start < 1,
    needs_next = raw_end > length(season_columns)
  )
}

fetch_window_values <- function(oni_data, year, window) {
  prev_values <- NULL
  if (window$needs_prev) {
    n_prev <- HALF_WINDOW - (window$season_index - 1)
    prev_seasons <- season_columns[(length(season_columns) - n_prev + 1):length(season_columns)]
    prev_values <- as.numeric(oni_data[oni_data$Year == year - 1, prev_seasons])
  }

  next_values <- NULL
  if (window$needs_next) {
    n_next <- (window$season_index + HALF_WINDOW) - length(season_columns)
    next_seasons <- season_columns[1:n_next]
    next_values <- as.numeric(oni_data[oni_data$Year == year + 1, next_seasons])
  }

  current_values <- as.numeric(oni_data[oni_data$Year == year, season_columns[window$start:window$end]])
  c(prev_values, current_values, next_values)
}

lookup_oni_values <- function(oni_data, year, season) {
  window <- oni_season_window(season)
  fetch_window_values(oni_data, year, window)
}

lookup_oni_value <- function(oni_data, year, season_column) {
  oni_data[oni_data$Year == year, ][[season_column]]
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

compute_enso <- function(date, oni_data) {
  date <- as.Date(date)
  year <- as.numeric(format(date, "%Y"))
  month <- as.numeric(format(date, "%m"))
  season_column <- lookup_season_column(month)
  oni_value <- lookup_oni_value(oni_data, year, season_column)
  classify_enso(oni_value)
}
