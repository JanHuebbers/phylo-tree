library(renv)

# Packages required for the msa/tree workflow
libs <- c(
  "readxl",
  "dplyr",
  "tidyr",
  "purrr",
  "tibble",
  "ggplot2",
  "Biostrings",
  "msa",
  "phangorn",
  "ape",
  "ggtree",
  "grid"
)

# Ensure required packages are installed and loaded
invisible(lapply(libs, function(lib) {
  tryCatch({
    if (!requireNamespace(lib, quietly = TRUE)) {
      renv::install(lib)
    }
    library(lib, character.only = TRUE)
  }, error = function(e) {
    message(sprintf("Failed to load library '%s': %s", lib, e$message))
  })
}))