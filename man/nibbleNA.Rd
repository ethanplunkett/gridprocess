\name{nibbleNA}
\alias{nibbleNA}
\alias{nibbleNA.grid}
\alias{nibbleNA.matrix}
\title{
Replace NA values in a grid with the mode of the neighboring values
}
\description{
This function replaces NA values with the mode of the 8 closest neighbors.
NA cells that are surrounded by NA will be unaltered but the function can be
reapplied to iteratively nibble values into a patch of NA, filling it in from
the edges inward.
}
\usage{
nibbleNA(x)
\method{nibbleNA}{grid}(x)
\method{nibbleNA}{matrix}(x)
}
\arguments{
  \item{x}{ A grid or matrix with some NA values
}
}

\value{
this function returns an object of the same class as  \code{x} (either a
\code{\link{grid}} or \code{\link{matrix}}) in which \code{NA} cells that abut
cells with values will have the mode of the neighboring values. Ties are broken
deterministically based on position in this order: right, left, bottom, top,
top left, bottom right, bottom left, and top right.
}
\author{
Ethan Plunkett
}
\note{
This function should only be applied to categorical grids where cells are
likely to have identical values. Replacing NA in continuous grids would be
better done with a kernel smooth.  See \code{\link{gridio2::calckernel}} and
\code{\link{gridio2::gaussiansmooth}} for a couple of possibilities.

This function currently always uses all 8 neighbors.

}

\seealso{
\code{\link{eliminatesmallpatches}} uses this function to eliminate patches
below a certain size threshold.
}
\examples{
  set.seed(1)
  g <- asgrid(matrix(runif(n = 48)> .7, 6, 8), xll = 0, yll = 0, cellsize = 10)
  g$m[2, 2] <- NA
  plot(g)
  plot(nibbleNA(g))
}
\keyword{spatial }
