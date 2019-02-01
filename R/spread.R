spread <- function(x, ...) UseMethod("spread")

spread.matrix <- function(x, row, col, sd, cellsize=1, sd.threshold=3, ...){

	sd.cell <- sd/cellsize  #convert to cell units
						
	bank.account <- ceiling(sd.cell*sd.threshold)
		# make the bank account big enough to reach out to the 
		# threshold in a minimally resistant landscape 
		
	result <- rawspread(x, (bank.account), row, col)
		# rawspread returns the result of linear decay in the bank account (1  per cell) given a minimally resistant landscape

	# calculate cost distance to focal cell (accounting for resitance)
	dist.to.center <- (bank.account-result)*cellsize  
	gaussian.result <- dnorm(dist.to.center, mean=0, sd=sd)
		
	# Cleanup:
	gaussian.result[dist.to.center > sd.threshold*sd] <- 0
	gaussian.result[result==0]<-0	# This may be redundant.
					
	gaussian.result
} # end spread function definition


spread.grid <- function(x, row, col, sd,  sd.threshold = 3, ...){
  x$m <- spread(x$m, row = row, col = col, sd = sd, sd.threshold = sd.threshold)
  x
}
  

