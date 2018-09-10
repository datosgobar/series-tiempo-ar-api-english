# API reference: series

Endpoint: `/series`

The `/series` endpoint allows **obtaining data and metadata** of one or more series, filtering by the time index, changing temporal aggregation and changing units, between other operations.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
 

- [Tabla de parámetros](#tabla-de-parametros)
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

## Table of parameters

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

Available transformation functions in [`representation_mode`](#representation_mode) can also be specified for **individual series** usring `:percent_change` notation, together with series id:

!!! note "[EMAE Construcción. Variación porcentual de valores mensuales, respecto del período anterior.](http://datos.gob.ar/series/api/series/?ids=11.3_VMATC_2004_M_12:percent_change)"
    [`https://apis.datos.gob.ar/series/api/series/?limit=1000&ids=11.3_VMATC_2004_M_12:percent_change`](https://apis.datos.gob.ar/series/api/series/?limit=1000&ids=11.3_VMATC_2004_M_12:percent_change)

!!! note "[EMAE Construcción (variación porcentual período a período), EMAE Construcción (variación porcentual interanual). Valores mensuales.](http://datos.gob.ar/series/api/series/?ids=11.3_VMATC_2004_M_12:percent_change,11.3_VMATC_2004_M_12:percent_change_a_year_ago)"
    [`https://apis.datos.gob.ar/series/api/series/?limit=1000&ids=11.3_VMATC_2004_M_12:percent_change,11.3_VMATC_2004_M_12:percent_change_a_year_ago`](https://apis.datos.gob.ar/series/api/series/?limit=1000&ids=11.3_VMATC_2004_M_12:percent_change,11.3_VMATC_2004_M_12:percent_change_a_year_ago)

El parámetro [`representation_mode`](#representation_mode) seguirá afectando a todas las series para las cuales no se especifique individualmente una función de transformación.

### `collapse`

El parámetro [`collapse`](#collapse) modifica la frecuencia de muestreo de los datos de la serie o las series solicitadas. Debe usarse en combinación con [`collapse_aggregation`](#collapse_aggregation) para indicar una funnción de agregación temporal, cuando corresponda.

Las opciones disponibles son:

* *year*: Muestra datos agregados anualmente.
* *quarter*: Muestra datos agregados trimestralmente.
* *month*: Muestra datos agregados mensualmente.
* *week*: Muestra datos agregados semanalmente.
* *day*: Muestra datos agregados diariamente.

Si no se indica, se retornan los datos con la **frecuencia original de la serie**.

Si se solicitan **múltiples series de distintas frecuencias**, se utilizará la menor frecuencia de todas ellas (Ej.: si se solicitan a la vez una serie diaria, una mensual y una trimestral, se convertirán todas las series a la frecuencia trimestral).

Si la granularidad temporal solicitada en el valor de [`collapse`](#collapse) es menor a la granularidad propia de alguna de las series solicitadas, la consulta devolverá un error.

El parámetro [`collapse`](#collapse) afecta globalmente a todas las series seleccionadas por el parámetro [`ids`](#ids) en la llamada.

### `collapse_aggregation`

El parámetro [`collapse_aggregation`](#collapse_aggregation) indica la función de agregación temporal que debe usarse para homogeneizar la frecuencia temporal de todas las series solicitadas (Ej.: qué operación realizar para convertir una serie mensual en anual).

Esta función de agregación actuará sobre:

* Las series agrupadas de mayor granularidad temporal (frecuencia más alta) que la granularidad indicada por el parámetro [`collapse`](#collapse)
* En caso de que no se especifique el parámetro [`collapse`](#collapse), las series agrupadas de mayor granularidad temporal que la de la serie de menor frecuencia temporal.

Los valores disponibles para el parámetro son:

* *avg*: Realiza el promedio de todos los valores agrupados. Es la opción por defecto si no se indica valor para [`collapse_aggregation`](#collapse_aggregation).
* *sum*: Suma todos los valores agrupados.
* *end_of_period*: Último valor del período.
* *min*: Mínimo entre los valores agrupados.
* *max*: Máximo entre los valores agrupados.

Las funciones de agregación temporal disponibles en [`collapse_aggregation`](#collapse_aggregation) también pueden especificarse para **series individuales** usando la notación `:sum` junto al id de la serie:

!!! note "[Cobro de servicios de turismo y viajes. Valores mensuales promediados y sumados por año.](http://datos.gob.ar/series/api/series/?ids=185.1_COBRO_SERVJES_0_M_30:avg,185.1_COBRO_SERVJES_0_M_30:sum&collapse=year)"

    [`https://apis.datos.gob.ar/series/api/series/?ids=185.1_COBRO_SERVJES_0_M_30:avg,185.1_COBRO_SERVJES_0_M_30:sum&collapse=year`](https://apis.datos.gob.ar/series/api/series/?ids=185.1_COBRO_SERVJES_0_M_30:avg,185.1_COBRO_SERVJES_0_M_30:sum&collapse=year)

El parámetro [`collapse_aggregation`](#collapse_aggregation) seguirá afectando a todas las series para las cuales no se especifique individualmente una función de agregación temporal.

!!! note "[Cobro de servicios de turismo y viajes. Valores mensuales promediados y sumados por año.](http://datos.gob.ar/series/api/series/?ids=185.1_COBRO_SERVJES_0_M_30:avg,185.1_COBRO_SERVJES_0_M_30&collapse=year&collapse_aggregation=sum)"

    [`https://apis.datos.gob.ar/series/api/series/?ids=185.1_COBRO_SERVJES_0_M_30:avg,185.1_COBRO_SERVJES_0_M_30&collapse=year&collapse_aggregation=sum`](https://apis.datos.gob.ar/series/api/series/?ids=185.1_COBRO_SERVJES_0_M_30:avg,185.1_COBRO_SERVJES_0_M_30&collapse=year&collapse_aggregation=sum)

### `limit`

Este parámetro es utilizado junto a [`start`](#start) para controlar el paginado de los resultados devueltos por la API. Debe especificarse un número entero positivo, no mayor que 1000, ya que esa es la cantidad máxima de resultados devueltos por la API. El valor por defecto si no se especifica valor alguno es 100.

### `start`

Este parámetro es utilizado junto a [`limit`](#limit) para controlar el paginado de los resultados devueltos por la API. Debe especificarse un número entero positivo o 0. El valor por defecto si no se especifica valor alguno es 0.

El [`start`](#start) indica el "número de períodos después de [`start_date`](#start_date)" (o el "número de períodos antes de [`end_date`](#end_date)", dependiendo del ordenamiento *asc* o *desc* del parámetro [`sort`](#sort)) que se saltean desde el comienzo o el final de la serie antes de empezar a devolver valores.

### `start_date`

El parámetro [`start_date`](#start_date) indica la fecha menor a partir de la cual se comenzarán a recolectar datos para la respuesta. Los valores cuyo índice de tiempo coincida con el valor de [`start_date`](#start_date) se incluirán en el resultado retornado. Se utilizará como filtro sobre el índice de tiempo de las series de datos.

### `end_date`

El parámetro [`end_date`](#end_date) indica la fecha mayor hasta la cual se recolectarán datos para la respuesta. Los valores cuyo índice de tiempo coincida con el valor de [`end_date`](#end_date) se incluirán en el resultado retornado. Se utilizará como filtro sobre el índice de tiempo de las series de datos.

### `format`

Especifica el formato de la respuesta, siendo *json* el valor por defecto.

Las opciones disponibles son:

* *json*: Devuelve un objeto json con datos y metadatos de las series.
* *csv*: Devuelve las series seleccionadas en formato separado por comas. Este tipo de formato no incluye metadatos de las series seleccionadas.

### `header`

Especifica los atributos de las series a utilizar como *headers* (cabeceras) de las columnas del archivo CSV generado. Por defecto usa *titles*, que son los títulos de las series.

Las opciones disponibles son:

* *titles*: Títulos de las series, por ejemplo **oferta_global_pib** (default).
* *ids*: Identificadores únicos de las series, los mismos pasados al parámetro `ids`.
* *descriptions*: Descripciones completas de las series, por ejemplo **Plazo fijo entre 60-89 días en millones de pesos. Categoría II-VI**

### `sort`

Especifica el orden temporal de los resultados devueltos, siendo *asc* el valor por defecto.

Las opciones disponibles son:

* *asc*: Se devuelven los valores más antiguos primero (default).
* *desc*: Se devuelven los valores más recientes primero.

### `metadata`

Especifica el nivel de detalle de metadatos requerido por el usuario, siendo *simple* el valor por defecto. Sólo aplica cuando `format=json`.

Las opciones disponibles son:

* *none*: No se devuelven metadatos, sólo datos.
* *only*: No se devuelven datos, sólo metadatos.
* *simple*: Se devuelven los metadatos más importantes para comprender y utilizar las series (default).
* *full*: Se devuelven todos los metadatos disponibles que tengan relación con cada serie.

### `decimal`

Especifica el caracter utilizado para los números decimales, siendo *.* el valor por defecto. Sólo aplica cuando `format=csv`.

Las opciones disponibles son:

* *,*: Coma.
* *.*: Punto.

### `sep`

Especifica el caracter separador de valores, siendo *,* el valor por defecto. Sólo aplica cuando `format=csv`.

Se puede utilizar cualquier caracter UTF-8, si bien se recomienda preservar el uso de la coma en la mayoría de los casos.

### `flatten`

Especifica si la respuesta de los metadatos de las series pedidas deberían devolverse en una jerarquía _plana_.

Cuando el parámetro no es incluido, la respuesta tiene la siguiente estructura:

```
    {
        "catalog": [<catalog_meta>],
        "dataset": [<dataset_meta>],
        "distribution": [<distribution_meta>],
        "field": [<field_meta>],
    }
```

Una consulta con parámetro `flatten` incluido tendrá la siguiente respuesta de metadatos:

```
    {
        catalog_meta1: ...,
        catalog_meta2: ...,
        dataset_meta1: ...,
        <nivel>_<meta_key>: <meta_value>
        ...
    }
```
