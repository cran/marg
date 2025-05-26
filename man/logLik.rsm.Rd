\name{logLik.rsm}
\alias{logLik.rsm}
\title{
  Compute the Log Likelihood for Regression-Scale Models
}
\description{
  Computes the log likelihood for regression-scale models.
}
\usage{
\method{logLik}{rsm}(object, \dots)
}
\arguments{
  \item{object}{
    an object inheriting from class \code{rsm} representing a fitted
    regression-scale model.
  }
  \item{\dots}{
    absorbs any additional argument.
  }
}
\details{
  This is a method for the function \code{logLik()} for objects
  inheriting from class \code{rsm}.  
}
\value{
  Returns an object class \code{logLik} which is a number
  with attributes, \code{attr(r, "df")} (degrees of freedom) 
  giving the number of parameters (regression coefficients plus
  scale parameter, if not fixed) in the model.  
}
\note{
  The default
  \code{print} method for \code{logLik} objects is used.
}
\seealso{
  \code{\link{rsm.object}}, \code{\link[stats]{logLik}}
}
\examples{
## Sea Level Data
data(venice)
attach(venice)
Year <- 1:51/51
c11 <- cos(2*pi*1:51/11) ; s11 <- sin(2*pi*1:51/11)
c19 <- cos(2*pi*1:51/18.62) ; s19 <- sin(2*pi*1:51/18.62)
venice.rsm <- rsm(sea ~ Year + I(Year^2) + c11 + s11 + c19 + s19, 
                  family = extreme)
##
logLik(venice.rsm)
detach()
}
\keyword{methods}
\keyword{models}
\keyword{regression}
