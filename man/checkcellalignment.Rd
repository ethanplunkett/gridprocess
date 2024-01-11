\name{checkcellalignment}
\alias{checkcellalignment}

\title{
function to check if the cells of two objects align with each other
}
\description{
This function checks to see whether individual cells from one object align with
those from another.  The extents do not have to match or even overlap.
}
\usage{
checkcellalignment(x, y)
}


\arguments{
  \item{x, y}{
grid objects or a list with, as a minimum, the elements:  \code{xll},
\code{yll}, and \code{cellsize}.
}
}
\details{
The function will throw an error if the two objects don't have matching cell
alignment.
Alignment doesn't have to be absolutely perfect but must be very close;
this allows for rounding error when cellsize is not an integer.
See \code{\link{all.equal}} for more on the tolerances.
}
\value{
If the two grids align then the function will return \code{TRUE},
otherwise it will throw an error.
}

\seealso{
\code{\link{matchextent}},\code{\link{gridio2::gridintersect}},
\code{\link{gridio2::overlay}} all use this function.
\code{\link{gridio2::coincide}} checks to see if two objects have matching cell
alignment and extent.

}
\examples{

a <- list(xll = 0, yll = 0, cellsize = 10, nrow = 100, ncol = 100)
b <- list(xll = 1000, yll = 2000, cellsize = 10, nrow = 50, ncol = 200)
checkcellalignment(a, b)  # TRUE

\dontrun{
c <- list(xll = 1, yll = 0, cellsize = 10, nrow = 100, ncol = 100)
checkcellalignment(a, c)  #  Error in checkcellalignment(a, c) :
                          #    Grids are misaligned in the x direction
}



}

\keyword{ spatial }

