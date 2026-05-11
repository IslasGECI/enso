#' @export
get_domain_specific_options <- function() {
  data_path <- c("data-path" = "")
  roni_path <- c("roni-path" = "")
  output_path <- c("output-path" = "")
  c(data_path, roni_path, output_path)
}
