libs <- c(
  "readxl", "dplyr", "tidyr", "purrr", "tibble",
  "ggplot2", "Biostrings", "msa", "phangorn", "ape", "ggtree", "grid", "here"
)

missing_libs <- libs[!vapply(libs, requireNamespace, logical(1), quietly = TRUE)]
if (length(missing_libs) > 0) {
  stop("Missing packages: ", paste(missing_libs, collapse = ", "))
}

invisible(lapply(libs, library, character.only = TRUE))