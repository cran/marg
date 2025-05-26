\name{marg.object}
\alias{marg.object}
\title{
  Approximate Marginal Inference Object
}
\description{
  Class of objects returned when performing approximate conditional
  inference for regression-scale models.
}
\arguments{
  Objects of class \code{marg} are implemented as a list.  The 
  following components are included: 
  \item{workspace}{
    a list whose elements are the spline interpolations of several 
    first order and higher order statistics. They are used to 
    implement the following likelihood quantities:

      - the profile and modified profile/approximate marginal log 
        likelihoods;

      - the Wald pivots from the unconditional and 
        conditional/approximate marginal \acronym{MLE}s;

      - the profile and modified/approximate marginal likelihood roots;

      - the conditional/approximate marginal Lugannani-Rice tail area
        approximation;

      - the correction term used in the higher order statistics;

      - the conditional/marginal information and nuisance parameter 
        aspects.

    Method functions work mainly on this part of the object.  In order
    to avoid errors in the calculation of confidence intervals and 
    tail probabilities, this part of the object should not be 
    modified.
  }
  \item{coefficients}{
    a \eqn{2\times 2}{2x2} matrix containing the unconditional and 
    approximate conditional/marginal \acronym{MLE}s and their 
    standard errors.
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
  \item{diagnostics}{
    diagnostics related to the decomposition of the higher order
    adjustments into an information and a nuisance parameters term. 
  }
  \item{n.approx}{
    the number of output points for which the statistics have been 
    calculated exactly. 
  }
  \item{omitted.val}{
    the range of values omitted in the spline interpolation of some
    of the higher order statistics considered.  The aim is to avoid 
    numerical instabilities around the maximum likelihood estimate.
  }
  \item{is.scalar}{
    a logical value indicating whether there are any nuisance 
    parameters.  If \code{FALSE} there are none.
  }
  Main references for the methods considered are the papers by 
  \cite{Barndorff-Nielsen (1991)}, \cite{DiCiccio, Field and Fraser 
  (1990)} and \cite{DiCiccio and Field (1991)}.  The theory and 
  statistics used are summarized in \cite{Brazzale (2000, Chapters 2 
  and 3)}.  More details of the implementation and of the methods  
  considered are given in \cite{Brazzale (1999; 2000, Section 6.3.1)}.
}
\section{Generation}{
  This class of objects is returned from calls to the function 
  \code{\link{cond.rsm}}. 
}
\section{Methods}{
  The class \code{marg} has methods for \code{\link[base]{summary}}, 
  \code{\link[graphics]{plot}}, \code{\link[base]{print}}, 
  \code{\link[stats]{coef}} and \code{\link[stats]{family}}, among 
  others.
}
\note{
  If the parameter of interest is the scale parameter, all 
  calculations are performed on the logarithmic scale, though most 
  results are reported on the original scale.  
}
\references{
  Barndorff-Nielsen, O. E. (1991)  Modified signed log likelihood 
  ratio.  \emph{Biometrika}, \bold{78}, 557--564.

  Brazzale, A. R. (1999) Approximate conditional inference for 
  logistic and loglinear models.  \emph{J. Comput. Graph. Statist.}, 
  \bold{8}, 653--661.

  Brazzale, A. R. (2000) \emph{Practical Small-Sample Parametric
  Inference}. Ph.D. Thesis N. 2230, Department of Mathematics, Swiss
  Federal Institute of Technology Lausanne. 

  DiCiccio, T. J., Field, C. A. and Fraser, D. A. S. (1990) 
  Approximations of marginal tail probabilities and inference for 
  scalar parameters.  \emph{Biometrika}, \bold{77}, 77--95.

  DiCiccio, T. J. and Field, C. A. (1991) An accurate method for
  approximate conditional and Bayesian inference about linear 
  regression models from censored data.  \emph{Biometrika}, \bold{78},
  903--910.
}
\seealso{
  \code{\link{cond.rsm}}, \code{\link{summary.marg}},
  \code{\link{plot.marg}}
}
\keyword{models}
\keyword{regression}
\keyword{classes}
