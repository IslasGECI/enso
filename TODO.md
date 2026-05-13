# The Gold: migrate get_domain_specific_options() to use gecioptparse

## Design decisions

### Option definitions

| Option | Short flag | Type | Default | Help text |
|--------|-----------|------|---------|-----------|
| `--data-path` | `-d` | `character_option` | `/workdir/data/weather_station_data.csv` | `"File path of the weather station data"` |
| `--roni-path` | `-r` | `character_option` | `/workdir/data/external/roni_data.csv` | `"File path of the ONI data (regional ocean climate data)"` |
| `--output-path` | `-o` | `character_option` | `/workdir/data/processed/weather_classified_data.csv` | `"File path of the classified weather data output"` |

- No additional options beyond these three.
- Return value changes from named character vector to named list (`optparse::parse_args()` output).

### DESCRIPTION changes

- Add `gecioptparse` to `Imports:` (alphabetical order).
- Add `IslasGECI/gecioptparse` to `Remotes:` (follows `bycatch_code` pattern).

## TDD plan

### 1. RED — write failing test

Update `tests/testthat/test_get_domain_specific_options.R`:
- Keep existing name-check assertion.
- Add `it("has the expected default values")` block that asserts the three new defaults.

Expected failure: current stub returns `""` for all values, not the new defaults.

### 2. GREEN — implement using gecioptparse

Rewrite `R/get_domain_specific_options.R`:
- Build each option with `gecioptparse::character_option(name, default, help)`.
- Combine into a vector.
- Pass to `gecioptparse::get_options_from_vec()`.
- Update DESCRIPTION (Imports + Remotes).
- Run `make setup` to regenerate NAMESPACE (adds `gecioptparse` import).

### 3. REFACTOR

- Verify help strings render correctly.
- Check `make check` (styler format) passes.
- Confirm `make tests` passes.
- Update DOCS.md if return-type description needs adjustment.
