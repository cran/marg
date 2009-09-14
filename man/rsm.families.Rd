\name{rsm.families}
\alias{rsm.families}
\alias{extreme}
\alias{Huber}
\alias{logistic}
\alias{logWeibull}
\alias{student}
\title{
  Generate a RSM Family Object
}
\description{
  Generates a \code{family.rsm} object containing a list of functions 
  and expressions used by \code{rsm}.
}
\usage{
extreme()
Huber(k = 1.345)
logistic()
logWeibull()
student(df = value)
}
\synopsis{
student(df = stop("Argument \"df\" is missing, with no default"))
}
\arguments{
  \item{k}{
    the tuning constant in Huber's least favourable distribution.
  }
  \item{df}{
    the degrees of freedom in Student's t distribution.
  }
}
\details{
  Each of the names are associated with a member of the class of error 
  distributions for regression-scale models.  Users can construct 
  their own families, as long as they have components compatible with 
  those given in \code{rsm.distributions}.  The demonstration file 
  \file{margdemo.R} that accompanies the package shows how to 
  create a new generator function.  When passed as an argument to 
  \code{rsm} with the default setting, the empty parentheses 
  \code{()} can be omitted.  There is a \code{print} method for the
  class \code{family.rsm}.
}
\value{
  A \code{family.rsm} object, which is a list of functions and 
  expressions used by \code{rsm} in the iteratively reweighted 
  least-squares algorithm.  See \code{\link{family.rsm.object}} for 
  details.
}
\seealso{
  \code{\link{family.rsm.object}}, \code{\link{family.rsm}}, 
  \code{\link{rsm}}, \code{\link{Huber}}
}
\examples{
student(df = 3) ## generates Student's t error distribution with 3 d.f.
\dontrun{
rsm(formula = value, data = value, family = extreme)
}
}
\keyword{classes}
\keyword{methods}
