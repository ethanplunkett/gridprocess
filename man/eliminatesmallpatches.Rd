\name{eliminatesmallpatches}
\alias{eliminatesmallpatches}
\alias{eliminatesmallpatches.matrix}
\alias{eliminatesmallpatches.grid}
\title{
Eliminate small patches by replacing their cell content with the mode of 
nearby cell values.
}
\description{
This function replaces the values in cells within small patches with values 
from neighboring cells not in the small patch. If targetclasses are specified 
it will only process cells within the supplied classes.
}
\usage{
eliminatesmallpatches(x, maxsize, nr = 8, ...)  # generic function
\method{eliminatesmallpatches}{matrix}(x, maxsize, nr = 8, targetclasses = NA, 
na.replace.value = -99)
\method{eliminatesmallpatches}{grid}(x, maxsize, nr = 8, targetclasses = NA,
na.replace.value = -99)
}
\arguments{
  \item{x}{
A grid object
}
  \item{maxsize}{
patches of this size and smaller will be eliminated
}
  \item{nr}{
the neighbor rule; either 4 or 8 indicating the orthogonal neighbors, or 
orthogonal and diagonal; this is used to identify patches when determining which
patches will be eliminated. Note, however, that when determining the replacement
value the mode of all 8 neighbors is always used.
}
  \item{targetclasses}{
Set to NA to consider all patches.  Otherwise set to values in x which will be
considered eligable for elimination
}
  \item{na.replace.value}{
This value is used internally to replace NA's prior to nibbling.  It is up to 
the user to make sure a value that doesn't occur in \code{x} is used.
}
}
\value{
The function returns a object of the same class and dimensions as \code{x} in 
which all the small patches have been replaced with the mode of values from 
neighboring cells.
}
\author{
Ethan Plunkett
}
\note{
This function is only appropriate for use with categorical grids.

}
\seealso{
This relies on \code{\link{findsmallpatches}},  \code{\link{patchscan}}, and
\code{\link{nibbleNA}}
}
\examples{
  set.seed(1)
  g <- as.grid(matrix(runif(n = 48)> .7, 6, 8), xll = 0, yll = 0, cellsize = 10)
  plot(g)
  plot(eliminatesmallpatches(g, 3, nr = 8))
  g$m[1, 1] <- NA
  
  plot(eliminatesmallpatches(g, 2, nr = 8))  
  
  plot(eliminatesmallpatches(g, 2, nr = 4))  # 4 neighbor rule - diagonal connections don't count
  
}
\keyword{ spatial }
