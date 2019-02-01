\name{row and colum to map unit conversion functions}
\alias{c2x}
\alias{r2y}
\alias{x2c}
\alias{y2r}
\alias{y2fractionalr}
\alias{x2fractionalc}

\title{
  functions to convert from location in grid space (rows and columns) to location in map units (x and y) and back.  
}
\description{
\code{x2c} and \code{y2r} return the integer column or row of the x or y dimension while the fractional versions return real rows and columns.  In most cases the non-fractional version will be prefered.
  \code{c2x} and \code{r2y} return the position along the x or y dimension of the center of the cell as a real number.
}
\usage{
c2x(c, list, cellsize = list$cellsize, xll = list$xll)

r2y(r, list, cellsize = list$cellsize, yll = list$yll, nrow = list$nrow)

x2c(x, list, cellsize = list$cellsize, xll = list$xll)

y2r(y, list, cellsize = list$cellsize, yll = list$yll, nrow = list$nrow)

x2fractionalc(x, list, cellsize = list$cellsize, xll = list$xll)

y2fractionalr(y, list, cellsize = list$cellsize, yll = list$yll, nrow = list$nrow)

}
\arguments{
  \item{r, c}{
The row and column index of the focal cell.
}
\item{x, y}{x and y coordinates of a point in map units }
 \item{list}{A list describing spatial location and extent of a grid or access window containing the following items: \code{xll}, \code{yll}, \code{nrow}, and \code{cellsize}, see arguments with the same names.
 This can be a \code{\link{grid}}, the information returned by \code{\link[gridio]{tiledetails}} \code{\link[gridio]{griddescribe}}, or any other list that contains the appropriate elements.
}
  \item{cellsize}{
The size of each cell in map units. 
}
  \item{xll}{
The x coordinate of the lower left corner of the lower left (southwest) cell in the landscape or grid.
}
  \item{yll}{
The y coordinate of the lower left corner of the lower left (southwest) cell in the landscape or grid.
}
  \item{nrow}{The number of rows in the landscape or grid
}

}
\details{
These functions provide two ways of passing the spatial reference information: 1. as a list or 2. implicitly
 by using the remaining arguments.  If both are used the implicit arguments take precedence.
Using the list argument is convenient as none of the subsequent arguments are required and generally the 
information will already be in list format as a \code{\link{grid}} object.
}

\value{
\code{x2c} and \code{y2r} return the column and row index (integer) of the corresponding x and y dimension.
\code{r2y} and \code{c2x} return the y or x dimension (a real number) of the center of the cells with the corresponding row or column index. 
\code{x2c} and \code{y2r} return the precise location in column and row space (a real number) of of the corresponding x and y dimension.
}
\author{
Ethan Plunkett
}

\seealso{
\code{\link{grid-class}}
}
\examples{
#
}
\keyword{ spatial}
