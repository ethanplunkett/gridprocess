as.grid.SpatialPointsDataFrame <-
function(x, data.col=1, ...){
 sp::gridded(x) <- TRUE
 as.grid(x, data.col=data.col, ...)
}

