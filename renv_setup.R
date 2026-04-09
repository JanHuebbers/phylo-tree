options(repos = c(CRAN = "https://cloud.r-project.org"))

# Install bootstrap helpers into the user library if needed
if (!requireNamespace("renv", quietly = TRUE)) {
  install.packages("renv")
}
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

# Create or activate the project-local renv library
if (!file.exists("renv.lock")) {
  renv::init(bare = TRUE)
} else {
  renv::activate()
}

cran_pkgs <- c(
  "readxl",
  "dplyr",
  "tidyr",
  "purrr",
  "tibble",
  "ggplot2",
  "ape",
  "phangorn"
)

bioc_pkgs <- c(
  "Biostrings",
  "msa",
  "ggtree"
)

installed <- rownames(installed.packages())

cran_missing <- setdiff(cran_pkgs, installed)
if (length(cran_missing) > 0) {
  install.packages(cran_missing)
}

installed <- rownames(installed.packages())

bioc_missing <- setdiff(bioc_pkgs, installed)
if (length(bioc_missing) > 0) {
  BiocManager::install(bioc_missing, ask = FALSE, update = FALSE)
}

renv::snapshot(prompt = FALSE)

message("renv setup complete.")