\name{matchextent}
\alias{matchextent}
\alias{match.extent}

\title{
 function to match the extent of one grid object to that of another.
}
\description{
This function preserves the georeferencing of the grid \code{x} but shifts its extent (either clipping or adding NA cells) so that it matches that of grid \code{y}.
}
\usage{
matchextent(x, y)
match.extent(x, y)  # depreciated - switched to matchextent for consistency with other functions
 # in the library
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
A grid with the extent of \code{y} containing whatever data in \code{x} overlaps that extent.
}
\author{
Ethan Plunkett
}
\note{
Non overlapping grids will result in an error.
}
\seealso{
\code{\link{upscale}} and \code{\link{downscale}} can change the resolution of a grid and using them in succession will often necessitate using this function.
}
\examples{


### Setup a temporary directory with a sample grid in it 
# Get path to example dem grid (included with package)
require(gridio)
datapath <- system.file("exampledata", package="gridio")  # grid path to example grid
datapath <- shortPathName(datapath)
datapath <- paste(datapath, "/.", sep="")

# Make a temporary directory to write new grids to
dir <- tempdir() # get temporary directory
if(!file.exists(dir)) dir.create(dir)

# Copy example data into temporary directory
file.copy(datapath, dir, recursive=TRUE)
# system(paste("open", dir)) # if you want to look at contents of temporary directory
###  Done setting up directory

cleanup() # disconnect from any prior gridservers 

gridinit() # initialize local gridserver with base path in temporary dir
dem <- paste(dir, "/dem", sep="") # path to dem file.
setwindow(dem) # setwindow to dem file

# Read a grid
g <- readgrid(dem)
f <- crop(g, 20)

# Make new grid that matches the extent of the cropped grid
gc <- matchextent(g, f)  # result is cropped 
if(!coincide(gc, f)) stop("These should coincide.")

# Take the cropped grid and expand it's extent back out so that 
#   it matches the orignal grid (in extent); there will be NA's around the edge
e <- matchextent(f, g) 
if(!coincide(e, g)) stop("These should coincide.")

plot(g)  # orginal grid
plot(e) # same extent but more NA's where data was lost due to cropping 

# Cleanup
gridkill(dem)
cleanup()


}
\keyword{ spatial}
