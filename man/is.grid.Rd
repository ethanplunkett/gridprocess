\name{is.grid}
\alias{is.grid}
\title{
test for valid grid object
}
\description{
tests to see if \code{x} is a properly formed and internally
consistent grid object
}
\usage{
is.grid(x)
}

\arguments{
  \item{x}{ An potential grid object to be tested 
}
}
\value{
TRUE if x is a grid. FALSE otherwise.
}


\examples{
  g  <- as.grid(matrix(1:4, 2, 2),  xll = 0, yll =0, cellsize = 10)
  is.grid(g)  # TRUE
  is.grid(matrix(1:4, 2, 2)) # FALSE
}

