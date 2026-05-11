<a href="https://www.islas.org.mx"><img src="https://www.islas.org.mx/img/logo.svg" align="right" width="256" /></a>

# ENSO classification package
[![codecov](https://codecov.io/gh/IslasGECI/enso/graph/badge.svg?token=wyxnwZypMA)](https://codecov.io/gh/IslasGECI/enso)
![example branch parameter](https://github.com/IslasGECI/enso/actions/workflows/actions.yml/badge.svg)
![licencia](https://img.shields.io/github/license/IslasGECI/enso)
![languages](https://img.shields.io/github/languages/top/IslasGECI/enso)
![commits](https://img.shields.io/github/commit-activity/y/IslasGECI/enso)
![R-version](https://img.shields.io/github/r-package/v/IslasGECI/enso)

Classify dates by season and El Niño-Southern Oscillation (ENSO) phase.

## How it works

Provide a list of dates and a NOAA ONI dataset. The package returns each date with its season and ENSO phase (El Niño, La Niña, or Neutral).

| Feature | Status |
| :--- | :--- |
| Classify dates by season (Winter, Spring, Summer, Fall) | Ready |
| Classify dates by ENSO phase (Niño, Niña, Neutral) | Ready |
| CLI option definitions for automation scripts | Ready |

## Before you start

You need an ONI dataset from NOAA in wide format with a `Year` column and trimester columns (DJF, JFM, FMA, MAM, AMJ, MJJ, JJA, JAS, ASO, SON, OND, NDJ).

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

If you pass a data frame with a `Date` column and ONI data to `classify_by_season_and_enso_phase()`, you get back the same data frame with two new columns:

- **Season** — Winter, Spring, Summer, or Fall, determined from the date.
- **ENSO_Phase** — Niño, Niña, or Neutral, determined from the ONI values.

The ENSO phase is classified using a five-consecutive-month threshold: five or more months with ONI ≥ 0.5 indicates El Niño; five or more months with ONI ≤ -0.5 indicates La Niña.

## Coming soon

- Integration with `gecioptparse` for command-line argument parsing.
- Additional ONI data sources and formats.
- Batch processing of multiple date lists.
