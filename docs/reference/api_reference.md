# API reference: series

Endpoint: `/series`

The `/series` endpoint allows **obtaining data and metadata** of one or more series, filtering by the time index, changing temporal aggregation and changing units, between other operations.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
 

- [Parameters](#parameters)
    - [`ids`](#ids)
    - [`representation_mode`](#representation_mode)
    - [`collapse`](#collapse)
    - [`collapse_aggregation`](#collapse_aggregation)
    - [`limit`](#limit)
    - [`start`](#start)
    - [`start_date`](#start_date)
    - [`end_date`](#end_date)
    - [`format`](#format)
    - [`header`](#header)
    - [`sort`](#sort)
    - [`metadata`](#metadata)
    - [`decimal`](#decimal)
    - [`sep`](#sep)
    - [`flatten`](#flatten)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Parameters

<table>
    <tr>
        <th>Name</th>
        <th>Required</th>
        <th>Type</th>
        <th>Default</th>
        <th>Examples</th>
    </tr>
    <tr>
        <td>ids</td>
        <td>Yes</td>
        <td>List of alphanumeric characters separated by commas.<br><br>Contains series specification to query, together with operations and transformations.</td>
        <td>N/A</td>
        <td>ids=2.4_DGI_1993_T_19,134.2_B_0_0_6</td>
    </tr>
    <tr>
        <td>representation_mode</a></td>
        <td>No</td>
        <td>One of: <em>value, change, percent_change, percent_change_a_year_ago</em></td>
        <td>value</td>
        <td>representation_mode=percent_change</td>
    </tr>
    <tr>
        <td>collapse</a></td>
        <td>No</td>
        <td>One of: <em>day, week, month, quarter, year</em></td>
        <td>The original frequency of the series</td>
        <td>collapse=year<br>collapse=quarter</td>
    </tr>
    <tr>
        <td>collapse_aggregation</a></td>
        <td>No</td>
        <td>One of: <em>avg, sum, end_of_period, min, max</em></td>
        <td>avg</td>
        <td>collapse_aggregation=sum</td>
    </tr>
    <tr>
        <td>limit</a></td>
        <td>No</td>
        <td>Positive integer, less than 1000.</td>
        <td class="s4" dir="ltr">100</td>
        <td>limit=50</td>
    </tr>
    <tr>
        <td>start</a></td>
        <td>No</td>
        <td>Positive integer or 0.</td>
        <td class="s4" dir="ltr">0</td>
        <td>start=100</td>
    </tr>
    <tr>
        <td>start_date</a></td>
        <td>No</td>
        <td>Date and time in ISO 8601 format.<br><br>If this parameter is not specified, data starts from the oldest value.</td>
        <td>N/A</td>
        <td>start_date=2016-11-30<br>start_date=2016-11<br>start_date=2016</td>
    </tr>
    <tr>
        <td>end_date</td>
        <td>No</td>
        <td>Date and time in ISO 8601 format.<br><br>If this parameter is not specified, data will end at the most recent value.</td>
        <td>N/A</td>
        <td>end_date=2016-11-30<br>end_date=2016-11<br>end_date=2016</td>
    </tr>
    <tr>
        <td>format</a></td>
        <td>No</td>
        <td>One of: <em>json, csv</em></td>
        <td>json</td>
        <td>format=csv</td>
    </tr>
    <tr>
        <td>header</td>
        <td>No</td>
        <td>One of: <em>titles, ids, descriptions</em></td>
        <td>titles</td>
        <td>header=ids</td>
    </tr>
    <tr>
        <td>sort</td>
        <td>No</td>
        <td>One of: <em>asc, desc</em></td>
        <td>asc</td>
        <td>sort=desc</td>
    </tr>
    <tr>
        <td>metadata</td>
        <td>No</td>
        <td>One of: <em>none, simple, full, only</em></td>
        <td>simple</td>
        <td>metadata=none</td>
    </tr>
    <tr>
        <td>decimal</td>
        <td>No</td>
        <td>Decimal character to be used.<br><br>One of: <em>"," o "."</em></td>
        <td>.</td>
        <td>decimal=,</td>
    </tr>
    <tr>
        <td>sep</td>
        <td>No</td>
        <td>CSV values separator character.<br><br>Any UTF-8 character</em></td>
        <td>.</td>
        <td>sep=|</td>
    </tr>
    <tr>
        <td>flatten</td>
        <td>No</td>
        <td>Makes the answer flat in a single object with just one hierarchy level (no nested objects). No value should be specified.</td>
        <td></td>
        <td>flatten</td>
    </tr>
</table>

### `ids`

Comma separated list of series ids. Data results will have a column for each series id, in the same order.

**This parameter is mandatory for making a call**. In case is omitted, result will be an error.

Each identifier of a series can have a suffix for:

* Changing representation mode ([`representation_mode`](#representation_mode)).
* Changing temporal aggregation ([`collapse_aggregation`](#collapse_aggregation)).

When these attributes are used inside `ids` parameter, they must be separated using ":" character. The order of the components does not affect the order of the operation.

Examples:

```md
ids=2.4_DGI_1993_T_19,134.2_B_0_0_6:change
ids=2.4_DGI_1993_T_19,134.2_B_0_0_6:sum:change
ids=2.4_DGI_1993_T_19,134.2_B_0_0_6:change:sum
ids=2.4_DGI_1993_T_19:percent_change,134.2_B_0_0_6:sum:change
ids=2.4_DGI_1993_T_19:end_of_period:percent_change,134.2_B_0_0_6:sum:change
```

### `representation_mode`

Indicates the representation mode of the series. It is applied to all in the [`ids`](#ids) parameter not having a different representation mode applied.

Representation mode by default is the original value of the series (*value*).

Available representation modes are:

* *value*: Default representation mode. Returns the original value of the serie.
* *change*: Returns the absolute difference between value of t period and t-1 period.
* *percent_change*: Returns percentage variation of the value in the t period and t-1 period.
* *percent_change_a_year_ago*: Returns percentage variation between t period value and the same t period, a year ago.

Available transformation functions in [`representation_mode`](#representation_mode) can also be specified for **individual series** using `:percent_change` notation, together with series id:

!!! note "[Construction Economic Activity. Percentage variation of monthly values, period to period.](http://datos.gob.ar/series/api/series/?ids=11.3_VMATC_2004_M_12:percent_change)"
    [`https://apis.datos.gob.ar/series/api/series/?limit=1000&ids=11.3_VMATC_2004_M_12:percent_change`](https://apis.datos.gob.ar/series/api/series/?limit=1000&ids=11.3_VMATC_2004_M_12:percent_change)

!!! note "[Construction Economic Activity (percentage variation period to period), Construction Economic Activity (percentage variation year to year). Monthly values.](http://datos.gob.ar/series/api/series/?ids=11.3_VMATC_2004_M_12:percent_change,11.3_VMATC_2004_M_12:percent_change_a_year_ago)"
    [`https://apis.datos.gob.ar/series/api/series/?limit=1000&ids=11.3_VMATC_2004_M_12:percent_change,11.3_VMATC_2004_M_12:percent_change_a_year_ago`](https://apis.datos.gob.ar/series/api/series/?limit=1000&ids=11.3_VMATC_2004_M_12:percent_change,11.3_VMATC_2004_M_12:percent_change_a_year_ago)

[`representation_mode`](#representation_mode) parameter will continue to affect all series where no individual representation mode has been specified.

### `collapse`

[`collapse`](#collapse) parameter modifies sample frequency of series of the query. It must be used in combination with [`collapse_aggregation`](#collapse_aggregation) to specify a temporal aggregation function, when necessary.

Available options are:

* *year*: Show data yearly aggregated.
* *quarter*: Show data quarterly aggregated.
* *month*: Show data monthly aggregated.
* *week*: Show data weekly aggregated.
* *day*: Show data daily aggregated.

If not specified, data of a single series query is return using **original frequency of the serie**.

If **multiples series of different frequencies are being called at the same time**, the lowest frequency of all of them will be used (ie.: if you ask for  daily, monthly and quarterly series in the same call, they will all be converted to quarterly frequency).

If you ask for a higher frequency level in [`collapse`](#collapse) than the lowest one available between asked series, the query will return an error.

[`collapse`](#collapse) parameter affects globally to all series selected from the [`ids`](#ids) parameter in the API call.

### `collapse_aggregation`

[`collapse_aggregation`](#collapse_aggregation) parameter indicates the temporal aggregation function that must be used to make all the series in the call have the same frequency (ie.: what operation should be used to convert a monthly series in a yearly series).

This aggregation function will act over data of:

* Series with higher original aggregation level (highest frequency) than the one specified in [`collapse`](#collapse) parameter.
* In case [`collapse`](#collapse) parameter is not specified, series of higher aggregation level than the one of the series with the lowest temporal aggregation level of all.

Available options are:

* *avg*: Calculates the average of all values. This is the default option if no [`collapse_aggregation`](#collapse_aggregation) parameter is specified.
* *sum*: Sum all values.
* *end_of_period*: Last value of the aggregated period.
* *min*: Minimum value of the aggregated period.
* *max*: Maximum value of the aggregated period.

Temporal aggregation functions available in [`collapse_aggregation`](#collapse_aggregation) parameter can also be specified for **individual series** using `:sum` notation together with series id:

!!! note "[Payment of tourism services and trips. Monthly values averaged and sum by year.](http://datos.gob.ar/series/api/series/?ids=185.1_COBRO_SERVJES_0_M_30:avg,185.1_COBRO_SERVJES_0_M_30:sum&collapse=year)"

    [`https://apis.datos.gob.ar/series/api/series/?ids=185.1_COBRO_SERVJES_0_M_30:avg,185.1_COBRO_SERVJES_0_M_30:sum&collapse=year`](https://apis.datos.gob.ar/series/api/series/?ids=185.1_COBRO_SERVJES_0_M_30:avg,185.1_COBRO_SERVJES_0_M_30:sum&collapse=year)

[`collapse_aggregation`](#collapse_aggregation) parameter will continue to affect all series that have no temporal aggregation function individually specified.

!!! note "[Payment of tourism services and trips. Monthly values averaged and sum by year.](http://datos.gob.ar/series/api/series/?ids=185.1_COBRO_SERVJES_0_M_30:avg,185.1_COBRO_SERVJES_0_M_30&collapse=year&collapse_aggregation=sum)"

    [`https://apis.datos.gob.ar/series/api/series/?ids=185.1_COBRO_SERVJES_0_M_30:avg,185.1_COBRO_SERVJES_0_M_30&collapse=year&collapse_aggregation=sum`](https://apis.datos.gob.ar/series/api/series/?ids=185.1_COBRO_SERVJES_0_M_30:avg,185.1_COBRO_SERVJES_0_M_30&collapse=year&collapse_aggregation=sum)

### `limit`

Parameter used together with [`start`](#start) to control pagination of API call results. Must be a positive integer not greater than 1000. Default value is 100.

### `start`

Parameter used together with [`limit`](#limit) to control pagination of API call results. Must be a positive integer or 0. Default value is 0.

[`start`](#start) parameter indicates the "number of periods after [`start_date`](#start_date)" (or the "number of periods before [`end_date`](#end_date)", depending on *asc* or *desc* sorting criteria specified on [`sort`](#sort) parameter) that should be skipped from beginning or end of the series before staring to return values.

### `start_date`

[`start_date`](#start_date) parameter indicates the less recent date where API results should start, when data is available. Values where time index is equal to [`start_date`](#start_date) value will be included. It is a temporal filter over time index of all series in the API call.

### `end_date`

[`end_date`](#end_date) parameter indicates the most recent date where API results should end, when data is available. Values where time index is equal to [`end_date`](#end_date) will be included. It is a temporal filter over time index of all series in the API call.

### `format`

Specifies the format of the results. JSON is the default.

Available options are:

* *json*: Returns a JSON object with data and metadata of the series.
* *csv*: Returns selected series in a comma separated format. It does not include metadata.

### `header`

Specifies attributes of series to be used as *headers* of the CSV file columns. Uses *titles* as default, being the shortest human readable titles of the series.

Available options are:

* *titles*: Series titles as **oferta_global_pib** (default).
* *ids*: Series unique identifiers. The same values passed in `ids` parameter.
* *descriptions*: Complete descriptions of the series as **Plazo fijo entre 60-89 días en millones de pesos. Categoría II-VI**.

### `sort`

Specifies the sorting direction in which values are returned. *asc* is the default value.

Available options are:

* *asc*: Less recent values first (default).
* *desc*: Most recent values first.

### `metadata`

Specifies the level of metadata detail required by the user, being *simple* the default. Only applies when `format=json`.

Available options are:

* *none*: No metadata is returned, only data.
* *only*: No data is returned, only metadata.
* *simple*: Only important metadata to understand and use the series is returned (default).
* *full*: All metadata available is returned.

### `decimal`

Specifies character used for decimal numbers. *.* is the default. Only applies when `format=csv`.

Available options are:

* *,*: Comma.
* *.*: Dot.

### `sep`

Specifies the character that separates values in a CSV file. *,* is the default. Only applies when `format=csv`.

Any UTF-8 character can be used, but it is highly recommended to keep the default (comma) in most cases.

### `flatten`

Specifies if the metadata results should be returned with a flat hierarchy.

When parameter is not included, API call result has a nested structure:

```
    {
        "catalog": [<catalog_meta>],
        "dataset": [<dataset_meta>],
        "distribution": [<distribution_meta>],
        "field": [<field_meta>],
    }
```

When `flatten` is included, API call metadata result has a flat structure:

```
    {
        catalog_meta1: ...,
        catalog_meta2: ...,
        dataset_meta1: ...,
        <level>_<meta_key>: <meta_value>
        ...
    }
```
