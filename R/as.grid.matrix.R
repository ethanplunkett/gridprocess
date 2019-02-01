as.grid.matrix <- function(x, xll, yll, cellsize, ...){
  # as.grid.matrix  Ethan Plunkett   March 13, 2012
  # function to convert a matrix object into a grid object
  # Arguments :
  #   x : a numerical matrix
  #   xll, yll : the x and y coordinates of the lower left corner of the lower left cell 
  #   cellsize : the size of the cells in the 
  #   ...  : other arguments used by other methods - required for generic method dispach
  #  Note  xll, yll, and cellsize are all in the projection of your choice.  gridio is ignorant of
  #   projections. 
  result <- list(m=x,  xll=xll, yll=yll, nrow=nrow(x), ncol=ncol(x), cellsize=cellsize)
  class(result) <- c("grid", class(result))
  return(result)
}


# Example call
# mat <- matrix(1:12, 3, 4)
# g <- as.grid(mat, xll=0, yll=0, cellsize=30)

