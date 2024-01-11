\name{swap}
\alias{swap}
\alias{swap.grid}
\alias{swap.matrix}
\title{
function to swap values in a matrix or grid with other values
}
\description{
This function returns an object of the same type and dimension as \code{x} in 
which all occurrances of values in \code{original} have been replaced by the 
corresponding value in \code{replacement}.
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
m <- matrix(c(1:11, NA), 4, 3)


# Values not in original will be replaced with NA. 
swap(m, 1:6, 11:16)

# Replace non-matching with 1
swap(m, 1:6, 11:16,  no.match = 1)

# Replace non-maching with 1 and na with 0
swap(m, 1:6, 11:16,  no.match = 1,  na.value = 0)

# It's typical to work directly with grids
g <- asgrid(m, xll = 0, yll = 0, cellsize = 10)
g2 <- swap(g, 1:6, 11:16)





}
\keyword{ spatial }
