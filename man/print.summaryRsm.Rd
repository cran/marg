\name{print.summaryRsm}
\alias{print.summaryRsm}
\title{
  Use print() on a ``summaryRsm'' object
}
\description{
  This is a method for the function \code{print()} for objects 
  inheriting from class \code{summaryRsm}.  See 
  \code{\link[base]{print}} or \code{\link[base]{print.default}} for 
  the general behaviour of this function and for the interpretation 
  of \code{x}, \code{digits}, \code{signif.stars} and \code{quote}.
}
\usage{
\method{print}{summaryRsm}(x, digits=max(3, getOption("digits")-3), 
      signif.stars = getOption("show.signif.stars"), quote=TRUE, \dots)
\method{print}{summaryRsm}(x, digits, signif.stars, quote = TRUE, \dots)
}
\seealso{
  \code{\link{summary.rsm}}, \code{\link[base]{print}},
  \code{\link[base]{print.default}}
}
\keyword{internal}
\keyword{methods}
\keyword{print}
