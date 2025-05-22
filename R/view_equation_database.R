#' @title view_equation_database()
#' @description Get the equation database as a tibble()
#' @details This function loads the equation database as a tibble() so that
#' users can examine and filter if if they want to find relevant equations.
#' @author James G. Hagan (james_hagan(at)outlook.com)
#' @return tibble with chosen traits or equations based on the input parameters
#' @export
#' @importFrom dplyr tibble
view_equation_database <- function() {
  # load the equation database
  if (!exists(paste0("equation", "_db"))) {
    assign(
      "equation_db",
      readRDS(file = get_db_file_path(paste0("equation", "_database.rds")))
    )
  }

  return(dplyr::tibble(equation_db))
}
