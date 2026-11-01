# DOCS.md — enso

Public interface of the `enso` package. Every function below is exported and reachable after `library(enso)`.

---

### compute_meteorological_season(date)

Labels a date by its meteorological season.

**Parameters**:
- `date`: character. One date in `YYYY-MM` or `YYYY-MM-DD` format.

**Returns**: character. One of `Winter`, `Spring`, `Summer`, or `Fall`.

**Notes**:
- The seasons are meteorological: January to March is Winter, April to June is Spring, July to September is Summer, October to December is Fall.
- A date that cannot be parsed yields `NA`.
- The contract is one date. Passing a vector is unspecified.

### compute_enso_phase(date, oni_data)

Labels a date by its ENSO phase.

**Parameters**:
- `date`: character. One date in `YYYY-MM` or `YYYY-MM-DD` format.
- `oni_data`: data.frame. NOAA ONI data in wide format: a `Year` column and twelve trimester columns, from `DJF` to `NDJ`.

**Returns**: character. One of `Niño`, `Niña`, or `Neutral`.

**Notes**:
- The phase comes from the nine trimesters centered on the date: five consecutive trimesters at or above 0.5 are Niño, five at or below −0.5 are Niña, and anything else is Neutral.

### compute_meteorological_season_and_enso_phase(data_with_date, date_column_name, oni_data)

Appends the meteorological season and the ENSO phase to a tibble of dates.

**Parameters**:
- `data_with_date`: data.frame. The table to label.
- `date_column_name`: character. Name of the column that holds the dates.
- `oni_data`: data.frame. NOAA ONI data in wide format.

**Returns**: tibble. The input table with the `Meteorological_Season` and `ENSO_Phase` columns appended.

**Errors**: the named date column does not exist.

**Notes**:
- Every other column of the input comes back untouched.
