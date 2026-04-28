compute_season <- function(date) {
  mes <- substr(date, 6, 7)
  dplyr::case_when(
    mes %in% c("01", "02", "03") ~ "Winter",
    mes %in% c("04", "05", "06") ~ "Spring",
    mes %in% c("07", "08", "09") ~ "Summer",
    mes %in% c("10", "11", "12") ~ "Fall"
  )
}
