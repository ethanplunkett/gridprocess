match.extent <- function(x, y){
	warning('"match.extent" is depreciated please use "matchextent instead')
	return(matchextent(x, y))
}


matchextent <- function(x,y){
  #------------------------------------------------------------------------------------------------#
  # Ethan Plunkett    2011
  # Function to clip (or expand) the extent of x to match that of y (x must be a grid) y can be a 
  # grid or any other list containing the grid alignment info. Each cell's position relative to the 
  # projection is maintained.
  # 
  # Changes:
  #  March 5, 2012 - Replaced "==" with "isTRUE(all.equal("
  #  March 8, 2012 - Cleaned row indexing code
  #  January 12, 2016 - More complicated x alignment check triggered b/c  (x$xll - y$yll) 
  #    was slightly smaller than n times the cellsize.  Thus the remainder when dividing
  #   by the sellsize was basically the cellsize instead of 0.  Switching the order makes the difference 
  #    ever so slightly bigger than an even multiple of the cellsize and the remainder ends up zero.
  # 
  #------------------------------------------------------------------------------------------------#
  
  checkcellalignment(x, y)

  # Note these are cell centers
  x.xrange <- c2x(c(1, x$ncol), x)
  y.xrange <- c2x(c(1, y$ncol), y)
  x.yrange <- r2y(c(x$nrow, 1), x)
  y.yrange <- r2y(c(y$nrow, 1), y)

  # Check to make sure they overlap
  overlap <- function(a, b) ( max(a[1],b[1]) <= min(a[2], b[2])) 
  if(!overlap(x.xrange, y.xrange) || !overlap(x.yrange, y.yrange)) stop("The grid extents don't overlap at all.")

  # calculate the range of the overlap
  xrange <- c(max(x.xrange[1], y.xrange[1]), min(x.xrange[2], y.xrange[2]))
  yrange <- c(max(x.yrange[1], y.yrange[1]), min(x.yrange[2], y.yrange[2]))

  # Make a new empty grid
  xnew <- list(m=matrix(NA, y$nrow, y$ncol), nrow=y$nrow, ncol=y$ncol, xll=y$xll, yll=y$yll, cellsize=y$cellsize)
  class(xnew) <- c("grid", class(xnew))

  
  #  Copy the values over where they overlap
  xnew$m[y2r(yrange[2], y):y2r(yrange[1], y),x2c(xrange[1], y):x2c(xrange[2], y)] <- 
	    x$m[y2r(yrange[2], x):y2r(yrange[1], x),x2c(xrange[1], x):x2c(xrange[2], x)]
	

  return(xnew)
}

