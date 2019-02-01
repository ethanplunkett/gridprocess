write.ascii.grid <- function(...){
	warning("write.ascii.grid is depreciated. please use writeasciigrid instead")
	writeasciigrid(...)
}

writeasciigrid <-
function(grid, path, na.value=-9999) {
#----------------------------------------------------------------
#  writeasciigrid    Ethan Plunkett Feb 15 2007
#  
#  Write a grid to an ascii.grid 
#  Modified Jan 2011 - to conform to "grid" class of objects
#  
#  Arguments : 
#    grid : an object of class "grid"
#    path : the location to write the grid.  This is relative
#      to the current working directory NOT the directory set
#      by gridinit.
#    na.value : NA's are replaced with this value in the 
#      written file.
#----------------------------------------------------------------
  grid$m[is.na(grid$m)] <- na.value
  write(paste('ncols         ', grid$nrow, sep=''), file=path, append=FALSE, sep='')
  write(paste('nrows         ', grid$ncol, sep=''), file=path, append=TRUE, sep='')
  write(paste('xllcorner     ', grid$xll, sep=''), file=path, append=TRUE, sep='')
  write(paste('yllcorner     ', grid$yll, sep=''), file=path, append=TRUE, sep='')
  write(paste('cellsize      ', grid$cellsize, sep=''), file=path, append=TRUE, sep='')
  write(paste('NODATA_value  ', na.value, sep=''), file=path, append=TRUE, sep='')
  write(t(grid$m), file=path, ncolumns=ncol(grid$m), append=TRUE, sep=' ')
}

