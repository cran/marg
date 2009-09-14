\name{family.rsm}
\alias{family.rsm}
\title{
  Use family() on a ``rsm'' object
}
\description{
  This is a method for the function \code{family()} for objects 
  from which a \code{family.rsm} object can be extracted.  Typically 
  a fitted \code{rsm} model object.  See \code{\link[stats]{family}} for 
  the general behaviour of this function.
}
\usage{
\method{family}{rsm}(object, \dots)
}
\arguments{
  \item{object}{
    any object from which a \code{family.rsm} object can be extracted.   
  }
  \item{\dots}{
    absorbs any additional argument.  
  }
}
\seealso{
  \code{\link{family.rsm.object}}, \code{\link[stats]{family}}
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
family(venice.rsm)
detach()

## House Price Data
data(houses)
houses.rsm <- rsm(price ~ ., family = student(5), data = houses)
family(houses.rsm)
}
\keyword{classes} 
\keyword{methods}
