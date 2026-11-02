# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.1.0] - 2026-11-01

### Added

- `compute_meteorological_season()`: Labels a date by its meteorological season.
- `compute_enso_phase()`: Labels a date by its ENSO phase using NOAA ONI data.
- `compute_meteorological_season_and_enso_phase()`: Appends `Meteorological_Season` and `ENSO_Phase` to a tibble and keeps its other columns.

[unreleased]: https://github.com/IslasGECI/enso/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/IslasGECI/enso/releases/tag/v0.1.0
