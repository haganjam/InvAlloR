#' Calculate dry biomass using allometric equations
#'
#' This function takes a data frame with body size and equation IDs and computes
#' dry biomass using species- or trait-specific allometric models.
#'
#' @param data A `data.frame` or `tibble` containing body size and equation IDs.
#' @param body_size_var A character string naming the body size variable in `data`.
#' @param equation_id_var A character string naming the equation ID variable in `data`..
#'
#' @return A list with two elements:
#' \describe{
#'   \item{output}{A `data.frame` with original data and predicted dry biomass.}
#'   \item{metadata}{The joined data including all columns from the trait database.}
#' }
#' @importFrom dplyr all_of left_join rename select tibble
#' @importFrom assertthat assert_that
#' @examples
#' \dontrun{
#' data <- tibble::tibble(equation_id = c(3, 5, 6), body_size = c(0.5, 0.3, 0.2))
#' result <- predict_dry_biomass(data, body_size_var = "body_size", equation_id_var = "equation_id", trait = "leaf")
#' }
#' @export
use_equation_database <- function(data, body_size_var, equation_id_var) {
  # Ensure equation_id is numeric
  data[[equation_id_var]] <- as.numeric(data[[equation_id_var]])

  # Assertions
  assertthat::assert_that(
    (!is.na(body_size_var)) & is.character(body_size_var),
    msg = paste(body_size_var, "must be a character object and present")
  )

  assertthat::assert_that(
    (!is.na(equation_id_var)) & is.character(equation_id_var),
    msg = paste(equation_id_var, "must be a character object and present")
  )

  assertthat::assert_that(
    all(c(body_size_var, equation_id_var) %in% names(data)),
    msg = paste(body_size_var, "and", equation_id_var, "must be present in the data")
  )

  assertthat::assert_that(
    is.numeric(data[[body_size_var]]),
    msg = paste0(body_size_var, " is not numeric")
  )

  # Load equation database if needed
  if (!exists("equation_db")) {
    assign(
      "equation_db",
      readRDS(file = get_db_file_path(paste0("equation", "_database.rds"))),
      envir = .GlobalEnv
    )
  }

  trait_db <- get("equation_db", envir = .GlobalEnv)

  assertthat::assert_that(
    all(data[[equation_id_var]] %in% trait_db$equation_id),
    msg = "Not all equation_ids in the data are present in the database"
  )

  # Join data and database
  data_join <- data |>
    dplyr::rename("equation_id" = dplyr::all_of(equation_id_var))

  data_join <- dplyr::left_join(data_join, trait_db, by = "equation_id")

  # Calculate dry biomass
  dry_biomass_mg <- vector(length = nrow(data_join))

  for (i in seq_len(nrow(data_join))) {
    L <- unlist(data_join[i, body_size_var], use.names = FALSE)
    model <- data_join[i, "equation_form", drop = TRUE]
    log_base <- data_join[i, "log_base", drop = TRUE]
    a <- data_join[i, "a", drop = TRUE]
    b <- data_join[i, "b", drop = TRUE]
    CF <- data_join[i, "lm_correction", drop = TRUE]
    scale <- data_join[i, "dry_biomass_scale", drop = TRUE]

    if (any(is.na(c(a, b)))) {
      dry_biomass_mg[i] <- NA
    } else if (model == "model1") {
      x <- a + (b * logb(x = L, base = log_base))
      x <- log_base^x
      dry_biomass_mg[i] <- if (!is.na(CF)) x * CF else x
      dry_biomass_mg[i] <- dry_biomass_mg[i] * scale
    } else if (model == "model2") {
      dry_biomass_mg[i] <- a * (L^b) * scale
    }
  }

  # Build output
  data_out <- data_join |>
    dplyr::select(dplyr::all_of(c(body_size_var, "equation_id"))) |>
    dplyr::rename(!!equation_id_var := "equation_id")

  data_out$dry_biomass_mg <- dry_biomass_mg

  return(list(
    output = data_out,
    metadata = data_join
  ))
}
