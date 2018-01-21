# 3S
3S stands for Stream Sediment Samples

![Sample WDCB output image](https://goo.gl/uBwG5T)

## Introduction
This repository deals with analysing Stream Sediment Samples (3S) which are known as one of the important sample types used for mineral prospecting in preliminary stages of the geochemical exploration.
The codes available here are as follows:

* Weighted Drainage Catchment Basin (WDCB)

## Usage
### WDCB
This is a discrete mapping approach to delineate geochemical anomalies. WDCB is used to weigh catchment basins according to the geochemical parameters assigned to stream sediment samples collected within each catchment basin. These parameters can be concentration values of different elements, factor scores determined by factor analysis on a set of elements or any other parameters which deals with the initial concentration values of elements measured for each stream sediment sample.
The input file to this code have to be prepared in three columns or more (m by n). Number of rows (m) equals number of samples. First and second columns are respectively "Basin ID" and "Point ID". Third column to the last (n) include geochemical parameters assigned to each point. The output matrix which includes the weights and their fuzzy equivalent is called "Basin". Number of rows equals number of catchment basins. The first and second columns respectively are "Basin ID" and number of samples in each catchemnt basin. The third column to the column n are respectively the weights calculated for each catchment basin according to the geochemical parameter assigned to sampling points in equivalent column of the input matrix. Column n to last show the fuzzy equivalent of the columns 3 to n respectively.
