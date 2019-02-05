readasciigrid <-
function(path, as.matrix=FALSE){
# ----------------------------------------------------------------
#readasciigrid    Ethan Plunkett Jan 2007
#Creates a "grid" object from an asci grid
#Modified Jan 2010 to conform to CAPSLib nomenclature and class
#and automatically substitue NA values
# ----------------------------------------------------------------
  
  h <- readasciigridheader(path)
  m <- as.matrix(utils::read.table(path, skip=6))
  
  m[m==h$na.value] <- NA
  if(as.matrix == TRUE) return(m)
  h <- h[names(h) != "na.value"]
  result <- list(m=m)
  result <- c(result, h)
  class(result)<-c("grid", class(result))
  return(result)
} # end readasciigrid function def.

