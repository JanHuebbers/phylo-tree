# phylo-tree
An R-based pipeline for protein sequence alignment, phylogenetic tree construction, bootstrap support analysis, and ggtree-based visuals.
## Table of contents
- [Overview](#overview)
- [Features](#features)
- [Notes](#notes)
- [Repository layout](#repository-layout)
- [Requirements](#requirements)
- [Installation](#installation)
- Workflow
  1. Sequence input
- Typical workflow
- Status
## Overview

## Features

## Notes

## Repository layout

## Requirements

## Installation
Clone the repository and change into the project directory.
```powershell
git clone <your-repository-url>
cd phylo-tree
```
Set up the R environment in one of two ways.
**Option 1: Create the environment with renv_setup.R**
Run the setup script once to install the required packages and create the project-local renv environment.
```PowerShell
Rscript .\renv_setup.R
```
The setup script will:
- check whether an renv.lock file already exists
- restore the project environment from the lockfile if it is present
- otherwise initialize a new project-local renv environment
- install the required CRAN and Bioconductor packages
- create or update renv.lock
**Option 2: Restore the environment from the lockfile**
If the repository already contains an renv.lock file, you can also directly restore the recorded package versions by:
```PowerShell
Rscript -e "renv::restore()"
```
**If Rscript is not on PATH**
If PowerShell cannot find Rscript, either add R to your PATH or call it via the full path to Rscript.exe, for example:
```PowerShell
"C:\Program Files\R\R-4.4.0\bin\Rscript.exe" .\renv_setup.R
```
or, for restoring from the lockfile:
```PowerShell
"C:\Program Files\R\R-4.4.0\bin\Rscript.exe" -e "renv::restore()"
```