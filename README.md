# gridprocess

This package defines a super simple "grid" object whithin which raster data
is stored as a matrix, it also contains functions for converting between raster,
and sp objects and grid objects, and functions for processing grid objects. 

This is an offshoot of an older package [(gridio)](https://bitbucket.org/eplunkett/gridio/src/master/) which contains 
functions for  reading and writing to ESRI grids and gradually also 
accumulated functions that process grids in various ways.  That package relies 
on an ESRI .dll that is no longer well supported.  It is my intent to migrate
the functions that do not depend on that dll  to this package.

gridprocess contains a function (spread) for calculating resistant kernels 
that I don't believe is available for R elsewhere.  It will also eventaully
contain functions for non-resistant kernels that include correction 
for NA values and for identifying patches.


## Installation

This package contains a pre-compiled windows dll (32 and 64 bit) so currently 
only works on windows. 

Use the code below to install gridprocess
 [github](https://github.com/ethanplunkett/gridprocess).
``` r
devtools::install_github("ethanplunkett/gridprocess")

```
