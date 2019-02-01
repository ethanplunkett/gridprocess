print.grid <- function(x, ...){
  # Prints information about a grid object in a compact and legible way
  #  the matrix is skipped.
  #  Ethan PLunkett
  #  Modified Jan 2016, to print full digits and to print the first 5 values of the matrix.
  cat("A grid object with elements:\n", sep="") 
  ns <- names(x)
  ml <- max(nchar(ns))
  nsf <- substr(paste(ns, paste(rep(" ", ml), collapse="")), 1, ml+1) # formated names
  
  for(i in 1:length(ns)){
    cat("  ", nsf[i], ": ", sep="")
    if(ns[i] == "m"){
      n <- x$nrow * x$ncol
      sn <- min(n, 5)
      samp <- sample(n, sn)
      cat("a ", class(x$m), " [", nrow(x$m), ", ", ncol(x$m), "] ", 
          sn, " random values: ", paste(x$m[samp], collapse = ", "), "\n", sep="") 
    } else {
      cat( as.character(x[[i]]), "\n")
    }
  }
  
  
  
  # print(x[-1])
}
