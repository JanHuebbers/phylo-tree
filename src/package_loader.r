library(renv)
renv::activate()

libs <- c(
  "readxl", "dplyr", "tidyr", "purrr", "tibble",
  "ggplot2", "Biostrings", "msa", "phangorn", "ape", "ggtree", "grid"
)

invisible(lapply(libs, library, character.only = TRUE))