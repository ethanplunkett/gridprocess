\name{rawspread}
\alias{rawspread}

\title{
Function to calculate a resistant spread out from a focal cell of a matrix.
}
\description{
This function takes a spread value, the focal cell coordinates, and
a resistance matrix (all values >= 1); executes a resistant spread; and returns the final snapshot of the spread as a matrix.
}
\usage{
rawspread(x, spread.value, row, col, square=FALSE)
}
\arguments{
  \item{x}{ the resistance matrix, all values must be >= 1 }
  \item{spread.value}{ the initial bank account for the spread, which is depleted based on the resistance of each cell as the spread progresses.}
  \item{row}{ the focal row  of the spread }
  \item{col}{ the focal column of the spread }
  \item{square}{ if TRUE then the diagonal cells will be considered to be one cell length away from the center and the spread will tend to be square.  The default of FALSE uses a diagonal length of 1.4 cells and spreads tend to be octagonal.}


}
\details{
	This calculates the functional proximity of each cell to the focal cell.  With the proximity highest at the focal cell where it is equal to the spread.value and diminishing with distance from the focal cell (based on the resistance of intervening cells).  The functional proximity thus is zero for cells with a functional distance greater than spread.value from the focal cell (regardless of how much greater). In practice larger spread values allow calculation of larger functional distances but requires more processor time.

To convert the returned matrix of proximity value to a least cost distances subtract the matrix from \code{spread.value}.  However, this will only calculate least cost distance correctly for cells that are within of \code{spread.value} of the focal cell; all other cells would end up with \code{spread.value} despite being farther away.
}
\value{
A matrix with the same dimensions as \code{x} the values of which represent the functional proximity to the focal cell.  They range from \code{spread.value} (at the focal cell) to zero for cells greater than \code{spread.value} away from the focal cell.

}

\author{
Ethan Plunkett, Brad Compton, and Eduard Ene 
}

\references{
Compton, B.W., K. McGarigal, S.A. Cushman, and L.R. Gamble. 2007. A resistant-kernel model
of connectivity for amphibians that breed in vernal pools. Conservation Biology 21:788-799.
\doi{10.1111/j.1523-1739.2007.00674.x}

McGarigal, K., B.W. Compton, E.B. Plunkett, W.V. DeLuca, J. Grand, E. Ene, and S.D. Jackson.
2018. A landscape index of ecological integrity to inform landscape conservation. Landscape
Ecology 33:1029-1048.  
\doi{10.1007/s10980-018-0653-9}
}

\seealso{
 \code{\link{spread}}
}
\examples{
# Create (minimally resistant) test matrix
a <- matrix(1, 5, 5)
a
rawspread(a, 10, 3, 3)

# Add two higher resistance bands
a[2, ]  <- 5
a[,2] <- 5
a
rawspread(a, 10, 3, 3)

}
\keyword{ spatial }

