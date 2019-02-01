rawspread <- function(x, spread.value, row, col, square=FALSE){

# C function decleration : void R_spread(int *ret_v, double *spread_val, int *y_focal, int *x_focal, int *y_count, int *x_count, double *mtx_resistance, int *use_long_diag) ;
	x <-as.matrix(x)  # so dim call works properly
	row <- as.integer(row)
	col <- as.integer(col)
	rows <- as.integer(nrow(x))
	columns <- as.integer(ncol(x))
	spread.value <- as.double(spread.value)
	x <-as.double(as.vector(t(x))) #convert to vector for passing to C

	result<-.C("R_spread",
			integer(1),
			as.double(spread.value),
			as.integer(row),
			as.integer(col),
			as.integer(rows),
			as.integer(columns),
			as.double(x),
			as.integer(!square),
			PACKAGE="spread_lib")
	parseerror(result[1], "rawspread")
	matrix(result[[7]],rows, columns, byrow=TRUE)
	} # End r.spread function Definition

