
if(FALSE){
  
  source("Z:/Users/Ethan/gridio/R/findsmallpatches.R")
  source("Z:/Users/Ethan/gridio/R/nibbleNA.R")
  
  
  set.seed(1)
  g <- as.grid(matrix(runif(n = 48)> .7, 6, 8), xll = 0, yll = 0, cellsize = 10)
  plot(g)
    plot(eliminatesmallpatches(g, 3, nr = 8))
  g$m[1, 1] <- NA
  plot(g)
  plot(eliminatesmallpatches(g, 3, nr = 8))
  
  
}


eliminatesmallpatches <- function (x, maxsize,  nr=8, ... ){
  UseMethod("eliminatesmallpatches")
}

eliminatesmallpatches.grid <- function(x, maxsize, nr = 8, targetclasses = NA, na.replace.value = -99){
  # Arguments
  #   x : the grid in which small patches will be nibbled away.
  #   nr : the neighbor rule (either 4 or 8)
  #   na.replace.value:  value to temporarily assign to pre-exisiting NA values that you don't
  #      want nibbled.  It is up to the user to make sure that this value does not occur in the grid
  #   maxsize:  Patches this size and smaller will be eliminated in target classes (or all classes)
  # targetclasses:  Class codes to which minimum mapping unit elimination will be applied; Use NA to 
  #    indicate all classes
  
  
  x$m <- eliminatesmallpatches(x$m, maxsize = maxsize,  nr = nr, targetclasses = NA, na.replace.value = -99)
  
  return(x)
}







eliminatesmallpatches.matrix <- function(x, maxsize, nr = 8, targetclasses = NA, na.replace.value = -99){
  # Arguments
  #   x : the grid in which small patches will be nibbled away.
  #   nr : the neighbor rule (either 4 or 8)
  #   na.replace.value:  value to temporarily assign to pre-exisiting NA values that you don't
  #      want nibbled.  It is up to the user to make sure that this value does not occur in the grid
  #   maxsize:  Patches this size and smaller will be eliminated in target classes (or all classes)
  # targetclasses:  Class codes to which minimum mapping unit elimination will be applied; Use NA to 
  #    indicate all classes
  
  already.na <- is.na(x)
  eliminate <- findsmallpatches(x, nr = nr, maxsize = maxsize ,  targetclasses = targetclasses)
  x[already.na] <- na.replace.value
  x[eliminate] <- NA
  
  # Nibble NA's
  k <- 1
  while(any(is.na(x))){
    k <- k + 1
    x <- nibbleNA(x)  # nibble NA values replacing with (non-NA) mode of 8 nearest neighbors
  }  
  x[already.na] <- NA
  
  # Check to see if the NA replace value was nibbled into cells that didn't intially have NA
  # if so, nibble some other value back into those cells and then reburn the NA
  sv <- x %in% na.replace.value
  if(any(sv)){
    x[sv] <- NA
    k <- 1
    while(any(is.na(x[!already.na]))){
      k <- k + 1
      x <- nibbleNA(x)  # nibble NA values replacing with (non-NA) mode of 8 nearest neighbors
    }  
    x[already.na] <- NA
    if(any(x == na.replace.value, na.rm = TRUE))
      stop("No cells should have the na.replace.value")
  }
  return(x)
}
