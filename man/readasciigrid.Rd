\name{readasciigrid}
\alias{readasciigrid}
\title{
Function to read an ASCII grid
}
\description{
This function reads an ASCII grid from disk and returns a \code{\link{grid}} object.
}
\usage{
readasciigrid(path, as.matrix = FALSE)
}
\arguments{
  \item{path}{
The path to a ASCII grid on disk. Relative paths are interpreted relative to the current working directory.
}
  \item{as.matrix}{
if \code{as.matrix} is set to \code{TRUE} the return value will be a simple matrix (not a \code{grid}).
}
  \item{...}{
Arguments passed onto readasciigrid.   
  }
}
\value{
An object of class \code{\link{grid}}
}
\author{
Ethan Plunkett
}

\seealso{
\code{\link{writeasciigrid}} for writing ASCII grids.  \code{\link{readasciigridheader}} for reading just the header information.
}
\examples{
#
}
\keyword{ spatial }
