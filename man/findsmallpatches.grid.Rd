\name{findsmallpatches}
\alias{findsmallpatches}
\alias{findsmallpatches.grid}
\alias{findsmallpatches.matrix}
\title{
Function to identify cells that are part of small patches in a grid
}
\description{
This function returns a grid of the same extent as x populated with TRUE and FALSE indicating whether each cells is part of a small patch and within one of the targetclasses
}
\usage{
findsmallpatches(x, maxsize,  nr=8, ...)
\method{findsmallpatches}{grid}(x, maxsize, nr = 8, ...)
\method{findsmallpatches}{matrix}(x, maxsize, nr = 8,  targetclasses = NA,...)
}
\arguments{
  \item{x}{
a grid object
}
  \item{nr}{
the neighbor rule to use when identifying small patches; should be either 4 or 8
}
  \item{maxsize}{
the maximum number of cells a patch can have and be considered small
}
  \item{targetclasses}{
a vector indicating classes to process; if set only cells in the target classes will be eligable to be identified as small; if NA all classes are considered.
}

\item{...}{arguments passed on to other methods}
}

\value{
This function returns a logical grid with TRUE anwhere a small patch exists within a target class and FALSE elsewhere.
}
\author{
Ethan Plunkett
}

\seealso{
\code{\link{eliminatesmallpatches}} uses this function to remove small patches and replace with values
 from nearby cells  \code{\link{patchscan}} is used by this function to identify patches.
}
\examples{

  g <- as.grid(matrix(runif(n = 48)> .7, 6, 8), xll = 0, yll = 0, cellsize = 10)
  plot(g)
  plot(findsmallpatches(g, 3, nr = 8)) # TRUE (1) where g has small patches


}
\keyword{ spatial }

