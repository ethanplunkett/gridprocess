asgrid.SpatialPixelsDataFrame <-
function(x, data.col=1, ...){
  x <- as(x,"SpatialGridDataFrame")
  asgrid(x, data.col=data.col, ...)
}

