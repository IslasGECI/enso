compute_season <- function(date) {
  month <- substr(date, 6, 7)
  dplyr::case_when(
    month %in% c("01", "02", "03") ~ "Winter",
    month %in% c("04", "05", "06") ~ "Spring",
    month %in% c("07", "08", "09") ~ "Summer",
    month %in% c("10", "11", "12") ~ "Fall"
  )
}
