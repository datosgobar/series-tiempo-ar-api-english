# API reference: search

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
 

- [Parameters](#parameters)
    - [`q`](#q)
    - [`dataset_theme`, `units`, `dataset_publisher_name`, `dataset_source`, `catalog_id`](#dataset_theme-units-dataset_publisher_name-dataset_source-catalog_id)
    - [`limit`](#limit)
    - [`start`](#start)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

Endpoint: `/search`

`/search` endpoint allows to look for series using a string, being able to filter results with other attributes (ie.: by theme or units).

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
        <td>q</td>
        <td>Yes</td>
        <td>String</td>
        <td>N/A</td>
        <td>q=ipc</td>
    </tr>
    <tr>
        <td>dataset_theme</a></td>
        <td>No</td>
        <td>One of the listed values in <a href="https://apis.datos.gob.ar/series/api/search/dataset_theme">/search/dataset_theme</a></em></td>
        <td>N/A</td>
        <td>dataset_theme="Finanzas Públicas"</td>
    </tr>
    <tr>
        <td>units</a></td>
        <td>No</td>
        <td>One of the listed values in <a href="https://apis.datos.gob.ar/series/api/search/field_units">/search/field_units</a></td>
        <td>N/A</td>
        <td>units="Millones de pesos"</td>
    </tr>
    <tr>
        <td>dataset_publisher_name</a></td>
        <td>No</td>
        <td>One of the listed values in <a href="https://apis.datos.gob.ar/series/api/search/dataset_publisher_name">/search/dataset_publisher_name</a></td>
        <td>N/A</td>
        <td>dataset_publisher_name="Subsecretaría de Programación Macroeconómica."</td>
    </tr>
    <tr>
        <td>dataset_source</a></td>
        <td>No</td>
        <td>One of the listed values in <a href="https://apis.datos.gob.ar/series/api/search/dataset_source">/search/dataset_source</a></td>
        <td>N/A</td>
        <td>dataset_source="Ministerio de Hacienda"</td>
    </tr>
    <tr>
        <td>catalog_id</a></td>
        <td>No</td>
        <td>One of the listed values in <a href="https://apis.datos.gob.ar/series/api/search/catalog_id">/search/catalog_id</a></td>
        <td>N/A</td>
        <td>catalog_id="sspm"</td>
    </tr>
    <tr>
        <td>limit</a></td>
        <td>No</td>
        <td>Positive integer, not greater than 1000.</td>
        <td class="s4" dir="ltr">10</td>
        <td>limit=50</td>
    </tr>
    <tr>
        <td>start</a></td>
        <td>No</td>
        <td>Positive integer or 0.</td>
        <td class="s4" dir="ltr">0</td>
        <td>start=100</td>
    </tr>
</table>

### `q`

String to input for looking in the database. It can be of any long, but is recommended to input one or more key words.

### `dataset_theme`, `units`, `dataset_publisher_name`, `dataset_source`, `catalog_id`

**These parameters can be used as filters in the search results**. When applied, only matching results are shown.

Example: `units=Millones de pesos` will only contain results where units series are in "millones de pesos".

**Valid filtering values for the parameters are specified in auxiliary endpoints of `search` main one** that return a complete list of accepted values in the filters.

Example: [`/search/field_units`](https://apis.datos.gob.ar/series/api/search/field_units/) returns a list of valid values to be used with `units` parameter. Any other option will return an empty list (because there will be no matches). Parameters table have all auxiliary endpoints available.

### `limit`

Parameter used together with [`start`](#start) to control pagination of API call results. Must be a positive integer not greater than 1000. Default value is 100.

### `start`

Parameter used together with [`limit`](#limit) to control pagination of API call results. Must be a positive integer or 0. Default value is 0.

[`start`](#start) parameter indicates the "number of periods after [`start_date`](#start_date)" (or the "number of periods before [`end_date`](#end_date)", depending on *asc* or *desc* sorting criteria specified on [`sort`](#sort) parameter) that should be skipped from beginning or end of the series before staring to return values.
