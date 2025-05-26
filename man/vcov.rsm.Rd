\name{vcov.rsm}
\alias{vcov.rsm}
\title{Calculate Variance-Covariance Matrix for a Fitted RSM Model}
\description{
  Returns the variance-covariance matrix of the parameters of a
  fitted \code{\link[marg]{rsm}} model object.
}
\usage{
\method{vcov}{rsm}(object, correlation = FALSE, \dots)
}
\arguments{
  \item{object}{ 
    a fitted model object of class \code{rsm}.
  }
  \item{correlation}{
    if \code{TRUE} the correlation matrix is returned instead of the
    variance-covariance matrix.
  }
  \item{\dots}{ 
    absobs any additional argument.
  }
}
\details{
  This is a method for function \code{\link[stats]{vcov}} for objects
  of class \code{rsm}.
}
\value{
  A matrix of the estimated covariances between the parameter
  estimates of a fitted regression-scale model, or, if 
  \code{dispersion = TRUE} the correlation matrix.
}
\seealso{
  \code{\link[stats]{vcov}}, \code{\link[marg]{rsm.object}},
  \code{\link[marg]{rsm}}, \code{\link[marg]{summary.rsm}}
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
vcov(venice.rsm)
vcov(venice.rsm, corr = TRUE)
##
detach()
}
\keyword{methods}
\keyword{models}
\keyword{regression}
