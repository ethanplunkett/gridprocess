is.grid <- function(x){
    inherits(x, "grid") && inherits(x, "list") &&
    all(names(x) == c("m", "xll", "yll", "nrow",
                  "ncol", "cellsize")) &&
    nrow(x$m) == x$nrow &&
    ncol(x$m) == x$ncol && is.matrix(x$m) &&
    all(sapply(x[2:length(x)], length)  == 1) &&
    all(sapply(x[2:length(x)], is.numeric))
}
