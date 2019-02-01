\name{spread}
\alias{spread}
\alias{spread.matrix}
\alias{spread.grid}
\title{
Functions to calculate a gaussian resistant kernel for a focal cell on a cost surface.
}
\description{
This function returns a matrix where the value of each cell is a gaussian function of the least cost path between the cell and a focal cell.
}
\usage{
spread(x, ...)  # generic
\method{spread}{matrix}(x, row, col, sd, cellsize=1, sd.threshold=3, ...)
\method{spread}{grid}(x, row, col, sd,  sd.threshold = 3, ...)

}
\arguments{
  \item{x}{
the cost or resistance surface.  Higher values indicate greater cost of movement.  All values must be greater than one. 
}
  \item{row, col}{
the focal row and column of the kernel.
}
  \item{sd}{
the standard deviation of the kernel (in map units).
}
  \item{cellsize}{
The dimension of each cell (in map units). 
}
  \item{sd.threshold}{
This is the threshold in standard deviations beyond which the height will not be calculated and will be assumed to be zero. To calculate the threshold in map units multiple this value by \code{sd}.
}
  \item{...}{
Arguments to be passed to other methods. 
  }
}

\value{
An object of the same class as \code{x} containing the spread values.
}
\author{
Ethan Plunkett
}

\seealso{
\code{\link{rawspread}} calculates the cost distance and is called by this function.
}
\examples{
	rs <- matrix(1, nrow=20, ncol=20)
	rk <- spread(rs, 10, 10, 3)	
	image(rk)
	rs[,12:13] <- 2
	rk2 <- spread(rs, 10, 10, 3)
	image(rk2)
}	
\keyword{spatial}

