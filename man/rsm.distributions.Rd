\name{rsm.distributions}
\alias{rsm.distributions}
\title{
  RSM Family Support Object
}
\description{
  Support object for regression-scale models
}
\details{
  This is a matrix object used in the construction of \code{family.rsm} 
  objects.  It is of mode \code{list}, and has dimension \code{c(3,5)}.  
  The 5 columns in

  \code{rsm.distributions[[functionName, familyName]]}

  represent the distributions \code{student} (Student's t),
  \code{logistic}, \code{logWeibull}, \code{extreme} (Gumbel 
  or extreme value) and \code{Huber} (Huber's least favourable).  
  The rows \code{g0}, \code{g1} and \code{g2} contain functions that
  define minus the corresponding log density and its first and second
  derivatives.  They take a single argument for the families
  \code{logistic}, \code{logWeibull} and \code{extreme}, while for the
  families \code{student} and \code{Huber} they have a further
  argument, respectively \code{df} and \code{k}, which denote the
  degrees of freedom and the tuning constant.

  This object is used by the functions \code{make.family.rsm} and,
  indirectly, by \code{rsm} when constructing a \code{family.rsm}
  object.  See the documentation of \code{\link{family.rsm.object}}
  and \code{\link{make.family.rsm}} for additional details.
}
\seealso{
  \code{\link{family.rsm.object}}, \code{\link{make.family.rsm}},
  \code{\link{rsm}}
}
\examples{
rsm.distributions[["g0", "student"]]
}
\keyword{classes}
\keyword{regression}
\keyword{internal}
