checkcellalignment <- function(x, y){
  #------------------------------------------------------------------------------------------------#
  # checkcellalignment                  Ethan Plunkett                                January 12, 2016
  #  This function checks to see if the individual cell corners of two grids aline.  The extents don't 
  #   have to match or even overlap.  It throws an error if the two grids have different alignments.
  #  Very slight differences are permitted to allow for rounding error; see all.equal for 
  #   tolerances.
  #  Previously this code was duplicated in matchextent, gridintersect, and overlay
  # 
  #------------------------------------------------------------------------------------------------#
  if(!isTRUE(all.equal(x$cellsize, y$cellsize)))
    stop("Cellsize of x and y must match.")
  # Note: I check in both directions because it's possible to have the remainder be almost the cellsize instead of almost zero when 
  #   the cell size isn't an integer.
  if(!isTRUE(all.equal( (x$xll - y$xll) %% x$cellsize, 0 )) && !isTRUE(all.equal( (y$xll - x$xll) %% x$cellsize, 0 ))) 
    stop("Grids are misaligned in the x direction")
  if(!isTRUE(all.equal( (x$yll - y$yll) %% x$cellsize, 0 ))  && !isTRUE(all.equal( (y$yll - x$yll) %% x$cellsize, 0 )))
    stop("Grids are misaligned in the y direction")
  return(TRUE)
}