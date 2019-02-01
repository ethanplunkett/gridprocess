\name{writeasciigrid}
\alias{writeasciigrid}

\title{
Function to write a grid to an ASCII grid on disk
}
\description{
This function writes \code{grid}, an object of class \code{\link{grid}} as an ASCII grid to the location specified by \code{path}.  It substitutes the \code{na.value} into \code{NA} values in the grid prior to writing.
}
\usage{
writeasciigrid(grid, path, na.value = -9999)
}

\arguments{
  \item{grid}{
A \code{\link{grid}} object to be written.
}
  \item{path}{
The path and file name to write to.
}
  \item{na.value}{
The value to use to represent \code{NA} values on disk.
}
\item{...}{
Arguments will be passed onto writeasciigrid which you should use instead
}
}
\value{
Nothing is returned.
}
\author{
Ethan Plunkett
}

\seealso{
\code{\link{readasciigrid}}, \code{\link{readasciigridheader}}, \code{\link[gridio]{writegrid}}, \code{\link[gridio]{writeblock}}, \code{\link[gridio]{writetile}} 
}
\examples{
\dontrun{
 writeasciigrid(grid, "testgrid.asc")
}


}
\keyword{ spatial }
