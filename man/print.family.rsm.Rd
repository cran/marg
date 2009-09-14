\name{print.family.rsm}
\alias{print.family.rsm}
\title{
  Use print() on a ``family.rsm'' object
}
\description{
  This is a method for the function \code{print()} for objects 
  inheriting from class \code{family.rsm}.  See 
  \code{\link[base]{print}} or \code{\link[base]{print.default}} for 
  the general behaviour of this function.
}
\usage{
\method{print}{family.rsm}(x, \dots)
}
\details{
 A \code{family.rsm} object is a list of functions and expressions.  
  All that is printed is an identification label.  To see the 
  functions themselves, access the individual components, or use 
  \code{print.default()} or \code{unclass()}.
}
\seealso{
  \code{\link{family.rsm.object}}, \code{\link[base]{print}},
  \code{\link[base]{print.default}}
}
\examples{
student(df = 3) ## generates Student's t error distribution family
## 
## g  :  function (y, df, ...)  (df + 1)/2 * log(1 + y^2/df)
## g' :  function (y, df, ...)  (df + 1) * y/(df + y^2)
## g'':  function (y, df, ...)  (df + 1) * (df - y^2)/(df + y^2)^2
##
## df : 3
unclass(student(df = 3))
## $family
## [1] "student"
##
## $g0
## function(y,df,...)  (df+1)/2*log(1+y^2/df)
##
## $g1
## function(y,df,...)  (df+1)*y/(df+y^2)
##
## $g2
## function(y,df,...)  (df+1)*(df-y^2)/(df+y^2)^2
##
## $df
## [1] 3
##
## $k
## NULL
}
\keyword{internal}
\keyword{methods}
\keyword{print}

