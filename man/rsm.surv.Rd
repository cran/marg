\name{rsm.surv}
\alias{rsm.surv}
\title{
  Fit a Regression-Scale Model Without Computing the Model Matrix
}
\description{
  Fits a \code{rsm} model without computing the model matrix of the 
  response vector.
}
\usage{
rsm.surv(X, Y, offset, family, dispersion, maxit, epsilon, trace, \dots)
}
\arguments{
  \item{X}{
    the model matrix (design matrix).
  }
  \item{Y}{
    the response vector.
  }
  \item{offset}{
    optional offset added to the linear predictor.
  }
  \item{family}{
    a \code{family.rsm} object, i.e. a list of functions and 
    expressions characterizing the error distribution.  Families 
    supported are \code{extreme} (Gumbel or extreme value), 
    \code{logWeibull}, \code{logExponential}, \code{logRayleigh}, 
    \code{logistic} and \code{student} (Student's t) with \code{df}
    \eqn{>}{larger than} 2.
  }
  \item{dispersion}{
    if \code{NULL}, the \acronym{MLE} of the scale parameter is 
    returned, otherwise the scale parameter is fixed to the numerical 
    value passed through the argument. 
  }
  \item{maxit}{
    maximum number of iterations.
  }
  \item{epsilon}{
    convergence threshold.
  }
  \item{trace}{
    if \code{TRUE}, iterations details are printed during execution.
  }
  \item{\dots}{
    not used, but do absorb any redundant argument.
  }
}
\details{
  The \code{rsm.surv} function is called internally by the 
  \code{\link{rsm}} routine to do the actual model fitting.  Although 
  it is not intended to be used directly by the user, it may be useful
  when the same data frame is used over and over again.  It might save
  computational time, since the model matrix is not created.  No 
  formula needs to be specified as an argument.  As no \code{weights}
  argument is available, the response \code{Y} and the  model matrix 
  \code{X} must already include the weights if weighting is desired.
}
\value{
  an object, which is a subset of a \code{rsm} object. 
}
\note{
  The \code{rsm.surv} function is the default option for 
  \code{\link{rsm}} for the \code{extreme}, \code{logistic}, 
  \code{logWeibull}, \code{logExponential}, \code{logRayleigh} and 
  \code{student} (with \code{df} larger than 2) error distributions. 
  It makes use of the \code{\link[survival]{survreg.fit}} routine to 
  estimate parametric survival models.  It receives \code{X} and 
  \code{Y} data rather than a formula, but still uses the 
  \code{family.rsm} object to define the \acronym{IRLS} steps.  The
  \code{rsm.surv} routine cannot be used for Huber-type and 
  user-defined error distributions.
}
\seealso{
  \code{\link{rsm}}, \code{\link{rsm.fit}}, \code{\link{rsm.null}},
  \code{\link{rsm.object}}, \code{\link{rsm.families}}
}
\keyword{models}
\keyword{regression}
