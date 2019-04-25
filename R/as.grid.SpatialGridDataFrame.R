as.grid.SpatialGridDataFrame <-
function(x, data.col=1, ...){
  m <- t(as.matrix(x[data.col]))
  cellsize <- x@grid@cellsize
  if(cellsize[1] != cellsize[2]) 
    stop("This spatial object doesn't have square cells and cannot be ",
         "converted to a grid.")
  cellsize <- cellsize[1]
  xll <- as.numeric(x@grid@cellcentre.offset[1] - 0.5 * cellsize)
  yll <- as.numeric(x@grid@cellcentre.offset[2] - 0.5 * cellsize)
  ncol <- as.integer(x@grid@cells.dim[1])
  nrow <- as.integer(x@grid@cells.dim[2])
  g <- list(m=m,  xll=xll, yll=yll, nrow=nrow, ncol=ncol, cellsize=cellsize)
  class(g) <- c("grid", class(g))
  return(g)
}

