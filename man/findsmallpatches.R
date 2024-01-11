if(FALSE){
  g <- asgrid(matrix(runif(n = 48)> .7, 6, 8), xll = 0, yll = 0, cellsize = 10)
  plot(g)
  plot(findsmallpatches(g, 3, nr = 8))




}


findsmallpatches <- function (x, maxsize,  nr=8, ... ){
  UseMethod("findsmallpatches")
}

findsmallpatches.grid <- function(x, maxsize, nr=8,  targetclasses = NA){
  patches <- patchscan(x, nr = nr)$patches
  sizes <- table(patches$m)
  small.patches <- as.numeric(names(sizes)[sizes <= maxsize])
  rm(sizes)
  small <- patches
  small$m <- matrix(nrow = small$nrow, ncol = small$ncol, data =  patches$m %in% small.patches )
  rm(patches)

  if(!is.na(targetclasses))
    small$m <- small$m & x$m %in% targetclasses
  return(small)
}

