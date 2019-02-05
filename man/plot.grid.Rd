\name{plot.grid}
\alias{plot.grid}

\title{
Plot a grid object
}
\description{
This function plots a grid object. By default it uses a black and white color gradient.
}
\usage{
\method{plot}{grid}(x, asp = 1, xlab = "x", ylab = "y", 
    min.val = min(x$m, na.rm = TRUE), max.val = max(x$m, na.rm = TRUE), 
    add = FALSE, na.col = NA, use.raster = TRUE, interpolate = FALSE, col, 
    nramp=200, reverse.col=FALSE, restore.par = TRUE, ..., use.old)
}


\arguments{
  \item{x}{
a \code{\link{grid}} object.
}
  \item{asp}{
the aspect ratio of the plot.
}

  \item{min.val, max.val}{
The minimum and maximum values used for converting the values in the grid to the
colors. Defaults to the minumum and maximum value in the grid. Only relevant 
when \code{use.old} is \code{FALSE}
}
\item{add}{If \code{TRUE} the image is overlayed on the current plot otherwise 
a new plot is generated.}

\item{na.col}{The color to be used to plot NA values. By default they are left 
as NA which is plotted as transparent on most devices. This is only used when
\code{use.raster} is \code{TRUE}.}

\item{use.raster}{If \code{TRUE}  \code{\link[graphics]{rasterImage}} is used 
for plotting. If \code{FALSE} \code{\link[graphics]{image}} is used. \code{TRUE} 
results in a faster and better plot but isn't supported on all machines, but 
Windows RDC users see note.}

\item{interpolate}{This determines whether linear interpolation is used. The 
effect of changing this argument will be most evident when the number of cells
plotted in the grid is much smaller than the pixel resolution of the graphics 
device; under those conditions turning interpolation on will tend to smooth the
original cells in the grid. This is only used by the new version of the 
function. }

  \item{col}{
A vector of colors to be used to plot values of the grid.   If \code{use.old} is
\code{FALSE} this is interpolated to create a color gradient with \code{nramp}
values.  If \code{use.old} is \code{TRUE} this is passed to \code{link[graphics]{image}}.
}

\item{nramp}{ 
The number of distinct colors to be used when plotting. The default color 
palette or the palette specified by \code{col} is interpolated to create 
this many colors.  
}
\item{reverse.col}{ If \code{TRUE} the color ramp will be reversed. 
}

\item{restore.par}{ If \code{TRUE} (the default) graphics options (set by 
\code{\link[graphics]{par}}) will be restored to their original settings. 
Use \code{FALSE} if you wish to plot additional information on top of the 
raster, however, this will leave the graphics device in a non-standard state - 
one way to return to normal is with \code{\link[grDevices]{dev.off}} which will close 
the device, allowing for a new device with default \code{par} settings. }

  \item{\dots}{Other arguments to \code{\link[graphics]{image}} or \code{\link[graphics]{rasterImage}}.}
 
 \item{xlab, ylab}{
the label for the x and y axes.  (Only used if \code{use.old} is \code{TRUE}.)
}

\item{use.old}{ Depreciated.  use.old = TRUE has the same effect as use.raster = FALSE.}

}
\details{
This is a convenience wrapper for either \code{\link{rasterImage}} or \code{\link{image}}.  By default it causes the grid to be plotted with a 1:1 aspect ratio and a grayscale color ramp. 
}
\value{
Nothing is returned.
}
 \note{
 When \code{use.raster} is \code{TRUE} this function uses \code{\link[graphics]{rasterImage}}
 this is a much better way of plotting rasters than the older 
 \code{\link{image}} function.  However, it fails on remote desktop connections
 in Windows under the default configuration.  To configure remote desktop so 
 that this function will work follow directions here:
 
 \url{http://r.789695.n4.nabble.com/R-base-package-grid-does-not-output-raster-image-td4672188.html}
 
 }

\author{
Ethan Plunkett
}

\seealso{
\code{\link{grid}}
}
\examples{



# Convert meause.grid into a grid object
library(sp)
data(meuse.grid)
d <- meuse.grid
coordinates(d) <- c("x", "y")
g <- as.grid(d, 3)

# Plot
plot(g)
plot(g, na.col="yellow")
plot(g, use.raster = FALSE) #  may work better on some devices

}
\keyword{ spatial }
