\name{as.SpatialPointsDataFrame}
\alias{as.SpatialPointsDataFrame}

\title{
Convert grid objects to SpatialPointsDataFrame objects
}
\description{
This function converts \code{\link{grid}} objects defined in the \pkg{grid} package to objects of class \code{\link{SpatialPointsDataFrame}} defined in \pkg{sp}.
}
\usage{
as.SpatialPointsDataFrame(x)
}
\arguments{
  \item{x}{A \code{\link{grid}} object.}
}
\value{
An object of class \code{\link{SpatialPointsDataFrame}}
}
\author{
Ethan Plunkett
}

\seealso{
\code{\link{as.grid}}
}
\examples{

 g <- as.grid(matrix(1:12, 3, 4, byrow = TRUE), xll = 0, yll = 0, cellsize = 10)
 spd <-  as.SpatialPointsDataFrame(g)
 df <- as.data.frame(spd)

}
\keyword{ spatial }
