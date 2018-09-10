# Integrate API in a spreadsheet

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
 

- [Google Drive](#google-drive)
    - [1. Modify regional configuration](#1-modify-regional-configuration)
    - [2. Import data to the spreadsheet](#2-import-data-to-the-spreadsheet)
    - [3. Choose date format](#3-choose-date-format)
    - [4. Modify API call URL](#4-modify-api-call-url)
- [Excel](#excel)
    - [1. Generate a query from URL](#1-generate-a-query-from-url)
    - [2. Edit original file codification](#2-edit-original-file-codification)
    - [3. Edit column types](#3-edit-column-types)
    - [4. Modify regional configuration](#4-modify-regional-configuration)
    - [5. Save modifications and load the query](#5-save-modifications-and-load-the-query)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Google Drive

### 1. Modify regional configuration

API generates CSV files using “.” as a decimal character. You should choose "United States" regional configuration so Google Spreadsheet reads properly the file, or any other compatible region.

Alternatively, you can ask the API to change the decimal character using [`decimal`](reference/api_reference.md#decimal) parameter.

![](assets/google_drive_letra_1.png)
<br><br>
![](assets/google_drive_letra_2.png)
<br><br>
![](assets/google_drive_letra_3.png)

### 2. Import data to the spreadsheet

`IMPORTDATA()` function takes the API call URL and gets data to the spreadsheet.

![](assets/google_drive_letra_4.png)
<br><br>
![](assets/google_drive_letra_5.png)

### 3. Choose date format

Time index can be seen as a number first time data is imported. You can select the entire column and choose the format to visualize date values.

![](assets/google_drive_letra_6.png)
<br><br>
![](assets/google_drive_letra_7.png)
<br><br>
![](assets/google_drive_letra_8.png)

### 4. Modify API call URL

Once you have imported a table for the first time, you can modify parameters to change the query. The table will be updated each time.

![](assets/google_drive_letra_9.png)
<br><br>
![](assets/google_drive_letra_10.png)
<br><br>
![](assets/google_drive_letra_11.png)

## Excel

### 1. Generate a query from URL

“Data" > "New query" > “From other sources" > “From web”

![](assets/excel_letra_1.png)
<br><br>
![](assets/excel_letra_2.png)
<br><br>
![](assets/excel_letra_3.png)
<br><br>
![](assets/excel_letra_4.png)

### 2. Edit original file codification

API generates CSV files using "Unicode UTF-8" encoding, which is not default in Excel. Click in "Origin" > "File origin" > Choose "Unicode UTF-8".

![](assets/excel_letra_5.png)
<br><br>
![](assets/excel_letra_6.png)
<br><br>
![](assets/excel_letra_7.png)

### 3. Edit column types

Excel can read wrong column types if the decimal separator is not ".". You should use advanced editor to correct column data types. (You can also use [`decimal`](reference/api_reference.md#decimal) parameter to change the decimal separator)

* “indice_tiempo” column data type should be “type date”
* Rest of the columns, (containing series) should be “type number”

![](assets/excel_letra_8.png)
<br><br>
![](assets/excel_letra_9.png)
<br><br>
![](assets/excel_letra_10.png)
<br><br>
![](assets/excel_letra_11.png)

### 4. Modify regional configuration

In the same advanced editor, regional configurations should be changed at the end to be “en-US” and accepts “.” as a decimal separator (unless [`decimal`](reference/api_reference.md#decimal) parameter is used).

![](assets/excel_letra_12.png)
<br><br>
![](assets/excel_letra_13.png)

### 5. Save modifications and load the query

For last, you can click in “Close and load" and the query will be configured in an Excel table that can be updated.

![](assets/excel_letra_14.png)
