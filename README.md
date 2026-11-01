<a href="https://www.islas.org.mx"><img src="https://www.islas.org.mx/img/logo.svg" align="right" width="256" /></a>

# ENSO classification package
[![codecov](https://codecov.io/gh/IslasGECI/enso/graph/badge.svg?token=wyxnwZypMA)](https://codecov.io/gh/IslasGECI/enso)
![example branch parameter](https://github.com/IslasGECI/enso/actions/workflows/actions.yml/badge.svg)
![licencia](https://img.shields.io/github/license/IslasGECI/enso)
![languages](https://img.shields.io/github/languages/top/IslasGECI/enso)
![commits](https://img.shields.io/github/commit-activity/y/IslasGECI/enso)
![R-version](https://img.shields.io/github/r-package/v/IslasGECI/enso)

Label dates by meteorological season and by El Niño-Southern Oscillation (ENSO) phase.

## How it works

Give the package a date, and it tells you its season. Give it a date and a NOAA ONI table, and it also tells you the ENSO phase: El Niño, La Niña, or Neutral. Give it a whole table of dates, and it adds both labels as two new columns.

| Feature | Status |
| :--- | :--- |
| Label one date by season (Winter, Spring, Summer, Fall) | Ready |
| Label one date by ENSO phase (Niño, Niña, Neutral) | Ready |
| Add both labels to a table of dates | Ready |

## Before you start

To classify ENSO phases you need an ONI dataset from NOAA in wide format: a `Year` column and twelve trimester columns (DJF, JFM, FMA, MAM, AMJ, MJJ, JJA, JAS, ASO, SON, OND, NDJ).

## Run the project

### With Docker (recommended)

```sh
docker compose build
docker compose run islasgeci R
```

Inside the container, load the package:

```r
library(enso)
```

### Without Docker

Install the package and its dependencies:

```r
remotes::install_github("IslasGECI/testtools")
remotes::install_github("IslasGECI/enso")
```

## Core concept

Three functions make up the package:

```r
library(enso)

compute_meteorological_season("2026-01-01")
#> [1] "Winter"

compute_enso_phase("2023-08", oni_data)
#> [1] "Niño"

compute_meteorological_season_and_enso_phase(dates, "Date", oni_data)
#> # A tibble: 3 × 3
#>   Date    Meteorological_Season ENSO_Phase
#>   <chr>   <chr>                 <chr>
#> 1 2023-08 Summer                Niño
#> 2 2025-01 Winter                Niña
#> 3 2024-04 Spring                Neutral
```

The ENSO phase uses a five-consecutive-month threshold: five or more trimesters with ONI ≥ 0.5 indicate El Niño; five or more with ONI ≤ −0.5 indicate La Niña; anything else is Neutral.
