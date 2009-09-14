\name{family.rsm.object}
\alias{family.rsm.object}
\title{
  Family Object for Regression-Scale Models
}
\description{
  Class of objects that characterize the error distribution of a
  regression-scale model.
}
\section{Generation}{
  This class of objects is returned by a call to a \code{family.rsm} 
  generator function.  See \code{\link{rsm.families}} for the 
  distributions which are supported by the \code{marg} package.  The 
  object includes a list of functions and expressions that 
  characterize the error distribution of a regression-scale model.  
  These are used by the \acronym{IRLS} algorithm implemented in the 
  \code{rsm} fitting routine.  New families can be added to the 
  ones already supported.  See the demonstration file 
  \file{margdemo.R} that ships with the package.  There is a 
  \code{print} method for \code{family.rsm} objects which 
  produces a simple summary without any detail; use 
  \code{unclass(family.rsm.object)} to see the contents.
}
\section{Structure}{
  The following components, with the corresponding functionality,
  are required for a \code{family.rsm} object:
  \describe{
    \item{\code{family}}{
      a character vector giving the family name.
    } 
    \item{\code{g0}}{
      a function that yields minus the log density of the error 
      distribution in the regression-scale model.
    }
    \item{\code{g1}}{
      a function that yields the first derivative of minus the 
      log density.
    }
    \item{\code{g2}}{
      a function that yields the second derivative of minus the 
      log density.
    }
    \item{\code{df}}{
      argument with \code{NULL} value; must be included to guarantee
      compatibility with the existing code.
    }
    \item{\code{k}}{
      argument with \code{NULL} value; must be included to guarantee
      compatibility with the existing code.
    }
  }
}
\note{
  For the sake of compatibility, the \code{g0}, \code{g1} and 
  \code{g2} functions of a user-defined family can only take two 
  arguments: \code{y} representing an observation and the 
  \code{\dots} argument which absorbes any additional arguments.
}
\seealso{\code{\link{rsm.families}}, \code{\link{family.rsm}}, 
         \code{\link{rsm}}
}
\keyword{methods}
\keyword{classes}
