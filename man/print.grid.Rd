\name{print.grid, print.griddescription}
\alias{print.grid}
\title{
Function to print grid and griddescription object
}
\description{
These are the print method for grid objects. \code{print.grid} prints out the
names and values of all elements of the object except for the matrix \code{m}
the contents of which are not printed.  \code{print.griddescription} prints out
a griddescription.
}
\usage{
\method{print}{grid}(x, ...)
}

\arguments{
  \item{x}{
A grid object
}
   \item{...}{
 Arguments passed to other methods; it is not used for this method but required for consistency with the generic method.
}
}
\value{
The function returns nothing.
}
\author{
Ethan Plunkett
}

\seealso{
\code{\link{asgrid}}\code{\link[gridio2]{readgrid}}
}
\examples{
# print(g)
}
\keyword{spatial}

