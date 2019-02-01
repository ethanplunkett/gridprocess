\name{plot.grid}
\alias{plot.grid}

\title{
Function to plot a grid object
}
\description{
This function plots a grid object. By default it uses a black and white color gradient.
}
\usage{
\method{plot}{grid}(x, asp = 1, xlab = "x", ylab = "y", min.val = min(x$m, 
    na.rm = TRUE), max.val = max(x$m, na.rm = TRUE), add = FALSE, 
    na.col = NA, use.old = FALSE, interpolate = FALSE, col, nramp=200, 
    reverse.col=FALSE, ...)
}
\arguments{
  \item{x}{
a \code{\link{grid}} object.
}
  \item{asp}{
the aspect ratio of the plot.
}

  \item{min.val, max.val}{
The minimum and maximum values used for converting the values in the grid to the colors. Defaults to the minumum and maximum value in the grid. Only relevant when \code{use.old} is \code{FALSE}
}
\item{add}{If \code{TRUE} the image is overlayed on the current plot otherwise a new plot is generated.}

\item{na.col}{The color to be used to plot NA values. By default they are left as NA which is plotted as transparent on most devices. This is only used when \code{use.old} is \code{FALSE}.}

\item{use.old}{This controls whether the old version or the new version of this function is used. The old version relies on \code{\link{image}} which plots raster images by drawing a series of polygons; the new version uses \code{\link{rasterImage}} which draws pixels and is much faster but not always supported.  }

\item{interpolate}{This determines whether linear interpolation is used. The effect of changing this argument will be most evident when the number of cells plotted in the grid is much smaller than the pixel resolution of the graphics device; under those conditions turning interpolation on will tend to smooth the original cells in the grid. This is only used by the new version of the function. }

  \item{col}{
A vector of colors to be used to plot values of the grid.   If \code{use.old} is \code{FALSE} this is interpolated to create a color gradient with \code{nramp} values.  If \code{use.old} is \code{TRUE} this is passed to \code{link{image}}.
}

\item{nramp}{ 
The number of distinct colors to be used when plotting. The default color palette or the palette specified by \code{col} is interpolated to create this many colors.  
}
\item{reverse.col}{ If \code{TRUE} the color ramp will be reversed. 
}

  \item{\dots}{Other arguments to \code{\link{image}} or \code{\link{rasterImage}}.}
 
 \item{xlab, ylab}{
the label for the x and y axes.  (Only used if \code{use.old} is \code{TRUE}.)
}

}
\details{
This is a convenience wrapper for either \code{\link{rasterImage}} or \code{\link{image}}.  By default it causes the grid to be plotted with a 1:1 aspect ratio and a grayscale color ramp. 
}
\value{
Nothing is returned.
}
 \note{
 When \code{use.old} is \code{FALSE} this function uses \code{rasterImage} this is a much better way of plotting rasters than the older \code{\link{image}} function.  However, it fails on remote desktop connections in Windows under the default configuration.  To configure remote desktop so that this function will work follow directions here:
 \url{http://r.789695.n4.nabble.com/R-base-package-grid-does-not-output-raster-image-td4672188.html}
 
 }

\author{
Ethan Plunkett
}

\seealso{
\code{\link[gridio]{plotextent}}
}
\examples{



### Setup a temporary directory with a sample grid in it 
require(gridio)
datapath <- system.file("exampledata", package="gridio")  # grid path to example grid
datapath <- shortPathName(datapath)
datapath <- paste(datapath, "/.", sep="")
dir <- tempdir() # get temporary directory
dir.create(dir)
# Copy example data into temporary directory
file.copy(datapath, dir, recursive=TRUE)
###  Done setting up directory

### Do some plotting
cleanup() # disconnect from any prior gridservers 
gridinit() # initialize local gridserver with base path in temporary dir
dem <- paste(dir, "/dem", sep="")

setwindow(dem) # setwindow to dem file
g <- readgrid(dem)
plot(g)
plot(g, na.col="yellow")
plot(g, use.old=TRUE) # use older version of the function

### Cleanup
gridkill(dem)
cleanup()

}
\keyword{ spatial }
