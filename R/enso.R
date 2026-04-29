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

lookup_season_column <- function(month) {
  season_columns[month]
}

lookup_oni_values <- function(oni_data, year, season) {
  season_index <- which(season_columns == season)
  start_index <- season_index - 4
  end_index <- season_index + 4
  selected_seasons <- season_columns[seq(start_index, end_index)]
  as.numeric(oni_data[oni_data$Year == year, selected_seasons])
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
