# phylo-tree
An R-based workflow for protein sequence alignment, phylogenetic tree construction, bootstrap support analysis, and `ggtree`-based visualization.
## Table of contents
- [Overview](#overview)
- [Features](#features)
- [Repository layout](#repository-layout)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Notes](#notes)
- [Status](#status)
## Overview
`phylo-tree` is an R-based workflow for generating multiple sequence alignments, inferring phylogenetic trees, calculating bootstrap support, and producing tree visualizations by [ggtree](https://guangchuangyu.github.io/software/ggtree/).
The pipeline is centered around the R Markdown workflow in `src/msa_and_tree_generator.Rmd` and uses a project-local `renv` environment for dependency management.
## Features
- Import protein sequences from Excel
- Classify sequences into protein families
- Generate family-specific multiple sequence alignments with ClustalW, Clustal Omega, or MUSCLE
- Build maximum-likelihood phylogenetic trees
- Calculate bootstrap support values
- Save tree objects and Newick exports
- Create `ggtree`-based tree visualizations
- Manage dependencies with a project-local `renv` environment
## Repository layout
```text
phylo-tree/
├── data/                         # input data and filtered intermediate tables
├── output/                       # generated alignments, trees, and plots
├── src/                          # main workflow, helper scripts, and templates for tree visualization
├── renv/                         # project-local renv files
├── renv.lock                     # dependency lockfile
├── renv_setup.R                  # environment setup script
└── phylo-tree.Rproj              # RStudio project file
```
## Requirements
- R
- RStudio is recommended for interactive use
- PowerShell or a terminal for command-line setup and execution (optional)
## Installation
Clone the repository and change into the project directory.
```powershell
git clone <your-repository-url>
cd phylo-tree
```
Set up the project-local R environment in one of two ways.
### Option 1: Create or update the environment with `renv_setup.R`
Run the setup script once:
```powershell
Rscript .\renv_setup.R
```
The setup script will:
- install bootstrap helper packages such as `renv` and `BiocManager` if needed
- initialize a project-local `renv` environment if no lockfile is present
- otherwise activate the existing project environment
- install the required CRAN and Bioconductor packages
- create or update `renv.lock`
### Option 2: Restore the environment from the lockfile
If the repository already contains an `renv.lock` file, you can restore the recorded package versions directly with:
```powershell
Rscript -e "renv::restore()"
```
### If `Rscript` is not on PATH
If PowerShell cannot find `Rscript`, either add R to your `PATH` or call it via the full path to `Rscript.exe`, for example:
```powershell
"C:\Program Files\R\R-4.4.0\bin\Rscript.exe" .\renv_setup.R
```
or:
```powershell
"C:\Program Files\R\R-4.4.0\bin\Rscript.exe" -e "renv::restore()"
```
## Usage
### Recommended: use RStudio
Open `phylo-tree.Rproj` in RStudio. This ensures that the repository root is used as the project directory.
Then open:
```text
src/msa_and_tree_generator.Rmd
```
and run or knit the workflow from there.
The script uses `here::i_am("src/msa_and_tree_generator.Rmd")` together with:
```r
knitr::opts_knit$set(root.dir = here::here())
```
so file paths are resolved from the repository root.
### Command-line usage
You can also render the workflow from the repository root:
```powershell
Rscript -e "rmarkdown::render('src/msa_and_tree_generator.Rmd')"
```
## Notes
- Open the repository via `phylo-tree.Rproj` when working in RStudio
- Keep file names and capitalization consistent, especially if the workflow should also run on Linux
- The workflow expects input files under `data/` and writes outputs to `output/`
- Package loading is handled through the project-local `renv` environment
## Status
This repository is under active development. Paths, helper scripts, and plotting templates may still change as the workflow is refined.
