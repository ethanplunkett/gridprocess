# Convert SpatRaster object (terra::rast)
if(FALSE){


  library(terra)


  ### Setup a temporary directory with a sample grid in it
  # Get path to example dem grid (included with package)
  datapath <- system.file("exampledata", package="gridio2")  # grid path to example grid
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
  dem <- paste(dir, "/dem.tif", sep="") # path to dem file.

  # Read with terra
  r <- terra::rast(dem)

  g <- as.grid(r)


  # convert to raster
  r2 <- rast(g)
  plot(r2)

  # convert to grid
  g2 <- as.grid(r)
  plot(g2)


}


# raster <- function(x) UseMethod("raster")

# raster.grid <- function(x){
#   raster(x = x$m, xmn=x$xll, xmx=x$xll + x$cellsize * x$ncol, ymn=x$yll, ymx= x$yll + x$cellsize * x$nrow, crs=NA, template=NULL)
#  }

#
setOldClass(Classes = "grid")

setMethod("rast", signature(x = "grid"), function(x) {
  e <- terra::ext(c(x$xll,  x$xll + x$cellsize * x$ncol, x$yll, x$yll + x$cellsize * x$nrow))
  terra::rast(x = x$m, extent = e)
})
