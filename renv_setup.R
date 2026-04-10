options(repos = c(CRAN = "https://cloud.r-project.org"))

if (!requireNamespace("renv", quietly = TRUE)) {
  install.packages("renv")
}
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

if (!file.exists("renv.lock")) {
  renv::init(bare = TRUE)
} else {
  renv::activate()
}

cran_pkgs <- c(
  "readxl",
  "writexl",
  "dplyr",
  "tidyr",
  "purrr",
  "tibble",
  "ggplot2",
  "ape",
  "phangorn",
  "knitr",
  "rmarkdown",
  "here"
)

bioc_pkgs <- c(
  "Biostrings",
  "msa",
  "ggtree"
)

all_installed <- rownames(installed.packages())

cran_missing <- setdiff(cran_pkgs, all_installed)
if (length(cran_missing) > 0) {
  install.packages(cran_missing)
}

all_installed <- rownames(installed.packages())

bioc_missing <- setdiff(bioc_pkgs, all_installed)
if (length(bioc_missing) > 0) {
  BiocManager::install(bioc_missing, ask = FALSE, update = FALSE)
}

renv::snapshot(prompt = FALSE)

message("renv setup complete.")