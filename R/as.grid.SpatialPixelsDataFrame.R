as.grid.SpatialPixelsDataFrame <-
function(x, data.col=1, ...){
  x <- as(x,"SpatialGridDataFrame")
  as.grid(x, data.col=data.col, ...)
}

