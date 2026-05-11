# DOCS.md — enso

Technical reference for all exported and internal functions.

---

## Exported Functions

### `classify_by_season_and_enso_phase(data_with_date, nooa_data)`

Classifies each date in a data frame by season and ENSO phase using NOAA ONI data.

- **Parameters**:
  - `data_with_date`: data.frame. Must contain a `Date` column with date strings.
  - `nooa_data`: data.frame. NOAA ONI data in wide format with a `Year` column and twelve trimester columns (DJF, JFM, FMA, MAM, AMJ, MJJ, JJA, JAS, ASO, SON, OND, NDJ).
- **Returns**: data.frame. The input data frame with two additional columns: `Season` (Winter, Spring, Summer, Fall) and `ENSO_Phase` (Niño, Niña, Neutral).

### `get_domain_specific_options()`

Defines CLI option keys with default values for domain-specific workflows.

- **Parameters**: None.
- **Returns**: A named vector containing the option keys `data-path`, `roni-path`, and `output-path`.

---

## Internal Functions

### `compute_season(date)`

Maps a date string to a season name.

- **Parameters**:
  - `date`: character. Date string in YYYY-MM-DD format.
- **Returns**: character. One of Winter, Spring, Summer, or Fall.

### `compute_enso(date, oni_data)`

Classifies the ENSO phase for a given date based on ONI data.

- **Parameters**:
  - `date`: character or Date. Date to classify.
  - `oni_data`: data.frame. NOAA ONI data in wide format (Year + trimester columns).
- **Returns**: character. One of Niño, Niña, or Neutral.

### `lookup_season_column(month)`

Maps a numeric month to a trimester abbreviation used in ONI data.

- **Parameters**:
  - `month`: numeric. Month of the year (1–12).
- **Returns**: character. Trimester abbreviation (DJF, JFM, FMA, MAM, AMJ, MJJ, JJA, JAS, ASO, SON, OND, NDJ).

### `transform_roni_data_to_longer(roni_data)`

Reshapes wide-format ONI data into long format.

- **Parameters**:
  - `roni_data`: data.frame. ONI data with a `Year` column and trimester value columns.
- **Returns**: data.frame. Long-format data with columns `Year`, `months` (trimester), and `values` (ONI value).

### `lookup_nine_oni_values(oni_data, year, trimester)`

Extracts nine consecutive ONI values centered on a given year and trimester.

- **Parameters**:
  - `oni_data`: data.frame. Transformed ONI data in long format (Year, months, values).
  - `year`: numeric. Target year.
  - `trimester`: character. Target trimester abbreviation.
- **Returns**: numeric. Vector of nine ONI values (four before, the target, four after).

### `classify_enso_phase(oni_values)`

Classifies ENSO phase from nine ONI values using a consecutive-threshold rule.

- **Parameters**:
  - `oni_values`: numeric. Vector of nine ONI values.
- **Returns**: character. Niña if five or more consecutive values are ≤ -0.5; Niño if five or more consecutive values are ≥ 0.5; Neutral otherwise.

### `has_consecutive_threshold_values(runs)`

Checks whether a run-length encoding contains a run of five or more true values.

- **Parameters**:
  - `runs`: rle object. Run-length encoding of a logical condition.
- **Returns**: logical. TRUE if any true run has length ≥ 5.
