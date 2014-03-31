\name{print.marg}
\alias{print.marg}
\title{
  Use print() on a ``marg'' object
}
\description{
  This is a method for the function \code{print()} for objects 
  inheriting from class \code{marg}. See \code{\link[base]{print}} 
  and \code{\link[base]{print.default}} for the general behaviour of 
  this function and for the interpretation of \code{digits}.
}
\usage{
\method{print}{marg}(x, digits=max(3, getOption("digits")-3), ...)
\method{print}{marg}(x, digits, \dots)
}
\seealso{
  \code{\link{marg.object}}, \code{\link[base]{print}},
  \code{\link[base]{print.default}}
}
\keyword{internal}
\keyword{methods}
\keyword{print}
