# R_patch_scan(int *ret_v, int *land_ptr, int *i, int *j, int *nb_type, int *no_data, int *patch_count_ptr)

patchscan <- function(x, nr=8, na.value=-9999){
	 UseMethod("patchscan")
}

patchscan.matrix <- function(x, nr=8, na.value=-9999){
	if(! nr %in% c(4, 8)) stop("nr (neighbor rule) must be either 4 or 8")
	nrow <- nrow(x)
	ncol <- ncol(x)
	x <- t(x)
	x[is.na(x)] <- na.value
	 r <- .C("R_patch_scan", integer(1), as.integer(x), as.integer(nrow), 
        as.integer(ncol), as.integer(nr), as.integer(na.value), integer(1), PACKAGE="spread_lib")
	 parseerror(r[[1]], "patchscan")
	 r <- r[-1]
  	names(r) <- c("grid", "nrow", "ncol", "nr", "na.value", "count")  
	x <- matrix(r$grid, nrow=nrow, ncol=ncol, byrow=TRUE)
	x[x==na.value] <- NA
	return(list(patches=x, count=r$count))
}

patchscan.grid <- function(x, nr=8, na.value=-9999){
	 r <- patchscan(x$m, nr=nr, na.value=na.value)
	 x$m <- r$patches
	 return(list(patches=x, count=r$count))
}

