# Convert raster object (from ras)
if(FALSE){
  
 
  library(gridio)
  library(raster)
  
  
  ### Setup a temporary directory with a sample grid in it 
  # Get path to example dem grid (included with package)
  require(gridio)
  datapath <- system.file("exampledata", package="gridio")  # grid path to example grid
  datapath <- shortPathName(datapath)
  datapath <- paste(datapath, "/.", sep="")
  
  # Make a temporary directory to write new grids to
  dir <- tempdir() # get temporary directory
  if(!file.exists(dir)) dir.create(dir)
  
  # Copy example data into temporary directory
  file.copy(datapath, dir, recursive=TRUE)
  # system(paste("open", dir)) # if you want to look at contents of temporary directory
  ###  Done setting up directory
  
  # Setup paths
  dem <- paste(dir, "/dem", sep="") # path to dem file.
  
  # initialize
  cleanup() # disconnect from any prior gridservers 
  gridinit()
  setwindow(dem) # setwindow to dem file
  
  ### End Setup ###
  
  
  # Read a grid
  g <- readgrid(dem)
  plot(g, use.old = T)  
  
  # convert to raster
  r <- raster(g)
  plot(r)
  
  # convert to grid
  g2 <- as.grid(r)
  plot(g2)  
  
  # convert raster into raster stack
  s <- stack(r, r)
  
  # convert 2nd layer in stack back to grid
  g3 <- as.grid(s, 2)
  plot(g3)
  
  
}


# raster <- function(x) UseMethod("raster")

# raster.grid <- function(x){
#   raster(x = x$m, xmn=x$xll, xmx=x$xll + x$cellsize * x$ncol, ymn=x$yll, ymx= x$yll + x$cellsize * x$nrow, crs=NA, template=NULL)
#  }

# 
setOldClass(Classes = "grid")

setMethod("raster", signature(x = "grid"), function(x) {
  raster(x = x$m, xmn=x$xll, xmx=x$xll + x$cellsize * x$ncol, ymn=x$yll, ymx= x$yll + x$cellsize * x$nrow, crs=NA, template=NULL)
})
