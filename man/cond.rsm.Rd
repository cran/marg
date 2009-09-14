\name{cond.rsm}
\alias{cond.rsm}
\title{
  Approximate Conditional Inference in Regression-Scale Models
}
\description{
  Performs approximate conditional inference on a scalar parameter of 
  interest in regression-scale models.  The output is stored in an 
  object of class \code{marg}. 
}
\usage{
\method{cond}{rsm}(object, offset, formula = NULL, family = NULL, 
     dispersion = NULL, data = sys.frame(sys.parent()), pts = 20, 
     n = max(100, 2*pts), tms = 0.6, from = NULL, to = NULL, 
     control = glm.control(\dots), trace = FALSE, \dots)
}
\arguments{
  \item{object}{
    a \code{rsm} object; for instance the result of a call to 
    \code{\link{rsm}}.
  }
  \item{offset}{
    either the covariate occurring in the model formula whose 
    coefficient represents the parameter of interest or \code{scale} 
    if the parameter of interest is the scale parameter.  In the first 
    case, the variable may be numerical or a two-level factor.  In case
    of a two-level factor, it must be coded by contrasts and not as two
    dummy variables.  Can also be a call to a mathematical function 
    (such as \code{exp}, \code{sin}, \ldots) or to a mathematical 
    operator (\code{^}, \code{/}, \ldots) applied to a numerical 
    variable.  The call must always agree with the label used to identify
    the corresponding parameter in the \code{rsm} object passed through
    the \code{object} argument or defined by \code{formula} and 
    \code{family}.  Beware that the label includes the identity 
    function \code{I()} if an arithmetic operator was used.  Other 
    function types (e.g. \code{factor}) and interactions are not 
    admitted.  If interest focuses on the scale parameter, it must not
    be fixed in \code{object} or when using the \code{dispersion} 
    argument in case no \code{rsm} object is supplied. 
  }
  \item{formula}{
    a formula expression (only if no \code{rsm} object is defined).
  }
  \item{family}{
    a \code{family.rsm} object defining the error distribution (only if
    no \code{rsm} object is defined).  See \code{\link{rsm.families}} 
    for the families supported. 
  }
  \item{dispersion}{
    argument only to be used if no \code{rsm} object is defined.  If 
    \code{NULL}, the scale parameter is taken to be unknown.  If known,
    the numerical value can be passed.  The default is \code{NULL}.  
    Huber's least favourable error distribution represents a special 
    case.  If \code{dispersion} is \code{NULL},  the maximum likelihood
    estimate is computed, while if \code{TRUE} the \acronym{MAD} 
    estimate is calculated and the scale parameter fixed to this value
    in subsequent computations.
  }
  \item{data}{
    an optional data frame in which to interpret the variables 
    occurring in the formula (only if no \code{rsm} object is defined).
  }
  \item{pts}{
    number of output points (minimum 10) that are calculated exactly; 
    the default is 20. 
  }
  \item{n}{
    approximate number of output points (minimum 50) produced by the 
    spline interpolation.  The default is the maximum between 100 and 
    twice \code{pts}.
  }
  \item{tms}{
    defines the range \acronym{MLE} +/- \code{tms} * \acronym{s.e.} 
    where cubic spline interpolation is replaced by polynomial 
    interpolation.  The default is 0.6.
  }
  \item{from}{
    starting value of the sequence that contains the values of the 
    parameter of interest for which output points are calculated 
    exactly.  The default is \acronym{MLE} - 3.5 * \acronym{s.e.}
  }
  \item{to}{
    ending value of the sequence that contains the values of the 
    parameter of interest for which output points are calculated 
    exactly.  The default is \acronym{MLE} + 3.5 * \acronym{s.e}.
  }
  \item{control}{
    a list of iteration and algorithmic constants that control the 
    \code{rsm} fit.  See \code{\link{glm.control}} for their names and
    default values.  
  }
  \item{trace}{
    if \code{TRUE}, iteration numbers will be printed.
  }
  \item{\dots}{
    additional arguments, such as \code{weights}, \code{subset}, 
    \code{control} etc. used by the \code{rsm} fitting routine if the 
    \code{rsm} object is defined through \code{formula} and
    \code{family}.  See \code{\link{rsm}} for their definition and use.
  }
}
\details{
  This function is a method for the generic function \code{\link{cond}}
  for class \code{rsm}.  It can be invoked by calling \code{cond} for 
  an object of the appropriate class, or directly by calling 
  \code{cond.rsm} regardless of the class of the object.  
  \code{cond.rsm} has also to be used if the \code{rsm} object is not 
  provided throught the \code{object} argument but specified by 
  \code{formula} and \code{family}.

  The function \code{cond.rsm} implements several small sample 
  asymptotic methods for approximate conditional inference in 
  regression-scale models.  Approximations for both the modified/marginal 
  log likelihood function and approximate conditional/marginal tail 
  probabilities are 
  available (see \code{\link{marg.object}} for details).  Attention is
  restricted to a scalar parameter of interest, either a regression 
  coefficient or the scale parameter.  In the first case, the 
  associated covariate may be either numerical or a two-level factor. 

  Approximate conditional (or equivalently marginal) inference is performed 
  by either updating a 
  fitted regression-scale model or defining the model formula and 
  family.  All approximations are calculated exactly for \code{pts} 
  equally spaced points ranging from \code{from} to \code{to}.  A 
  spline interpolation is used to extend them over the whole interval 
  of interest, except for the range of values defined by \acronym{MLE}
  +/- \code{tms} * \acronym{s.e.} where the spline interpolation is 
  replaced by a higher order polynomial interpolation.  This is done 
  in order to avoid numerical instabilities which are likely to occur
  for values of the parameter of interest close to the \acronym{MLE}.  
  Results 
  are stored in an object of class \code{marg}.  Method functions 
  like \code{\link[base]{print}}, \code{\link[base]{summary}} and 
  \code{\link[graphics]{plot}} can be used to examine the output or 
  represent it graphically.  Components can be extracted using 
  \code{\link[stats]{coef}}, \code{\link[stats]{formula}} and 
  \code{\link[stats]{family}}.

  Main references for the methods considered are the papers by 
  \cite{Barndorff-Nielsen (1991)}, \cite{DiCiccio, Field and Fraser 
  (1990)} and \cite{DiCiccio and Field (1991)}.  The theory and 
  statistics used are summarized in \cite{Brazzale (2000, Chapters 2 
  and 3)}.  More details of the implementation are given in 
  \cite{Brazzale (1999; 2000, Section 6.3.1)}.
}
\value{
  The returned value is an object of class \code{marg}; see 
  \code{\link{marg.object}} for details.
}
\note{
  If the parameter of interest is the scale parameter, all calculations
  are performed on the logarithmic scale, though most results are 
  reported on the original scale.  

  In rare occasions, \code{cond.rsm} dumps because of non-convergence 
  of the function \code{\link{rsm}} which is used to refit the model 
  for a fixed value of the parameter of interest.  This happens for 
  instance if this value is too extreme.  The arguments \code{from} 
  and \code{to} may then be used to limit the default range of 
  \acronym{MLE} +/- 3.5 * \acronym{s.e.}  A further possibility is to
  fine-tuning the constants (number of iterations, convergence
  threshold) that control the \code{rsm} fit through the 
  \code{control} argument. 

  \code{cond.rsm} may also dump if the estimate of the parameter of 
  interest is large (tipically > 400) in absolute value.  This may be 
  avoided by reparametrizing the model.
}
\references{
  Barndorff-Nielsen, O. E. (1991) Modified signed log likelihood ratio.
  \emph{Biometrika}, \bold{78}, 557--564.

  Brazzale, A. R. (1999) Approximate conditional inference for logistic
  and loglinear models.  \emph{J. Comput. Graph. Statist.}, \bold{8},
  653--661.

  Brazzale, A. R. (2000) \emph{Practical Small-Sample Parametric 
  Inference}.  Ph.D. Thesis N. 2230, Department of Mathematics, Swiss
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
  \code{\link{marg.object}}, \code{\link{summary.marg}},
  \code{\link{plot.marg}}, \code{\link{rsm}}
}
\examples{
## Sea Level Data
data(venice)
attach(venice)
Year <- 1:51/51
c11 <- cos(2*pi*1:51/11) ; s11 <- sin(2*pi*1:51/11)
c19 <- cos(2*pi*1:51/18.62) ; s19 <- sin(2*pi*1:51/18.62)
##
## quadratic model fitted to the sea level, includes 18.62-year 
## astronomical tidal cycle and 11-year sunspot cycle
venice.rsm <- rsm(sea ~ Year + I(Year^2) + c11 + s11 + c19 + s19, 
                  family = extreme)
names(coef(venice.rsm))
## "(Intercept)"  "Year"  "I(Year^2)"  "c11"  "s11"  "c19"  "s19"      
##
## variable of interest: quadratic term
venice.marg <- cond(venice.rsm, I(Year^2))
##
detach()

## House Price Data
data(houses)
houses.rsm <- rsm(price ~ ., family = student(5), data = houses)
##
## parameter of interest: scale parameter
houses.marg <- cond(houses.rsm, scale)
}
\keyword{models}
\keyword{regression}
\keyword{methods}






