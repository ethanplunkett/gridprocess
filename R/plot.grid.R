plot.grid <- function(x, asp=1, xlab="x", ylab="y", 
                      min.val=min(x$m, na.rm=TRUE), 
                      max.val=max(x$m, na.rm=TRUE),
                      add=FALSE, 
                      na.col=NA, 
                      use.old=FALSE, 
                      interpolate=FALSE, 
                      col,
                      nramp=200,
                      reverse.col=FALSE,
                      ...){
  
  
  # Note there is a single pixel (not cell) registration shift between the old and new versions of this function.  I'm not sure why but I think it's due to the underlyig functions.
  if(!use.old){
    # check for availability of rasterImage device
    use.old <-  dev.capabilities()$rasterImage != "yes"
  }
  
  if(use.old){  # this is the old version of the function.  It draws with polygons via image which is currently supported by more devices
    if(missing(col)){ 
      val = seq(0,1, length.out=256)
      col <- rgb(val, val, val)
    }
    xcoords <- c2x(c=1:ncol(x$m), cellsize=x$cellsize, xll=x$xll)
    ycoords <- r2y(r=nrow(x$m):1, cellsize=x$cellsize, yll=x$yll, nrow=x$nrow)
    image(x=xcoords, y=ycoords, z=t((x$m))[,nrow(x$m):1], asp=1,xlab=xlab, ylab=ylab, col=col, add=add, ...)
  } else { # New version of the function it uses rasterImage function which draws pixels and is much faster but may not be supported by all devices
    adj = x$cellsize/2
    xmin = c2x(1, list=x)-adj
    xmax = c2x(ncol(x$m), list=x)+adj
    ymin = r2y(nrow(x$m), list=x)-adj
    ymax = r2y(1, list=x)+adj
      
	if(min.val==max.val){
	   m <- x$m - min.val  # special case where all cells have the same value
	} else {
	   m <- (x$m - min.val)/(max.val-min.val) # rescale to zero to 1
    }
  
  if(missing(col)){
    colpal <- c("#D7191C", "#FDAE61", "#FFFFBF", "#ABD9E9", "#2C7BB6") # from: brewer.pal(5, "RdYlBu")
  } else {
    colpal <- col
  }
  
    
    
    colfun <- colorRampPalette(colpal)
    colramp <- colfun(nramp) 
  
	if(reverse.col) 
	  colramp <- colramp[length(colramp):1] 
	

  
	m <- round(m * (nramp - 1) ) +1 # integers from 1 to nramp.
  
	if(!add){
	  l <- grDevices::as.raster(matrix(colramp[length(colramp):1], ncol=1, nrow=length(colramp)))
    
    legend.mar <- c(4, .1, 4, 4) + .1
	  char.width <- par("cin")[2]/par("din")[1] # as porportion of device width
    legend.width <- (sum(legend.mar[c(2, 4)]) + 1 ) * char.width
    
	  layout(matrix(c(2,1), 1, 2), widths=c(10-(legend.width*10), legend.width*10 ))
	  #layout.show(2)
    
    par(mar=legend.mar)
	  plot(NA,NA, xlim=c(0,1 ), ylim=c(min.val, max.val), , xlab=NA, ylab=NA, axes=FALSE )
	  rasterImage(l, 0, min.val, 1, max.val, interpolate=interpolate)
    axis(side=4, las=1, col=rgb(0, 0, 0, 0), col.ticks="black")
    
    par(mar=c(2, 2, 2, 0) + 0.1)
	  plot(NA,NA, xlim=c(xmin,xmax ), ylim=c(ymin, ymax), asp=asp,frame.plot=FALSE )
	}
  
	
  
  
  m <- matrix(colramp[m], nrow=x$nrow, ncol=x$ncol)
                      
	m <- as.raster(m)
    m[is.na(x$m)] <- na.col
    rasterImage(image=m,xleft=xmin, xright=xmax, ytop=ymax, ybottom=ymin,interpolate=interpolate, ...)
	 # rasterImage(image=m,xleft=xmin, xright=xmax, ytop=ymax, ybottom=ymin,interpolate=FALSE)
  }
}

