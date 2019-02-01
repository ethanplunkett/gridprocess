\name{grid-class}
\alias{grid-class}
\alias{grid}
\docType{class}
\title{
S3 class for storing raster spatial data
}
\description{
"grid" is an S3 class for storing grid data.
}
\details{
A "grid" is a list containing at least these components:
\describe{
\item{m}{a matrix containing the grid data}
\item{xll, yll}{the x and y coordinates of the lower left corner of the lower left cell}
\item{nrow, ncol}{the number of rows and columns in the grid}
\item{cellsize}{the dimensions of the cells in the grid (must be square)}
}
}
\keyword{class}
