\name{anova.rsmlist}
\alias{anova.rsmlist}
\title{
  Use anova() on a ``rsmlist'' object
}
\usage{ 
\method{anova}{rsmlist}(object, \dots, test = c("Chisq", "none"))
}
\description{
  This is a method for the function \code{anova()} for objects
  inheriting from class \code{rsmlist}.  See 
  \code{\link[stats]{anova}} and \code{\link{anova.rsm}} for the 
  general behaviour of this function and for the interpretation of the 
  arguments.
}
\seealso{
  \code{\link{anova.rsm}}, \code{\link[stats]{anova}}
}
\keyword{internal}
\keyword{methods}
\keyword{models}
\keyword{regression}
