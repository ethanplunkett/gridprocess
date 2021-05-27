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
Ethan Plunkett, Brad Compton, and Eduard Ene 
}
\references{
Compton, B.W., K. McGarigal, S.A. Cushman, and L.R. Gamble. 2007. A resistant-kernel model
of connectivity for amphibians that breed in vernal pools. Conservation Biology 21:788-799.
\doi{10.1111/j.1523-1739.2007.00674.x}

McGarigal, K., B.W. Compton, E.B. Plunkett, W.V. DeLuca, J. Grand, E. Ene, and S.D. Jackson.
2018. A landscape index of ecological integrity to inform landscape conservation. Landscape
Ecology 33:1029-1048.  
\doi{10.1007/s10980-018-0653-9}
}

\seealso{
\code{\link{rawspread}} calculates the cost distance and is called by this function.
\code{\link{x2c}} and \code{\link{y2r}} will convert x and y coordinates to row and column indicies.
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

