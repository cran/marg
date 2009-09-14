\name{rsm.null}
\alias{rsm.null}
\title{  
  Fit an Empty Regression-Scale Model
}
\description{
  Fits a \code{rsm} model with empty model matrix.
}
\usage{
rsm.null(X = NULL, Y, offset, family, dispersion, maxit, epsilon, 
         trace, \dots)
}
\arguments{
  \item{X}{ 
    defaults to \code{NULL}.  
  }
  \item{Y}{
    the response vector.
  }
  \item{dispersion}{
    either \code{NULL} or \code{TRUE}.  If \code{NULL}, the 
    \acronym{MLE} of the scale parameter is returned.  If Huber's least
    favourable distribution is used and \code{dispersion} is 
    \code{TRUE}, the \acronym{MAD} is computed and the scale parameter 
    fixed to this value in subsequent calculations.
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
  The \code{rsm.null} function is called internally by the 
  \code{\link{rsm}} routine to do the actual model fitting in case of an
  empty model.  It is not intended to be used directly by the user.  As
  no \code{weights} argument is available, the response \code{Y} and 
  the model matrix \code{X} must already include the weights if 
  weighting is desired.
}
\value{
  an object which is a subset of a \code{rsm} object. 
}
\seealso{
  \code{\link{rsm}}, \code{\link{rsm.surv}}, \code{\link{rsm.fit}}, 
  \code{\link{rsm.object}}, \code{\link{rsm.families}}
}
\keyword{models} 
\keyword{regression} 
