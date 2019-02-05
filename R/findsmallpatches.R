if(FALSE){
  g <- as.grid(matrix(runif(n = 48)> .7, 6, 8), xll = 0, yll = 0, cellsize = 10)
  plot(g)
  plot(findsmallpatches(g, 3, nr = 8))
  
  
  
  
}


findsmallpatches <- function (x, maxsize,  nr=8, ... ){
  UseMethod("findsmallpatches")
}

findsmallpatches.grid <- function(x, maxsize, ... ){
  x$m <- findsmallpatches(x$m, maxsize = maxsize, ...)
}


findsmallpatches.matrix <- function(x, maxsize, nr=8,  targetclasses = NA){
  patches <- patchscan(x, nr = nr)$patches
  sizes <- table(patches)
  small.patches <- as.numeric(names(sizes)[sizes <= maxsize])
  rm(sizes)
 
  small <- matrix(nrow = nrow(x), ncol = ncol(x), data =  patches %in% small.patches )
  rm(patches)
  
  if(!is.na(targetclasses))
    small <- small & x$m %in% targetclasses
  return(small)  
}



  