\name{asgrid and rast()}
\alias{asgrid}
\alias{asgrid.SpatRaster}
\alias{asgrid.SpatialPointsDataFrame}
\alias{asgrid.SpatialPixelsDataFrame}
\alias{asgrid.SpatialGridDataFrame}
\alias{asgrid.matrix}
\alias{rast,grid-method}
\title{
Convert to and from grid objects.
}
\description{
Make grids from objects of type: \code{matrix},  \code{SpatialPointsDataFrame}, \code{SpatialPixelsDataFrame}, \code{SpatialGridDataFrame},  and
\code{SpatRaster}.
Defined in packages \pkg{sp} and \pkg{terra}
}
\usage{
asgrid(x, ...)   # generic
\method{asgrid}{matrix}(x, xll, yll, cellsize, ...)
\method{asgrid}{SpatialPointsDataFrame}(x, data.col = 1, ...)
\method{asgrid}{SpatialPixelsDataFrame}(x, data.col = 1, ...)
\method{asgrid}{SpatialGridDataFrame}(x, data.col = 1, ...)
\method{asgrid}{SpatRaster}(x, ...)
\S4method{rast}{grid}(x)


}
\arguments{
  \item{x}{an object of class \code{matrix}, \code{SpatialPointsDataFrame},
  \code{SpatialPixelsDataFrame},
  \code{SpatialGridDataFrame}, \code{SpatRaster} or
  \code{grid} (for \code{rast()}).}

  \item{xll, yll}{the x and y coordinates of the lower left corner of the lower
  left cell of the grid.}
  \item{cellsize}{the cellsize of the grid}
  \item{data.col}{an integer indicating which column from the \code{data} slot
  of \code{x} should be converted to a grid.}
  \item{...}{Arguments to be passed to other methods.}
}
\details{
The \code{data} slot in \code{sp} objects may hold multiple columns of data,
however, grid objects can only represent a single column. If \code{data.col}
is unspecified then the first column will be used.
}
\value{
An object of class \code{grid} which is a list containing the following
elements.
  \item{m}{a matrix containing the data from \code{data.col}. Rows progress
  from north to south and columns from east to west.}
  \item{nrow, ncol}{the number of rows and column in \code{m}. }
  \item{xll, yll}{ the x an y coordinates of the lower left corner of the lower
  left cell in the matrix.}
  \item{cellsize}{ the horizontal and vertical dimension of cells in the grid;
  cells must be square.}
}
\author{
Ethan Plunkett
}
\note{
For this function to work on Spatial (\pkg{sp}) objects \code{x} must be
comprised of cells on a regular, square grid. However, points in a
SpatialPointsDataFrame do not necessarily meet this requirement and
cells in \code{SpatialPixelsDataFrame} and \code{SptatialGridDataFrame}
classes may not be square.
}

\seealso{
Input classes of \code{x} are defined in \code{\link{SpatialPointsDataFrame}},
\code{\link{SpatialPixelsDataFrame}}, \code{\link{SpatialGridDataFrame}},
 and  \code{link[rast]{rast}}
}

\examples{
# Matrix method
mat <- matrix(1:20, 4, 5)
g <- asgrid(mat, cellsize=10, xll=0, yll=0)
g

# SpatialPointsDataFrame
library(sp)
data(meuse.grid)
d <- meuse.grid
coordinates(d) <- c("x", "y")  # this converts meuse.grid to a SpatialPointsDataFrame
g <- asgrid(d, 3)

plot(g)


# To and from SpatRaster (terra::rast())
library(terra)
r <- rast(g)
g2 <- asgrid(r)

}

\keyword{ spatial }
