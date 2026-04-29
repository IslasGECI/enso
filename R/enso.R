compute_season <- function(date) {
  month <- substr(date, 6, 7)
  dplyr::case_when(
    month %in% c("01", "02", "03") ~ "Winter",
    month %in% c("04", "05", "06") ~ "Spring",
    month %in% c("07", "08", "09") ~ "Summer",
    month %in% c("10", "11", "12") ~ "Fall"
  )
}

compute_enso <- function(date, oni_data) {
  date <- as.Date(date)
  year <- as.numeric(format(date, "%Y"))
  month <- as.numeric(format(date, "%m"))
  trimestral_cols <- c("DJF", "JFM", "FMA", "MAM", "AMJ", "MJJ", "JJA", "JAS", "ASO", "SON", "OND", "NDJ")
  central_month <- trimestral_cols[month]
  row <- oni_data[oni_data$Year == year, ]
  value <- as.numeric(row[[central_month]])
  if (value > 0.5) "Niño" else "Neutral"
}
