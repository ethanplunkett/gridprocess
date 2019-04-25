# Function to substitute values in a matrix or grid object with other values
# Arguments:
#	x : a matrix or grid
#	original - a vector of values that occur in x
#	replacement - a vector of replacement values corresponding to each element of original (orignal and replacement must be the same length)
#	Note : values in X that are not in orginal will be replaced with NA 
#	
swap <- function(x, original, replacement, ...) UseMethod("swap")

swap.matrix <- function(x, original, replacement, no.match=NA, na.value=NA, ...){
  if(length(original) != length(replacement)) stop("original and replacement must be vectors of the same length.")
  x2 <- matrix(NA, nrow=nrow(x), ncol=ncol(x))
  sv <- x %in% original
  x2[sv] <- replacement[match(x[sv], original)]
  x2[!sv & is.na(x)] <- na.value
  x2[!sv & !is.na(x)] <- no.match
  return(x2)
}

swap.grid <- function(x, original, replacement, ...){
	x$m <- swap(x$m, original, replacement, ...)
	return(x)
}

