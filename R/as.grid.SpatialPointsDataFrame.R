asgrid.SpatialPointsDataFrame <-
function(x, data.col=1, ...){
 sp::gridded(x) <- TRUE
 asgrid(x, data.col=data.col, ...)
}

