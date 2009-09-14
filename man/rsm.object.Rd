\name{rsm.object}
\alias{rsm.object}
\title{
  Regression-Scale Model Object
}
\description{
  Class of objects returned when fitting a regression-scale model.
}
\arguments{
  The following components must be included in a \code{rsm} object:
    \item{coefficients}{
      the coefficients of the linear predictor, which multiply the 
      columns of the model matrix.  The names of the coefficients are 
      the names of the single-degree-of-freedom effects (the columns 
      of the model matrix).  If the model is over-determined there will
      be missing values in the coefficients corresponding to 
      inestimable coefficients.
    }
    \item{dispersion}{
      the (estimated or known) value of the scale parameter.
    }
    \item{fixed}{
      a logical value.  If \code{TRUE}, the scale parameter is fixed.
    }
    \item{residuals}{
      the response residuals from the fit.  If weights were used, they
      are not taken into account.  If you need other kinds of 
      residuals, use the \code{\link{residuals.rsm}} function.
    }
    \item{fitted.values}{
      the fitted values from the fit.  If weights were used, the fitted 
      values are not adjusted for the weights.
    }
    \item{loglik}{
      the log likelihood from the fit.
    }
    \item{q1}{
      the value of the first derivative of minus the log density for 
      each observation.
    }
    \item{q2}{
      the value of the second derivative of minus the log density for
      each observation.    
    }
    \item{rank}{
    the computed rank (number of linearly independent columns in the
    model matrix).
    }
    \item{R}{
      the unscaled observed information matrix.
    }
    \item{score.dispersion}{
      a list containing the value of the objective function, its gradient
      and the convergence diagnostic, that result from estimating the 
      scale parameter.
    }
    \item{iter}{
      the number of \acronym{IRLS} iterations used to compute the 
      estimates. 
    }
    \item{weights}{
      the (optional) weights used for the fit.
    }
    \item{assign}{
      the list of assignments of coefficients (and effects) to the terms
      in the model.  The names of this list are the names of the terms.
      The \emph{i}th element of the list is the vector saying which 
      coefficients correspond to the \emph{i}th term.  It may be of 
      length 0 if there were no estimable effects for the term.
    }
    \item{df.residuals}{
      the number of degrees of freedom for residuals.
    }
    \item{family}{
      the entire \code{family.rsm} object used. 
    }
    \item{user.def}{
      a logical value.  If \code{TRUE}, the error distribution is 
      user-defined.
    }
    \item{dist}{
      a character string representing the name of the error 
      distribution.
    }
    \item{formula}{
      the model formula.
    }
    \item{data}{
      the data frame in which to interpret the variables occurring in 
      the model formula, or in the \code{subset} and the \code{weights} 
      arguments to \code{rsm}.  
    }
    \item{terms}{
      an object of mode \code{expression} and class \code{term}
      summarizing the formula.
    }
    \item{contrasts}{
      a list containing sufficient information to construct the contrasts
      used to fit any factors occurring in the model.  The list contains
      entries that are either matrices or character vectors.  When a 
      factor is coded by contrasts, the corresponding contrast matrix is
      stored in this list.  Factors that appear only as dummy variables 
      and variables in the model that are matrices correspond to 
      character vectors in the list.  The character vector has the level
      names for a factor or the column labels for a matrix.
    }
    \item{control}{
      a list of iteration and algorithmic constants used in \command{rsm}
      to fit the model.
    }
    \item{call}{
      an image of the call that produced the object, but with the 
      arguments all named and with the actual formula included as the 
      formula argument.
    }
    \item{y}{
      optionally the response, if \code{y = TRUE} in the original 
      \code{rsm} call.
    }
    \item{x}{
      optionally the model matrix, if \code{x = TRUE} in the original 
      \code{rsm} call.
    }
    \item{model}{
      optionally the model frame, if \code{model = TRUE} in the original     
      \code{rsm} call.
    }
}
\section{Generation}{
  This class of objects is returned by the \code{\link{rsm}} function 
  to represent a fitted regression-scale model.  Class \code{rsm} 
  inherits from classes \code{\link[stats]{glm}} and 
  \code{\link[stats]{lm}}, since it is fitted by iteratively reweighted
  least squares.  The object returned has all the components of a 
  weighted least squares object.  
}
\section{Methods}{
  Objects of this class have methods for the functions 
  \code{\link[base]{print}}, \code{\link[base]{summary}}, 
  \code{\link[stats]{anova}} and \code{\link[stats]{fitted}} among 
  others.
}
\note{
  The residuals, fitted values and coefficients should be extracted by 
  the generic functions of the same name, rather than by the \code{$} 
  operator. 
}
\seealso{
  \code{\link{rsm}}, \code{\link[stats]{glm}}, \code{\link[stats]{lm}}.
}
\keyword{classes}
\keyword{models}
\keyword{regression}
