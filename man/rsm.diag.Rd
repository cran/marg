\name{rsm.diag}
\alias{rsm.diag}
\title{
  Diagnostics for Regression-Scale Models 
}
\description{
  Calculates different types of residuals, Cook's distance and the
  leverages for a regression-scale model.
}
\usage{
rsm.diag(rsmfit, weighting = "observed")
}
\arguments{
  \item{rsmfit}{
    an \code{rsm} object, i.e. the result of a call to \code{rsm}.
  }
  \item{weighting}{
    character string; defines the weight matrix that should be used 
    in the calculation of the residuals and diagnostics.  Possible 
    choices are \code{"observed"}, \code{"score"}, \code{"deviance"} 
    and \code{"max"}; see \cite{Jorgensen (1984)} for their 
    definition.  The default is \code{"observed"}.
  }
}
\details{
  If the weighting scheme is \code{"observed"}, the weights used are 
  the values stored in the \code{q2} component of the \code{rsm} 
  object \code{rsmfit}.  Otherwise, they are calculated by 
  \code{rsm.diag}.  Some of the \acronym{IRLS} weights returned by 
  \code{rsm} may be negative if the error distribution is Student's
  t or user-defined.  In order to avoid missing values in the 
  residuals and regression diagnostics, the default weighting scheme 
  used in \code{rsm.diag} switches automatically from 
  \code{"observed"} to \code{"score"} unless otherwise specified.  The
  \code{"score"} weights are also used by default if Huber's least 
  favourable error distribution is used.

  There are three types of residuals.  The response residuals are 
  taken on the response scale, whereas the probability transform 
  residuals are on the \eqn{U(0,1)}{Unif(0,1)} scale.  The remaining 
  ones follow approximately the standard normal distribution.  

  More details and in particular the definitions of the above 
  residuals and diagnostics can be found in \cite{Brazzale (2000, 
  Section 6.3.1)}.
}
\value{
  Returns a list with the following components:
  \item{resid}{
    the response residuals on the response scale.
  }
  \item{rd}{
    the standardized deviance residuals from the \acronym{IRLS} fit.
  }
  \item{rp}{
    the standardized Pearson residuals from the \acronym{IRLS} fit.
  }
  \item{rg}{
    the deletion residuals from the \acronym{IRLS} fit.
  }
  \item{rs}{
    the \eqn{r^*}{r*} residuals from the \acronym{IRLS} fit.
  }
  \item{rcs}{
    the probability transform residuals from the \acronym{IRLS} fit.
  }
  \item{cook}{
    Cook's distance.
  }
  \item{h}{
    the leverages of the observations.
  }
  \item{dispersion}{
    the value of the scale parameter.
  }
}
\note{
  Huber's least favourable distribution represents a special case.  
  The regression diagnostics are only meaningful if the errors 
  \emph{truly} follow a Huber-type distribution.  This no longer holds
  if the option \code{family = Huber} in \code{rsm} is used to 
  obtain the M-estimates of the parameters in place or the maximum 
  likelihood estimates.
}
\section{Acknowledgments}{
  This function is based on A.J. Canty's function \code{glm.diag} 
  contained in the package \pkg{boot}.
}
\references{
  Brazzale, A. R. (2000) \emph{Practical Small-Sample Parametric 
  Inference}.  Ph.D. Thesis N. 2230, Department of Mathematics, Swiss 
  Federal Institute of Technology Lausanne.

  Jorgensen, B. (1984) The delta algorithm and GLIM.  \emph{Int. Stat.
  Rev.}, \bold{52}, 283--300.

  Davison, A. C. and Snell, E. J. (1991) Residuals and diagnostics.  
  In \emph{Statistical Theory and Modelling: In Honour of Sir David 
  Cox} (eds. D. V. Hinkley, N. Reid, and E. J. Snell), 83--106.  
  London: Chapman & Hall.

  Davison, A. C. and Tsai, C.-L. (1992)  Regression model diagnostics.
  \emph{Int. Stat. Rev.}, \bold{60}, 337--353.
}
\seealso{
  \code{\link{rsm.diag.plots}}, \code{\link{rsm.object}}, 
  \code{\link{summary.rsm}}
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
venice.diag <- rsm.diag(venice.rsm)
## observed weights
detach()

## Darwin's Data on Growth Rates of Plants
data(darwin)
darwin.rsm <- rsm(cross-self ~ pot - 1, family = Huber, data = darwin)
darwin.diag <- rsm.diag(darwin.rsm)
## score weights
}
\keyword{models}
\keyword{regression}
















