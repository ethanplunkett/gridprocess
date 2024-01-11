# gridprocess

This package defines a super simple "grid" object within which raster data
is stored as a matrix.  It contains functions for converting between 
SpatRaster (see `terra::rast`) and grid objects.

This is an offshoot of an older package 
[(gridio)](https://bitbucket.org/eplunkett/gridio/src/main/) which contains 
functions for  reading and writing to ESRI grids and gradually also 
accumulated functions that process grids in various ways.  That package relies 
handles reading and writing in parallel but has a complex set of dependencies
that makes it non-portable.  

gridprocess contains a function (spread) for calculating resistant kernels 
that I don't believe is available for R elsewhere.


## Installation

This package contains a pre-compiled windows dll (32 and 64 bit) so currently 
only works on windows. 

Use the code below to install gridprocess
 [github](https://github.com/ethanplunkett/gridprocess).
``` r
devtools::install_github("ethanplunkett/gridprocess")

```
