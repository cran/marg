\name{anova.rsm}
\alias{anova.rsm}
\title{ANOVA Table for a RSM Object}
\description{
  This is a method for the function \code{anova()} for objects 
  inheriting from class \code{rsm}.  See \code{\link[stats]{anova}} 
  for the general behaviour of this function.
}
\usage{
\method{anova}{rsm}(object, \dots, test = c("Chisq", "none"))
}
\details{
  When called with a single \code{rsm} object, \code{anova.rsm} 
  may take a while to run, because it fully iterates a series of 
  \code{rsm} models.  The series is constructed by successively 
  adding to the null model all the terms in \code{object}, taken 
  in the order they appear in \code{terms(object)}.  
}
\note{
  For each term minus twice the log likelihood is returned instead
  of the residual sum of squares.  The degrees of freedom change 
  according to whether the scale parameter is known or not.
}
\seealso{
  \code{\link[stats]{anova}}, \code{\link{rsm.object}}, 
  \code{\link{rsm}}
}
\examples{
## Sea Level Data
data(venice)
attach(venice)
Year <- 1:51/51
c11 <- cos(2*pi*1:51/11) ; s11 <- sin(2*pi*1:51/11)
c19 <- cos(2*pi*1:51/18.62) ; s19 <- sin(2*pi*1:51/18.62)
venice.p <- rsm(sea ~ Year + I(Year^2) + c11 + s11 + c19 + s19, 
                family = extreme)
anova(venice.p)
##
venice.l <- rsm(sea ~ Year + I(Year^2), family = extreme)
anova(venice.p, venice.l)
##
detach()

## House Price Data
data(houses)
houses.rsm <- rsm(price ~ ., family = student(5), data = houses)
anova(houses.rsm)
}
\keyword{internal}
\keyword{methods}
\keyword{models}
\keyword{regression}
