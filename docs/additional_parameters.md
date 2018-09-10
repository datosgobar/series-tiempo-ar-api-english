# Filter and transform series

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
 

- [Download a table with one or many series](#download-a-table-with-one-or-many-series)
- [Filtering by dates](#filtering-by-dates)
- [Changing temporal aggregation](#changing-temporal-aggregation)
- [Changing temporal aggregation function](#changing-temporal-aggregation-function)
- [Apply transformations](#apply-transformations)
- [Apply transformations and changing the temporal aggregation function in individual series, at the same time](#apply-transformations-and-changing-the-temporal-aggregation-function-in-individual-series-at-the-same-time)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Download a table with one or many series

`ids` parameter allows querying up to **40 series simultaneously**, separated by commas.

!!! note "[PCI by categories](http://datos.gob.ar/series/api/series/?ids=103.1_I2N_2016_M_15,101.1_I2NG_2016_M_22,102.1_I2S_ABRI_M_18,102.1_I2B_ABRI_M_15,103.1_I2R_2016_M_18,103.1_I2E_2016_M_21)"

    [`http://apis.datos.gob.ar/series/api/series/?ids=103.1_I2N_2016_M_15,101.1_I2NG_2016_M_22,102.1_I2S_ABRI_M_18,102.1_I2B_ABRI_M_15,103.1_I2R_2016_M_18,103.1_I2E_2016_M_21&format=csv`](http://apis.datos.gob.ar/series/api/series/?ids=103.1_I2N_2016_M_15,101.1_I2NG_2016_M_22,102.1_I2S_ABRI_M_18,102.1_I2B_ABRI_M_15,103.1_I2R_2016_M_18,103.1_I2E_2016_M_21&format=csv)

## Filtering by dates

`start_date` and `end_date` parameters allow limiting a query to a particular range in time.

!!! note "[Exchange rate since January 2016](http://datos.gob.ar/series/api/series?ids=168.1_T_CAMBIOR_D_0_0_26&start_date=2016-01)"

    [`https://apis.datos.gob.ar/series/api/series?ids=168.1_T_CAMBIOR_D_0_0_26&start_date=2016-01&limit=1000&format=csv`](https://apis.datos.gob.ar/series/api/series?ids=168.1_T_CAMBIOR_D_0_0_26&start_date=2016-01&limit=1000&format=csv)

!!! note "[Exchange rate up to December 2016](http://datos.gob.ar/series/api/series?ids=168.1_T_CAMBIOR_D_0_0_26&end_date=2016-12)"

    [`https://apis.datos.gob.ar/series/api/series?ids=168.1_T_CAMBIOR_D_0_0_26&end_date=2016-12&format=csv`](https://apis.datos.gob.ar/series/api/series?ids=168.1_T_CAMBIOR_D_0_0_26&end_date=2016-12&format=csv)

!!! note "[Exchange rate from January 2016 up to December 2016](http://datos.gob.ar/series/api/series?ids=168.1_T_CAMBIOR_D_0_0_26&start_date=2016-01&end_date=2016-12)"

    [`https://apis.datos.gob.ar/series/api/series?ids=168.1_T_CAMBIOR_D_0_0_26&start_date=2016-01&end_date=2016-12&format=csv`](https://apis.datos.gob.ar/series/api/series?ids=168.1_T_CAMBIOR_D_0_0_26&start_date=2016-01&end_date=2016-12&format=csv)

## Changing temporal aggregation

By default, all series are shown in the highest possible frequency (this is, the lowest frequency between all the series in the query). `collapse` parameter allows to choose a lower frequency than this one.

!!! note "[General, Brasil and China Real Exchange Rate Indexes. Monthly values quarterly averaged.](http://datos.gob.ar/series/api/series/?ids=116.3_TCRMA_0_M_36,116.3_TCRC_0_M_22,116.3_TCRB_0_M_23&collapse=quarter)"

    [`http://apis.datos.gob.ar/series/api/series/?limit=1000&collapse=quarter&ids=116.3_TCRMA_0_M_36,116.3_TCRC_0_M_22,116.3_TCRB_0_M_23&format=csv`](http://apis.datos.gob.ar/series/api/series/?limit=1000&collapse=quarter&ids=116.3_TCRMA_0_M_36,116.3_TCRC_0_M_22,116.3_TCRB_0_M_23&format=csv)

## Changing temporal aggregation function

By default, when the API calculates temporal aggregations (ie. converting a monthly series into a quarterly one) it does an **average of series values in each period**.

This function of aggregation can be changed for all the series in the query using `collapse_aggregation` parameter, or to any individual series without affecting the others (sum, max, min, etc.).

!!! note "[Exchange rate. Daily values a the end of the month.](http://datos.gob.ar/series/api/series/?ids=168.1_T_CAMBIOR_D_0_0_26&collapse=month&collapse_aggregation=end_of_period)"

    [`https://apis.datos.gob.ar/series/api/series?ids=168.1_T_CAMBIOR_D_0_0_26&collapse=month&collapse_aggregation=end_of_period&format=csv`](https://apis.datos.gob.ar/series/api/series?ids=168.1_T_CAMBIOR_D_0_0_26&collapse=month&collapse_aggregation=end_of_period&format=csv)

!!! note "[Exchange rate. Daily values minimum, maximum, average and end of the month.](http://datos.gob.ar/series/api/series/?ids=168.1_T_CAMBIOR_D_0_0_26:min,168.1_T_CAMBIOR_D_0_0_26:avg,168.1_T_CAMBIOR_D_0_0_26:max,168.1_T_CAMBIOR_D_0_0_26:end_of_period&collapse=month)"

    [`https://apis.datos.gob.ar/series/api/series?ids=168.1_T_CAMBIOR_D_0_0_26:min,168.1_T_CAMBIOR_D_0_0_26:avg,168.1_T_CAMBIOR_D_0_0_26:max,168.1_T_CAMBIOR_D_0_0_26:end_of_period&collapse=month&format=csv&limit=1000`](https://apis.datos.gob.ar/series/api/series?ids=168.1_T_CAMBIOR_D_0_0_26:min,168.1_T_CAMBIOR_D_0_0_26:avg,168.1_T_CAMBIOR_D_0_0_26:max,168.1_T_CAMBIOR_D_0_0_26:end_of_period&collapse=month&format=csv&limit=1000)

## Apply transformations

Series can be transformed into different units (percentage variation, year-to-year variation, etc.) individually or for all the query, using `representation_mode` parameter.

!!! note "[Exchange rate, Core PCI and General PCI from January 2016. Percentage variation of monthly values, period to period.](http://datos.gob.ar/series/api/series?ids=168.1_T_CAMBIOR_D_0_0_26,103.1_I2N_2016_M_15,103.1_I2N_2016_M_19&collapse=month&format=csv&start_date=2016-01&representation_mode=percent_change)"

    [`https://apis.datos.gob.ar/series/api/series?ids=168.1_T_CAMBIOR_D_0_0_26,103.1_I2N_2016_M_15,103.1_I2N_2016_M_19&collapse=month&format=csv&start_date=2016-01&representation_mode=percent_change`](https://apis.datos.gob.ar/series/api/series?ids=168.1_T_CAMBIOR_D_0_0_26,103.1_I2N_2016_M_15,103.1_I2N_2016_M_19&collapse=month&format=csv&start_date=2016-01&representation_mode=percent_change)

!!! note "[Core PCI, Core PCI (percentage variation period to period) and Core PCI (percentage variation year to year) from January 2016. Monthly values.](http://datos.gob.ar/series/api/series/?ids=103.1_I2N_2016_M_15,103.1_I2N_2016_M_15:percent_change,103.1_I2N_2016_M_15:percent_change_a_year_ago&start_date=2016-01)"
    *Note: series with different scale units, can be hard to visualize in a single graphic.*

    [`https://apis.datos.gob.ar/series/api/series?ids=103.1_I2N_2016_M_15,103.1_I2N_2016_M_15:percent_change,103.1_I2N_2016_M_15:percent_change_a_year_ago&start_date=2016-01&format=csv&limit=1000`](https://apis.datos.gob.ar/series/api/series?ids=103.1_I2N_2016_M_15,103.1_I2N_2016_M_15:percent_change,103.1_I2N_2016_M_15:percent_change_a_year_ago&start_date=2016-01&format=csv&limit=1000)


## Apply transformations and changing the temporal aggregation function in individual series, at the same time

It is possible to **apply both a transformation and a temporal aggregation function** to any particular series.

In any case, the API will always **apply first the temporal aggregation function** and **then the transformation**.

!!! note "[Exchange rate. Percentage variation of daily values at the end of each month, period to period.](http://datos.gob.ar/series/api/series/?ids=168.1_T_CAMBIOR_D_0_0_26:end_of_period:percent_change&collapse=month)"

    [`http://apis.datos.gob.ar/series/api/series/?limit=1000&collapse=month&ids=168.1_T_CAMBIOR_D_0_0_26:end_of_period:percent_change&format=csv`](http://apis.datos.gob.ar/series/api/series/?limit=1000&collapse=month&ids=168.1_T_CAMBIOR_D_0_0_26:end_of_period:percent_change&format=csv)
