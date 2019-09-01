# 3S
Stream Sediment Samples (3S)

[![DOI](https://zenodo.org/badge/118207344.svg)](https://zenodo.org/badge/latestdoi/118207344)

## Introduction
This repository deals with analyzing Stream Sediment Samples (3S) which are known as one of the important sample types which are used for mineral prospecting in preliminary stages of geochemical exploration.
The codes available here are as follows:

* ilr Transformation
* Catchment Basin Median (CB_Median)
* Weighted Drainage Catchment Basin (WDCB)

## Usage

### ilr transformation
The input data to many statistical techniques like factor analysis are required to follow a normal or symmetric distribution. The Stream sediment geochemical data are categorized as the compositional data and they represent a closed number system. In this system, individual variables are not independent and they are parts of a whole. Log-ratio transformations are suggested to be applied on the data prior to the factor analysis through opening the close range of variation. Different transformation methods have been discussed before to reach symmetric distributions from primary geochemical data. According to Filzmoser et al. (2009), isometric log-ratio (ilr) transformation involves some theoretical advantages over other log-ratio transformations for statistical analysis of the geochemical data.

The input variable *A* to the transformation code is an m by n matrix that m equals the number of samples and n equals the number of elements which have been analyzed. Each array in this matrix is the concentration value of a specific element. The output of "ilr_Univariate" code *C* provides the normalized data for univariate analysis, and the output of "ilr_Multivariate" code *B* provides the normalized data for multivariate analysis.

### Catchment Basin Median (CB_Median)
This code calculates the median of a geochemical parameter which has been assigned to stream sediment samples within each catchment basin. It is noteworthy that the geochemical parameter values are taken to the fuzzy space before calculating the median using logistic function.

The input variable *A* to this code has to be prepared in three columns or more (m by n). The number of rows (m) in the input matrix equals the number of samples. The first and second columns are respectively Catchment Basin ID and Point ID. The third column to the last (n) include geochemical parameters which have been assigned to each point. The output matrix which includes the median of the intended fuzzy geochemical parameters within each catchment basin is called *CB_Median_Mat*. The number of rows in that equals the number of catchment basins. The first and second columns are respectively Basin ID and number of samples in each catchment basin. The third column to the column n are respectively the median calculated for each catchment basin according to the geochemical parameter which has been assigned to the sampling points in equivalent column of the input matrix.

### Weighted Drainage Catchment Basin (WDCB)
This is a discrete mapping approach which has been proposed by Yousefi et al. (2013) to delineate geochemical anomalies in a regional scale. The WDCB approach is applied to weigh catchment basins according to the geochemical parameters which have been assigned to stream sediment samples collected within each catchment basin. These parameters can be concentration values of different elements, factor scores determined by factor analysis on a set of elements or any other parameters which deal with the initial concentration values of the elements measured for each stream sediment sample.

The input variable *A* to this code has to be prepared in three columns or more (m by n). The number of rows (m) in the input matrix equals the number of samples. The first and second columns are respectively Catchment Basin ID and Point ID. The third column to the last (n) include geochemical parameters which have been assigned to each point. The output matrix which includes the weights and their fuzzy equivalents is called *WDCB_Mat*. The number of rows in that equals the number of catchment basins. The first and second columns are respectively Basin ID and number of samples in each catchment basin. The third column to the column n are respectively the weights calculated for each catchment basin according to the geochemical parameter which has been assigned to the sampling points in equivalent column of the input matrix. The column n to the last show the fuzzy equivalent of the columns 3 to n respectively.

## References
Farahbakhsh, E., Chandra, R., Eslamkish, T., Muller, R. D., 2019, Modeling geochemical anomalies of stream sediment data through a weighted drainage catchment basin method for detecting porphyry Cu-Au mineralization, *Journal of Geochemical Exploration* 204, 12-32

Filzmoser, P., Hron, K., Reimann, C., 2009, Univariate statistical analysis of environmental (compositional) data: Problems and possibilities, *Science of The Total Environment*, 407(23), 6100-6108

Yousefi, M., Carranza, E. J. M., Kamkar-Rouhani, A., 2013, Weighted drainage catchment basin mapping of geochemical anomalies using stream sediment data for mineral potential modeling, *Journal of Geochemical Exploration*, 128, 88-96
