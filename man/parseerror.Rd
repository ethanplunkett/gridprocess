\name{parseerror}
\alias{parseerror}
\title{
Function to parse errors returned by capslib.dll.
}
\description{
This function is for internal use only. It processes the error codes returned from Edi's C library calling stop as appropriate with the slightly more understandable text equivalents of the error codes.
}
\usage{
parseerror(err.code, where)
}
\arguments{
  \item{err.code}{
The error code returned by Edi's function. An integer, negative numbers are errors.
}
  \item{where}{
The function in which parseerror is being called. Allows the stop message to identify where the error occurred.
}
}
\value{
Returns nothing. 
}
\author{
Ethan Plunkett
}
\examples{

parseerror(1, "test")

}
\keyword{ spatial }
