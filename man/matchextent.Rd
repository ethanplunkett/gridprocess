\name{matchextent}
\alias{matchextent}
\alias{match.extent}

\title{
 function to match the extent of one grid object to that of another.
}
\description{
This function preserves the georeferencing of the grid \code{x} but shifts
its extent (either clipping or adding NA cells) so that it matches that of
grid \code{y}.
}
\usage{
matchextent(x, y)
match.extent(x, y)  # deprecated
}

\arguments{
  \item{x}{
The grid whose extent is to be modified.
}
  \item{y}{
The reference grid to which the extent is to be matched.
}
}
\details{
The grids must have the same cellsize and grid alignment.
}
\value{
A grid with the extent of \code{y} containing whatever data in \code{x}
overlaps that extent.
}
\author{
Ethan Plunkett
}
\note{
Non overlapping grids will result in an error.
}
