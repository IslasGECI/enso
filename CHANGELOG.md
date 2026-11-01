# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.2.0] - 2026-11-01

### Added

- `compute_meteorological_season()`: Returns the meteorological season of a date.
- `compute_enso_phase()`: Returns the ENSO phase of a date from NOAA ONI data.
- `compute_meteorological_season_and_enso_phase()`: Appends `Meteorological_Season` and `ENSO_Phase` to a tibble and keeps its other columns.

### Changed

- `classify_by_season_and_enso_phase()` became `compute_meteorological_season_and_enso_phase()`, and now takes the name of the date column and returns a tibble with the input columns preserved.
- `compute_season()` and `compute_enso()` became exported functions, `compute_meteorological_season()` and `compute_enso_phase()`.
- Dates are read with lubridate, so `YYYY-MM` and `YYYY-MM-DD` are both accepted, and a date that cannot be parsed yields `NA`.

### Removed

- The export of the wide-to-long ONI reshape; the function is internal.

## [0.1.0] - 2026-05-08

### Added

- `classify_by_season_and_enso_phase()`: Accepts a data frame with a Date column and NOAA ONI data; returns a data frame with columns Date, Season, and ENSO_Phase. Season and ENSO phase (Niño, Niña, or Neutral) are computed per date.

[unreleased]: https://github.com/IslasGECI/enso/compare/v0.2.0...HEAD
[0.2.0]: https://github.com/IslasGECI/enso/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/IslasGECI/enso/releases/tag/v0.1.0
