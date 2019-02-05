if(FALSE){
  set.seed(1)
  g <- as.grid(matrix(runif(n = 48)> .7, 6, 8), xll = 0, yll = 0, cellsize = 10)
  g$m[2, 2] <- NA
  plot(g)
  plot(nibbleNA(g))
}



nibbleNA <- function (x) 
{
  UseMethod("nibbleNA")
}

nibbleNA.grid <- function(x){
  x$m <- nibbleNA(x$m)
  return(x)
}

nibbleNA.matrix <- function(x){
  # Function to replace NA values in a matrix with values of neighboring cells.
  # Makes only one pass replacing each NA with the mode of it's 8 neighbors (removing NA's)
  # Ties are broken deterministically in this order:
  #right, left, bottom, top, top left, bottom right, bottom left,  top right,
                    
  
  isNA <-is.na(x)
  r <- row(x)[isNA]
  c <- col(x)[isNA]
  
  # Generate matrix with a row for each NA cell and a column for each of the 
  # neighbors
  
  neighbors <- matrix(NA, nrow = length(c), ncol = 8)
  # row and column offsets of 8 neighbors  note the order determines precidence when there are ties
  # I've made the four orthagonal neighbors take precidence and tried to balance the order of the 
  # direction of precidence
  # I don't want to break ties randomly because I want it to be repeatable
  
  offsets <- matrix(c(0, 1,   #right
                      0, -1,    # left 
                      -1, 0, # Bottom
                    1, 0,   # top
                    1, -1,   # top left
                     -1, 1,   # Bottom right
                    -1, -1,   # Bottom left
                    1, 1),    # Top Right
                    byrow = TRUE, ncol = 2)  
  for(i in 1:8){
    offset.row <- r + offsets[i, 1]
    offset.col <-  c + offsets[i, 2]
    offset.row[ offset.row < 1 | offset.row > nrow(x)] <- NA
    offset.col[offset.col < 1 | offset.col > ncol(x)] <- NA
    ind <- cbind(offset.row, offset.col) 
    neighbors[, i] <- x[ ind]
  }
  
  # Calculate the mode of each row after removing NA values
  
  # Mode function from stack overflow 
  # https://stackoverflow.com/questions/2547402/is-there-a-built-in-function-for-finding-the-mode
  Mode <- function(x) {
    x = x[!is.na(x)] # I always want to remove NA
    ux <- unique(x)
    return(ux[which.max(tabulate(match(x, ux)))])
  }

  replacement <- apply(neighbors, 1, Mode)
  x[cbind(r, c)] <- replacement 
  
  return(x)
  
}