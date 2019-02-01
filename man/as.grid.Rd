\name{as.grid and raster}
\alias{as.grid}
\alias{as.grid.SpatialPointsDataFrame}
\alias{as.grid.SpatialPixelsDataFrame}
\alias{as.grid.SpatialGridDataFrame}
\alias{as.grid.matrix}
\alias{as.grid.RasterLayer}
\alias{as.grid.RasterStack}
\alias{raster,grid-method}
\title{
Functions to convert to and from grid objects.
}
\description{
Make grids from objects of type: matrix,  SpatialPointsDataFrame, SpatialPixelsDataFrame, SpatialGridDataFrame, RasterLayer, and RasterStack.
Defined in packages SP and raster 
}
\usage{
as.grid(x, ...)   # generic
\method{as.grid}{matrix}(x, xll, yll, cellsize, ...)
\method{as.grid}{SpatialPointsDataFrame}(x, data.col = 1, ...)
\method{as.grid}{SpatialPixelsDataFrame}(x, data.col = 1, ...)
\method{as.grid}{SpatialGridDataFrame}(x, data.col = 1, ...)
\method{as.grid}{RasterLayer}(x, ...)
\method{as.grid}{RasterStack}(x, layer, ... )
\S4method{raster}{grid}(x)


}
\arguments{
  \item{x}{an object of class \code{matrix}, \code{SpatialPointsDataFrame}, \code{SpatialPixelsDataFrame},
  \code{SpatialGridDataFrame}, \code{RasterLayer}, \code{RasterStack} or \code{grid} (for \code{raster}).}
  
  \item{xll, yll}{the x and y coordinates of the lower left corner of the lower left cell of the grid.}
  \item{cellsize}{the cellsize of the grid}
  \item{data.col}{an integer indicating which column from the \code{data} slot of \code{x} should be converted to a grid.}
  \item{layer}{ an integer indicating which layer from the RasterStack should be used to create the grid.}
  \item{...}{Arguments to be passed to other methods.}
}
\details{
The \code{data} slot in \code{sp} objects may hold multiple columns of data, however, 
grid objects can only represent a single column. If \code{data.col} is unspecified then the first column will be used.  
}
\value{
An object of class \code{grid} which is a list containing the following elements.
  \item{m}{a matrix containing the data from \code{data.col}. Rows progress from north to south and columns from east to west.}
  \item{nrow, ncol}{the number of rows and column in \code{m}. }
  \item{xll, yll}{ the x an y coordinates of the lower left corner of the lower left cell in the matrix.}
  \item{cellsize}{ the horizontal and vertical dimension of cells in the grid; cells must be square.}
}
\author{
Ethan Plunkett	
}
\note{
For this function to work on Spatial (SP) objects \code{x} must be comprised of cells on a regular, square grid. 
However, points in a SpatialPointsDataFrame do not necessarily meet this requirement and 
cells in \code{SpatialPixelsDataFrame} and \code{SptatialGridDataFrame} classes may not be square in
which case this function will fail.  
}

\seealso{
Input classes of \code{x} are defined in \code{\link{SpatialPointsDataFrame}},
\code{\link{SpatialPixelsDataFrame}}, and \code{\link{SpatialGridDataFrame}}.
 \code{\link{gridded}} is used internally to convert to \code{\link{SpatialPixelsDataFrame}} and 
 \code{as(x, SpatialGridDataFrame)} to convert to \code{\link{SpatialGridDataFrame}}
 
 
}
\examples{

# Matrix method
mat <- matrix(1:20, 4, 5)
g <- as.grid(mat, cellsize=10, xll=0, yll=0)
g

# SpatialPointsDataFrame
library(sp)
data(meuse.grid)
d <- meuse.grid
coordinates(d) <- c("x", "y")  # this converts meuse.grid to a SpatialPointsDataFrame
g <- as.grid(d, 3) 
plot(g)


\dontrun{

# To and from raster
library(raster)
r <- raster(g)
g2 <- as.grid(r)
}

}

\keyword{ spatial }
