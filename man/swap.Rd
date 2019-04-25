\name{swap}
\alias{swap}
\alias{swap.grid}
\alias{swap.matrix}
\title{
function to swap values in a matrix or grid with other values
}
\description{
This function returns an object similar to \code{x} in which all occurrances of values in \code{original} have been replaced by the corresponding value in \code{replacement}.
}
\usage{
swap(x, original, replacement, ...)
\method{swap}{grid}(x, original, replacement, ...)
\method{swap}{matrix}(x, original, replacement, no.match=NA, na.value=NA, ...)
}
\arguments{
  \item{x}{
a grid or matrix object
}
  \item{original}{
A vector of values to be replaced.
}
  \item{replacement}{
A vector of the replacement values.
}
  \item{no.match}{
Non-NA values in x that don't match any value in original will be replaced with this value.  
  }
  \item{na.value}{
  NA values in x will be replaced with this value.
  }

  \item{...}{
  Arguments to be passed to other methods; for the grid method this might be na.value or no.match
}
}
\value{
The function returns an object of the same class as \code{x} in which all occurrances of values in \code{original} are swapped with their value in \code{replacement}.
}

\author{
Ethan Plunkett
}
\note{
Any value that isn't in \code{original} will be replaced with \code{no.match} unless it is \code{NA} 
in which case it will be replaced with \code{na.value}.  Note it is also possible to include an \code{NA}
value in \code{original} and a corresponding replacement value in \code{replacement} which will take 
precedence over \code{na.value}.
}


\examples{

# Note it is possible to swap numeric values with characters and vice versa:
# (However, character grids cannot be written to disk!)
m <- matrix(1:12, 4, 3)
m2 <- swap(m, 1:12, letters[1:12])
m3 <- swap(m2, letters[1:12], 13:24)


# Values not in original will be replaced with NA. 
swap(m, 1:6, 11:16)

}
\keyword{ spatial }
