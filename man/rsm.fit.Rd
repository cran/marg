\name{rsm.fit}
\alias{rsm.fit}
\title{
  Fit a Regression-Scale Model Without Computing the Model Matrix
}
\description{
  Fits a \code{rsm} model without computing the model matrix of the 
  response vector.
}
\usage{
rsm.fit(X, Y, offset, family, dispersion, score.dispersion, maxit, epsilon, 
        trace, \dots)
}
\arguments{
  \item{X}{
    the model matrix (design matrix).
  }
  \item{Y}{
    the response vector.
  }
  \item{dispersion}{
    if \code{NULL}, the \acronym{MLE} of the scale parameter is returned, 
    otherwise the scale parameter is fixed to the numerical value 
    passed through the argument.  If Huber's least favourable 
    distribution is used and \code{dispersion} is \code{TRUE}, the 
    \acronym{MAD} is computed and the scale parameter fixed to this 
    value in subsequent calculations.
  }
  \item{score.dispersion}{
  	must default to \code{NULL}.
  }	
  \item{offset}{
    optional offset added to the linear predictor.
  }
  \item{family}{
    a \code{family.rsm} object, i.e. a list of functions and 
    expressions characterizing the error distribution.  Families 
    supported are \code{gaussian}, \code{student} (Student's t), 
    \code{extreme} (Gumbel or extreme value), \code{logistic}, 
    \code{logWeibull}, \code{logExponential}, \code{logRayleigh} and 
    \code{Huber} (Huber's least favourable).  Users can construct their
    own families, as long as they have components compatible with those
    given in \code{\link{rsm.distributions}}.  The demonstration file
    \file{margdemo.R} that ships with the package shows how to
    create a new generator function.
  }
  \item{maxit}{
    maximum number of iterations allowed.
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
  The \code{rsm.fit} function is called internally by the 
  \code{\link{rsm}} routine to do the actual model fitting.  Although 
  it is not intended to be used directly by the user, it may be useful
  when the same data frame is used over and over again.  It might save
  computational time, since the model matrix is not created.  No 
  formula needs to be specified as an argument.  As no \code{weights}
  argument is available, the response \code{Y} and the  model matrix 
  \code{X} must already include the weights if weighting is desired.
}
\value{
  an object which is a subset of a \code{rsm} object. 
}
\note{
  The \code{rsm.fit} function is the workhorse of the \code{\link{rsm}}
  fitting routine for the \code{student} (with \code{df} 
  \eqn{\leq}{less or equal} 2), \code{Huber} and user-defined error 
  distributions.  It receives \code{X} and \code{Y} data rather than a 
  formula, but still uses the \code{family.rsm} object to define the 
  \acronym{IRLS} steps.  Users can write
  their own versions of \code{rsm.fit}, and pass the name of their 
  function via the \code{method} argument to \code{rsm}.  Care should 
  be taken to include as many of the arguments as feasible, but 
  definitely the \code{\dots} argument, which will absorb any 
  additional argument given in the call from \code{rsm}.
}
\seealso{
  \code{\link{rsm}}, \code{\link{rsm.surv}}, \code{\link{rsm.null}}, 
  \code{\link{rsm.object}}, \code{\link{rsm.families}}
}
\keyword{models}
\keyword{regression}
