# s3 method to convert SpatRaster to grid

if(FALSE){
  # example
  library(terra)
  f <- system.file("ex/elev.tif", package="terra")
  r <- rast(f)
  as.grid(r)

}

as.grid.SpatRaster <- function(x, ...){
    if(!isTRUE(all.equal(terra::xres(x), terra::yres(x))))
      stop("Cells are not square. Cannot convert to grid")
    m <- matrix(terra::values(x), nrow = terra::nrow(x), ncol = terra::ncol(x),
                byrow = TRUE)
    result <- list(m = m, xll =  terra::xmin(x) , yll = terra::ymin(x),
                   nrow = terra::nrow(x), ncol = terra::ncol(x),
                   cellsize = terra::xres(x))
    class(result) <- c("grid", class(result))
    return(result)
  }
