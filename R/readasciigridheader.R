readasciigridheader <-
function(path){
#-----------------------------------------------------------------
#Ethan PlunkettFeb 15, 2007
#readasciigridheader  - reads in ascii.grid.header information
#this is called by read.asci.grid
#modified slightly Jan 2010 to conform to capslib nomenclature
#-----------------------------------------------------------------
header <- readLines(path, n=6)# note this is a local variable NOT the global header variable.
header <- strsplit(header, " +") ## split based on whitespace in header
ncol <- as.integer(header[[1]][2])
nrow <- as.integer(header[[2]][2])
xll <- as.double(header[[3]][2])
yll <- as.double(header[[4]][2])
cellsize <- as.double(header[[5]][2])
na.value <- as.double(header[[6]][2])
result <- list(xll=xll, yll=yll, nrow=nrow, ncol=ncol,  cellsize=cellsize,na.value = na.value)
return(result)
} #end ascii.grid.header funtion def

