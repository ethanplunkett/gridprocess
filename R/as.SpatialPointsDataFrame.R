as.SpatialPointsDataFrame <- 
function(x) { 
# as.SpatialPointsDataFrame   Ethan Plunkett   January 2011
# This function converts from an object of class "grid" to 
# an object of class "SpatialPointsDataFrame"
  z <- as.numeric(x$m)
  
  # Create vectors of the centers of each row or column of cells
  xvals <- x$xll + (0:(x$ncol-1)+0.5) * x$cellsize
  yvals <- x$yll +  x$nrow * x$cellsize - (0:(x$nrow-1)+0.5) * x$cellsize
  
  result <- data.frame(x=rep(xvals, each=length(yvals)) , y=rep(yvals,length(xvals)), z=z)
  sp::coordinates(result) <- ~x+y
  result
}

