\name{summary.rsm}
\alias{summary.rsm}
\title{
  Summary Method for Regression-Scale Models
}
\description{
  Returns a summary list for a fitted regression-scale model.
}
\usage{
\method{summary}{rsm}(object, correlation = FALSE, digits = NULL, \dots)
}
\arguments{
  \item{object}{
    a fitted \code{rsm} object.  This is assumed to be the result of 
    some fit that produces an object inheriting from the class 
    \code{rsm}, in the sense that the components returned by the 
    \code{rsm} function will be available.
  }
  \item{correlation}{
    logical argument.  If \code{TRUE}, the correlation matrix for the 
    coefficients is computed; default is \code{TRUE}.
  }
  \item{digits}{
    a non-null value specifies the minimum number of significant 
    digits to be printed in values.  If \code{NULL}, the value of 
    \code{digits} set by \code{options} is used.
  }
  \item{\dots}{
    absorbs any additional argument.
  }
}
\details{
  This function is a method for the generic function 
  \code{summary()} for class \code{rsm}.  It can be invoked by 
  calling \code{summary} for an object of the appropriate class, or
  directly by calling \code{summary.rsm} regardless of the class of
  the object.
}
\value{
  A list is returned with the following components:
  \item{coefficients}{
    a matrix with four columns, containing the coefficients, their 
    standard errors, the \eqn{z}{z}-values (or Wald statistics) and 
    the associated \eqn{p}{p}-values based on the standard normal 
    approximation to the distribution of the \eqn{z}{z} statistic.
  }
  \item{dispersion}{
    the value of the scale parameter used in the computations.
  }
  \item{fixed}{
    a logical value.  If \code{TRUE}, the scale parameter is known. 
  }
  \item{residuals}{
    the response residuals.
  }
  \item{cov.unscaled}{
    the unscaled covariance matrix, i.e, a matrix such that 
    multiplying it by the squared scale parameter, or an estimate 
    thereof, produces an estimated (asymptotic) covariance matrix for 
    the coefficients.
  }
  \item{correlation}{
    the computed correlation matrix for the coefficients in the model.
  }
  \item{family}{
    the entire \code{family.rsm} object used.
  }
  \item{loglik}{
    the computed log likelihood.
  }
  \item{terms}{
    an object of mode \code{expression} and class \code{term} 
    summarizing the formula.
  }
  \item{df}{
    the number of degrees of freedom for the model and for the 
    residuals.
  }
  \item{iter}{
    the number of \acronym{IRLS} iterations used to compute the estimates.
    }
  \item{nas}{
    a logical vector indicating which, if any, coefficients are 
    missing.
  }
  \item{call}{
    an image of the call that produced the \code{rsm} object, but 
    with the arguments all named and with the actual formula.
  }
  \item{digits}{
    the value of the \code{digits} argument.
  }
}
\seealso{
  \code{\link{rsm.object}}, \code{\link[base]{summary}},
  \code{\link{rsm}} 
}
\examples{
## House Price Data
data(houses)
houses.rsm <- rsm(price ~ ., family = student(5), data = houses)
summary(houses.rsm)
}
\keyword{models}
\keyword{regression}
\keyword{methods}












