\name{patchscan}
\alias{patchscan}
\alias{patchscan.matrix}
\alias{patchscan.grid}
\title{
Identify patches in classified raster data (either a matrix or a grid object)
}
\description{
This function takes a matrix or grid object in which cover type is classified and returns an object of the same class (grid or matrix) containing the patch id of each cell.
}
\usage{
patchscan(x, nr = 8, na.value = -9999)
\method{patchscan}{grid}(x, nr = 8, na.value = -9999)
\method{patchscan}{matrix}(x, nr = 8, na.value = -9999)
}
\arguments{
  \item{x}{
Either a matrix or a grid object.
}
  \item{nr}{
The neighbor rule either 4 or 8 indicating that either the 4 orthogonal neighboring cells or the 8 orthogonal and diagonal neighboring cells are considered neighbors.
}
  \item{na.value}{
The value used to encode NA's when passing data to C.
}
}
\details{
# 
}
\value{
  \item{patches }{An object of the same class as \code{x} containing the patch id of every cell in the landcape.}
  \item{count }{A count of the number of patches in the landcape.}

}

\author{
Ethan Plunkett
}


\seealso{
\code{\link{grid-class}}
}
\examples{
m <- matrix(sample(1:4, 400, replace=TRUE) , 20, 15)
g <- list(m=m, nrow=nrow(m), ncol=ncol(m), xll=0, yll=20, cellsize=1)
class(g) <- c("grid", class(g))

# With default arguments
res <- patchscan(g)

# With NA's in grid
g$m[2:3, 4] <- NA
res <- patchscan(g)
plot(res$patches, na.col="red")

# Using 4 neighbor rule (8 is the default)
res <- patchscan(g, nr=4)
plot(res$patches)

}
\keyword{ spatial}
