
y2r <- function(y, list, cellsize=list$cellsize, yll=list$yll, nrow=list$nrow) ceiling( nrow -  (y-yll)/cellsize )
