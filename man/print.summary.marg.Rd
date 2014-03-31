\name{print.summary.marg}
\alias{print.summary.marg}
\title{
  Use print() on a ``summary.marg'' object
}
\description{
  This is a method for the function \code{print()} for objects of 
  class \code{summary.marg}.  See \code{\link[base]{print}} 
  and \code{\link[base]{print.default}} for the general behaviour of 
  this function and for the interpretation of \code{digits}.
}
\usage{
\method{print}{summary.marg}(x, all = x$all, Coef = x$cf, int = x$int, test = x$hyp,
      digits = if(!is.null(x$digits)) x$digits else max(3, getOption("digits")-3),
      \dots)
\method{print}{summary.marg}(x, all, Coef, int, test, digits, \dots)
}
\arguments{
  \item{x}{
    a \code{summary.marg} object. This is assumed to be the result 
    returned by the \code{summary.marg} function.
  }
  \item{all}{
    if \code{TRUE} all the information stored in the 
    \code{summary.marg} object is printed, else only a subset of it.  
    The default is \code{FALSE}.
  }
  \item{Coef}{
    if \code{TRUE} all parameter estimates are printed.  The default 
    is \code{TRUE}.
  }
  \item{int}{
    if \code{TRUE} confidence intervals are printed.  The default is 
    \code{TRUE}.
  }
  \item{test}{
    if \code{TRUE} test statistics and tail probabilities are printed.
    The default is \code{FALSE}.
  }
  \item{digits}{
    the number of significant digits to be printed.  The default 
    depends on the value of \code{digits} set by \code{options}.
  }
  \item{\dots}{
    additional arguments.
  }
}
\details{
  Changing the default values of \code{all}, \code{Coef}, \code{int} 
  and \code{test} allows only a subset of the information in the 
  \code{summary.marg} object to be printed.  With \code{all = FALSE}, 
  one-sided confidence intervals and the Lugannani-Rice tail area 
  approximation are omitted.  See \code{\link{summary.marg}} for more 
  details.
}
\note{
  If the parameter of interest is the scale parameter, all 
  calculations are performed on the log scale, though most results 
  are reported on the original scale.  

  The amount of information printed may vary depending on whether 
  there are any nuisance parameters.  A message is printed if there 
  are none.
}
\seealso{
  \code{\link{summary.marg}}, \code{\link{marg.object}}
}
\examples{
## House Price Data
data(houses)
houses.rsm <- rsm(price ~ ., family = student(5), data = houses)
houses.cond <- cond(houses.rsm, front)
print(summary(houses.cond), digits = 4)
print(summary(houses.cond), Coef = FALSE)
}
\keyword{methods}
\keyword{print}
