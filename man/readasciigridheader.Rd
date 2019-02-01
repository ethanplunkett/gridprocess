\name{readasciigridheader}
\alias{readasciigridheader}

\title{
Function to read header information from an ASCII grid
}
\description{
This function returns a list containing the header information from an ASCII grid.
}
\usage{
readasciigridheader(path)
}
\arguments{
  \item{path}{
the path of an ASCII grid on disk
}
  \item{...}{
Arguments passed onto readasciigrid.   
  }
}
\value{
A list of the header information in the ASCII grid which explains the location and extent of the grid
  \item{nrow, ncol }{Number of rows and columns in the grid}
  \item{xll, yll}{x and y coordinates of the lower left corner of the lower left cell in the grid}
  \item{cellsize }{The dimensions of each cell in the grid}
  \item{na.value }{The value used to store \code{NA} values in the grid.}
}
\author{
Ethan Plunkett
}
\note{
This function is used by readasciigrid.
}

\seealso{
\code{\link{readasciigrid}}, \code{\link{writeasciigrid}}
}
\examples{
# readasciigrid("dem.asc")
}
\keyword{ spatial }
