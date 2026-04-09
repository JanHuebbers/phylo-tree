if (!requireNamespace("renv", quietly = TRUE)) install.packages("renv")
if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")

cran_pkgs <- c(
  "readxl", "dplyr", "tidyr", "purrr", "tibble", "ggplot2", "ape", "phangorn"
)

bioc_pkgs <- c(
  "Biostrings", "msa", "ggtree"
)

install.packages(setdiff(cran_pkgs, rownames(installed.packages())))
BiocManager::install(setdiff(bioc_pkgs, rownames(installed.packages())), ask = FALSE)

renv::snapshot()