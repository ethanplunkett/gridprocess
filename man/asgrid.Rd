\name{asgrid and rast()}
\alias{asgrid}
\alias{asgrid.SpatRaster}
\alias{asgrid.matrix}
\alias{rast,grid-method}
\title{
Convert to and from grid objects.
}
\description{
Make grids from objects of type: \code{matrix} and \code{SpatRaster}
(defined in\pkg{terra}).
}
\usage{
asgrid(x, ...)   # generic
\method{asgrid}{matrix}(x, xll, yll, cellsize, ...)
\method{asgrid}{SpatRaster}(x, ...)
\S4method{rast}{grid}(x)

}
\arguments{
  \item{x}{an object of class \code{matrix}, \code{SpatRaster} or \code{grid}}
  \item{xll, yll}{the x and y coordinates of the lower left corner of the lower
  left cell of the grid.}
  \item{cellsize}{the cellsize of the grid}
  \item{...}{Arguments to be passed to other methods.}
}

\value{
For \code{asgrid} an object of class \code{grid} which is a list containing
the following elements.
  \item{m}{a matrix containing the data from \code{data.col}. Rows progress
  from north to south and columns from east to west.}
  \item{nrow, ncol}{the number of rows and column in \code{m}. }
  \item{xll, yll}{ the x an y coordinates of the lower left corner of the lower
  left cell in the matrix.}
  \item{cellsize}{ the horizontal and vertical dimension of cells in the grid;
  cells must be square.}

For \code{rast} a \code{SpatRaster}.

}
\author{
Ethan Plunkett
}

\seealso{
Input classes of \code{x} are defined in  \code{\link[terra]{rast}}
}

\examples{
# Matrix method
mat <- matrix(1:20, 4, 5)
g <- asgrid(mat, cellsize=10, xll=0, yll=0)
g


# To and from SpatRaster (terra::rast())
library(terra)
r <- rast(g)
g2 <- asgrid(r)

}

\keyword{ spatial }
