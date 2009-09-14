\name{residuals.rsm}
\alias{residuals.rsm}
\title{
  Compute Residuals for Regression-Scale Models
}
\description{
  Computes one of the six types of residuals available for 
  regression-scale models.
}
\usage{
\method{residuals}{rsm}(object, type = c("deviance", "pearson", 
                           "response", "r.star", "prob", "deletion"),
          weighting = "observed", \dots)
}
\arguments{
  \item{object}{
    an object inheriting from class \code{rsm} representing a fitted
    regression-scale model.
  }
  \item{type}{
    character string; defines the type of residuals, with choices 
    \code{"deviance"}, \code{"pearson"}, \code{"response"}, 
    \code{"r.star"}, \code{"prob"} or \code{"deletion"}; the first 
    is the default.
  }
  \item{weighting}{
    character string; defines the weight matrix that should be used in
    the calculation of the residuals and diagnostics.  Possible 
    choices are \code{"observed"}, \code{"score"}, \code{"deviance"} 
    and \code{"max"}; see \cite{Jorgensen (1984)} for their 
    definition.  The default is \code{"observed"}. 
  }
  \item{\dots}{
    absorbs any additional argument.
  }
}
\details{
  This is a method for the function \code{residuals()} for objects
  inheriting from class \code{rsm}.  As several types of residuals are
  available for \code{rsm} objects, there is an additional optional
  argument \code{type}.  The \code{"deviance"}, \code{"pearson"},
  \code{"r.star"}, \code{"prob"} and \code{"deletion"} residuals are
  derived from the final \acronym{IRLS} fit.  The \code{"response"} residuals 
  are standardized residuals on the scale of the response, the 
  \code{"prob"} residuals are on the \eqn{U(0,1)}{Unif(0,1)} scale, 
  whereas the remaining ones follow approximately the standard normal 
  distribution.

  The default weighting scheme used is \code{"observed"}.  The weights
  used are the values stored in the \code{q2} component of the 
  \code{rsm} object.  Some of the \acronym{IRLS} weights 
  returned by \code{rsm} may be negative if the error distribution 
  is Student's t or user-defined.  In order to avoid missing values 
  in the residuals, the default weighting scheme used is then 
  \code{"score"} unless otherwise specified.  The \code{"score"} 
  weights are also used by default if Huber's least favourable error 
  distribution is used.

  More details, in particular of the use of these residuals, are 
  given in \cite{Brazzale (2000, Section 6.3.1).}
}
\value{
  A numeric vector of residuals.  See \cite{Davison and Snell (1991)} 
  for detailed definitions of each type of residual.
}
\references{
  Brazzale, A. R. (2000) \emph{Practical Small-Sample Parametric
  Inference}.  Ph.D. Thesis N. 2230, Department of Mathematics, Swiss
  Federal Institute of Technology Lausanne.

  Davison, A. C. and Snell, E. J. (1991) Residuals and diagnostics.  
  In \emph{Statistical Theory and Modelling: In Honour of Sir David 
  Cox} (eds. D.V. Hinkley, N. Reid, and E.J. Snell), 83--106.  London:
  Chapman \& Hall.

  Davison, A. C. and Tsai, C.-L. (1992) Regression model diagnostics. 
  \emph{Int. Stat. Rev.}, \bold{60}, 337--353.

  Jorgensen, B. (1984).  The delta algorithm and GLIM.  
  \emph{Int. Stat. Rev.}, \bold{52}, 283--300.
}
\note{
  The \code{summary} method for \code{rsm} objects produces 
  response residuals.  The \code{residuals} component of a \code{rsm} 
  object contains the response residuals.
}
\seealso{
  \code{\link{rsm.object}}, \code{\link[stats]{residuals}}
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
##
residuals(venice.rsm)
## deviance residuals with observed weights
residuals(venice.rsm, type = "r.star", weighting = "score")
## r* residuals with score weights
detach()
}
\keyword{methods}
\keyword{models}
\keyword{regression}










