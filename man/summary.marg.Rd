\name{summary.marg}
\alias{summary.marg}
\title{
  Summary Method for Objects of Class ``marg''
}
\description{
  Returns a summary list for objects of class \code{marg}.
}
\usage{
\method{summary}{marg}(object, alpha = 0.05, test = NULL, all = FALSE, 
        coef = TRUE, int = ifelse((is.null(test) || all), TRUE, FALSE), 
        digits = NULL, \dots)
}
\arguments{
  \item{object}{
    a \code{marg} object.  This is assumed to be the result returned 
    by the \code{\link{cond.rsm}} function.
  }
  \item{alpha}{
    a vector of levels for confidence intervals; the default is 5\%.
  }
  \item{test}{
    a vector of values of the parameter of interest one wants to test
    for.  If \code{NULL} no test is performed.  The default is 
    \code{NULL}.
  }
  \item{all}{
    logical value; if \code{TRUE} all the information stored in the 
    \code{summary.marg} object is printed, else only a subset of it.  
    The default is \code{FALSE}.
  }
  \item{coef}{
    logical value; if \code{TRUE} the unconditional and approximate 
    conditional/marginal \acronym{MLE}s are printed.  The default is 
    \code{TRUE}.
  }
  \item{int}{
    logical value; if \code{TRUE} confidence intervals are printed.  
    The default is \code{TRUE}.
  }
  \item{digits}{
    the number of significant digits to be printed.  The default depends 
    on the value of \code{digits} set by \code{options}
  }
  \item{\dots}{
    absorbs any additional argument.
  }
}
\details{
  This function is a method for the generic function \code{summary()} 
  for objects of class \code{marg}.  It can be invoked by calling 
  \code{summary} or directly \code{summary.marg} for an object of the 
  appropriate class.
}
\value{
  A list is returned with the following components:
  \item{coefficients}{
    a \eqn{2\times 2}{2x2} matrix containing the unconditional and 
    approximate conditional/marginal \acronym{MLE}s and their standard
    errors.
  }
  \item{conf.int}{
    a matrix containing, for each level given in \code{alpha}, the 
    upper and lower confidence bounds derived from several first and 
    higher order test statistics.  One-sided and two-sided confidence 
    intervals are considered.  See \code{\link{marg.object}} for 
    details on the test statistics used.
  }
  \item{signif.tests}{
    a list with two elements.  The first (\code{stats}) contains, for 
    each value given in \code{test}, the values and tail probabilities 
    of several first and higher order test statistics.  See 
    \code{\link{marg.object}} for details on the test statistics.  The
    second element of the list (\code{qTerm}) contains for each tested
    hypothesis the correction term used in the higher order solutions.
  }
  \item{call}{
    the function call that created the \code{marg} object.
  }
  \item{formula}{
    the model formula.
  }
  \item{family}{
    the name of the error distribution.
  }
  \item{offset}{
    the covariate occurring in the model formula whose coefficient 
    represents the parameter of interest or \code{scale} if the 
    parameter of interest is the scale parameter.
  }
  \item{alpha}{
    the vector of levels used to compute the confidence intervals.
  }
  \item{hypotheses}{
    the values for the parameter of interest that have been tested for.
  }
  \item{diagnostics}{
    the information and nuisance parameters aspects; see 
    \code{\link{marg.object}} for details.
  }
  \item{n.approx}{
    the number of output points that have been calculated exactly. 
  }
  \item{all}{
    logical value; if \code{TRUE}, all the information stored in the
    \code{summary.marg} object is printed.
  }
  \item{cf}{
    logical value; if \code{TRUE}, the parameter estimates are printed.
  }
  \item{int}{
    logical value; if \code{TRUE}, confidence intervals are printed.
  }
  \item{is.scalar}{
    a logical value indicating whether there are any nuisance 
    parameters.  If \code{FALSE} there are none.
  }
  \item{digits}{
    the number of significant digits to be printed.
  }
}
\note{
  If the parameter of interest is the scale parameter, all calculations
  are performed on the log scale, though most results are reported
  on the original scale.  

  The amount of information calculated may vary depending on whether 
  there are any nuisance parameters.  A message is printed if there are
  none.
}
\seealso{
  \code{\link[base]{summary}}, \code{\link{marg.object}}
}
\examples{
## House Price Data
data(houses)
houses.rsm <- rsm(price ~ ., family = student(5), data = houses)
houses.marg <- cond(houses.rsm, floor)
summary(houses.marg, test = 0, coef = FALSE)
}
\keyword{regression}
\keyword{methods}
