parseerror <-
function(err.code, where){
  # Internal function for parsing Edi's error codes
  # The function returns nothing but calls stop and warning if there is an error or warning
  if(err.code > 0) return() # all errors are negative
  r <- .errtable$code==err.code 
  if(sum(r)==0){
    error <- paste("Caps_lib.dl reported an unrecognized error code: ", err.code)
    warning.only <- FALSE
  } else {
    error <- .errtable$error[r]
    warning.only <- .errtable$warning.only[r]
  }
  if(warning.only){
    warning(paste("In " , where, ": ", error, sep=""), call.=FALSE) 
  } else {
    stop(paste("In ", where, ": ", error, sep=""), call.=FALSE) 
  }
  return()
}

