


# s3 method to convert RasterLayer to grid
as.grid.RasterLayer <- function(x, ...){
  if(!isTRUE(all.equal(raster::xres(x), raster::yres(x))))
    stop("Cells are not square. Cannot convert to grid")
  m <- matrix(raster::values(x), nrow = raster::nrow(x), ncol = raster::ncol(x),
              byrow = TRUE)
  result <- list(m = m, xll =  raster::xmin(x) , yll = raster::ymin(x), 
                 nrow = raster::nrow(x), ncol = raster::ncol(x), 
                 cellsize = raster::xres(x))
  class(result) <- c("grid", class(result)) 
  return(result)
}

# s3 method to convert part of a rasterStack to a grid
as.grid.RasterStack <- function(x, layer, ... ){
  if(!isTRUE(all.equal(raster::xres(x), raster::yres(x))))
    stop("Cells are not square. Cannot convert to grid.")
  if(layer < 1 | layer > raster::nlayers(x)) 
    stop("layer is out of range. It should refer to one of the layers in x.")
  if(length(layer) != 1) 
    stop("A grid can only contain one layer.")

  m <- matrix(raster:values(x)[, layer ], nrow = raster::nrow(x),
              ncol = raster::ncol(x), byrow = TRUE)
  e <- extent(x)
  result <- list(m = m, xll =  raster::xmin(x) , yll = raster::ymin(x), 
                 nrow = raster::nrow(x), ncol = raster::ncol(x), 
                 cellsize = raster::xres(x))
  class(result) <- c("grid", class(result))
  return(result)
}
