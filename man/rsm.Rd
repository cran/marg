\name{rsm}
\alias{rsm}
\title{
  Fit a Regression-Scale Model
}
\description{
  Produces an object of class \code{rsm} which is a regression-scale
  model fit of the data.
}
\usage{
rsm(formula = formula(data), family = gaussian, 
    data = sys.frame(sys.parent()), dispersion = NULL, 
    weights = NULL, subset = NULL, na.action = na.fail, 
    offset = NULL, method = "rsm.surv", 
    control = glm.control(maxit=100, trace=FALSE), 
    model = FALSE, x = FALSE, y = TRUE, contrasts = NULL, \dots)
}
\arguments{
  \item{formula}{
    a formula expression as for other linear regression models, of the 
    form \code{response ~ predictors} where the predictors are 
    separated  by suitable operators.  See the documentation of 
    \code{\link[stats]{lm}} and \code{\link[stats]{formula}} for details.
  }
  \item{family}{
    a \code{family.rsm} object, i.e. a list of functions and
    expressions characterizing the error distribution.  Families
    supported are \code{gaussian}, \code{student} (Student's t),
    \code{extreme} (Gumbel or extreme value), \code{logistic},
    \code{logWeibull}, \code{logExponential}, \code{logRayleigh}
    and \code{Huber} (Huber's least favourable).  These represent
    calls to the corresponding generator functions.  The calls to
    \code{gaussian}, \code{extreme}, \code{logistic},
    \code{logWeibull}, \code{logExponential} and \code{logRayleigh}
    can be given without parentheses.  The functions \code{student}
    and \code{Huber} may take as argument respectively the degrees
    of freedom (\code{df}) and the tuning constant
    (\code{k}).  Users can construct their own
    families, as long as they have components compatible with those
    given in \code{\link{rsm.distributions}}.  The demonstration file
    \file{margdemo.R} that ships with the package 
    shows how to create a new generator function.  The default is
    \code{gaussian}.
  }
  \item{data}{
    an optional data frame in which to interpret the variables 
    occurring in the model formula, or in the \code{subset} and the 
    \code{weights} arguments.  If this is missing, then the variables 
    in the formula should be on the search list. 
  }
  \item{dispersion}{
    if \code{NULL}, the scale parameter is taken to be unknown.  If 
    known, the numerical value can be passed.  The default is 
    \code{NULL}.  Huber's least favourable distribution represents a 
    special case.  If \code{dispersion} is \code{NULL}, the maximum 
    likelihood estimate is computed, while if \code{TRUE} the 
    \acronym{MAD} estimate is calculated and the scale parameter fixed 
    to this value in subsequent computations.
  }
  \item{weights}{
    the optional weights for the fitting criterion.  If supplied, the
    response variable and the covariates are multiplied by the weights
    in the \acronym{IRLS} algorithm.  The length of the \code{weights}
    argument must be the same as the number of observations.  The 
    weights must be nonnegative and it is strongly recommended that 
    they be strictly positive, since zero weights are ambiguous, 
    compared to use of the \code{subset} argument.
  }
  \item{subset}{
    expression saying which subset of the rows of the data should be 
    used in the fit.  This can be a logical vector (which is 
    replicated to have length equal to the number of observations), or 
    a numeric vector indicating which observation numbers are to be 
    included, or a character vector of the row names to be included.  
    All observations are included by default.
  }
  \item{na.action}{
    a function to filter missing data.  This is applied to the model 
    frame after any \code{subset} argument has been used.  The 
    default (with \code{na.fail}) is to create an error if any missing 
    value is found.  A possible alternative is \code{na.omit}, which 
    deletes observations that contain one or more missing values.
  }
  \item{offset}{
    this can be used to specify an \emph{a priori} known component to
    be included in the linear predictor during fitting.  An 
    \code{offset} term can be included in the formula instead or as 
    well, and if both are specified their sum is used.  Defaults to
    \code{NULL}
  }
  \item{method}{
    the fitting method to be used; the default is \code{rsm.fit}.  The
    method \code{model.frame} simply returns the model frame.
  }
  \item{control}{
    a list of iteration and algorithmic constants.  See 
   \code{\link{glm.control}} for their names and default values. 
  }
  \item{model}{
    if \code{TRUE}, the model frame is returned; default is 
    \code{FALSE}.
  }
  \item{x}{
    if \code{TRUE}, the model matrix is returned; default is 
    \code{FALSE}.
  }
  \item{y}{
    if \code{TRUE}, the response variable is returned; default is 
    \code{TRUE}.
  }
  \item{contrasts}{
    a list of contrasts to be used for some or all of the factors
    appearing as variables in the model formula.  The names of the 
    list should be the names of the corresponding variables, and the 
    elements should either be contrast-type matrices (matrices with 
    as many rows as levels of the factor and with columns linearly 
    independent of each other and of a column of one's), or else 
    they should be functions that compute such contrast matrices.
  }
  \item{\dots}{
    absorbs any additional argument.
  }
}
\details{
  The model is fitted using \emph{Iteratively Reweighted Least 
  Squares}, \acronym{IRLS} for short (\cite{Green, 1984}, 
  \cite{Jorgensen, 1984}).  The working response and iterative 
  weights are computed using the functions contained in the 
  \code{family.rsm} object.  

  The two workhorses of \code{rsm} are \code{\link{rsm.fit}} and 
  \code{\link{rsm.surv}}, which expect an \code{X} and \code{Y} 
  argument rather then a formula.  The first function is used for the 
  families \code{student} with \code{df} \eqn{<}{less than} 3 and 
  \code{Huber}; 
  the second one, based on the \code{\link{survreg.fit}} 
  routine for fitting parametric survival models, is used in case of 
  \code{extreme}, \code{logistic}, \code{logWeibull}, 
  \code{logExponential}, \code{logRayleigh} and \code{student} (with 
  \code{df} > 2) error distributions.  In the presence of a 
  user-defined error distribution the \code{rsm.fit} routine is used.
  The \code{\link{rsm.null}} function is invoked to fit an empty (null)
  model.

  The details are given in \cite{Brazzale (2000, Section 6.3.1)}.
}
\value{
  an object of class \code{rsm} is returned which inherits from 
  \code{glm} and \code{lm}.  See \code{\link{rsm.object}} for details.

  The output can be examined by \code{\link[base]{print}}, 
  \code{\link[base]{summary}}, \code{\link{rsm.diag.plots}} and 
  \code{\link[stats]{anova}}.  Components can be extracted using 
  \code{\link{fitted}}, \code{\link[stats]{residuals}}, 
  \code{\link[stats]{formula}} and \code{\link[stats]{family}}.  It can 
  be modified using \code{\link[stats]{update}}. It has most of the 
  components of a \code{glm} object, with a few more.  Use 
  \code{\link{rsm.object}} for further details.
}
\note{
  In case of \code{extreme}, \code{logistic}, \code{logWeibull},
  \code{logExponential}, \code{logRayleigh} and \code{student} (with
  \code{df} > 2) error distributions, both methods,
  \code{\link{rsm.fit}} (default choice) and
  \code{\link{rsm.surv}}, can be used to fit the model.
  There are, however, examples where one of the two algorithms (most 
  likely the one invoked by \code{\link{rsm.surv}}) breaks 
  down.  If this is the case, try and refit the model with the 
  alternative choice.  

  %The argument \code{control = glm.control(trace = T)} forces iteration
  %details to be printed during the execution of the program.  However,
  %this only works for the \code{student}, \code{Huber} and 
  %user-defined families if the default settings of \code{rsm} are 
  %used.  For the \code{extreme}, \code{logistic}, 
  %\code{logWeibull}, \code{logExponential} and \code{logRayleigh}
  %error distributions this can be accomplished by choosing as fitting
  %method \code{method = rsm.fit} instead of the (internal) default
  %\code{rsm.surv}.

  The message \code{"negative iterative weights returned!"} is 
  returned if some of the iterative weights (\code{q2} component of 
  the fitted \code{rsm} object) are negative.  These would be used by 
  default by the \code{\link{rsm.diag}} routine for the definition of 
  residuals and regression diagnostics.  In order to avoid missing 
  values (\code{NA}s), the default weighting scheme \code{"observed"} 
  automatically switches to \code{"score"} unless otherwise specified.
}
\references{
  Brazzale, A. R. (2000) \emph{Practical Small-Sample Parametric
  Inference}.  Ph.D. Thesis N. 2230, Department of Mathematics, Swiss
  Federal Institute of Technology Lausanne.

  Green, P. J. (1984) Iteratively reweighted least squares for maximum 
  likelihood estimation, and some robust and resistant alternatives 
  (with Discussion).  \emph{J. R. Statist. Soc. } B, \bold{46}, 
  149--192.
  
  Jorgensen, B. (1984) The delta algorithm and GLIM.  \emph{Int. Stat.
  Rev.}, \bold{52}, 283--300.
}
\seealso{
  \code{\link{rsm.object}}, \code{\link{rsm.fit}}, 
  \code{\link{rsm.surv}}, \code{\link{rsm.null}},
  \code{\link{rsm.families}}  
}
\examples{
## House Price Data
data(houses)
houses.rsm <- rsm(price ~ ., family = student(5), data = houses)
## model fit including all covariates
houses.rsm <- rsm(price ~ ., family = student(5), data = houses, 
                  method = "rsm.fit", control = glm.control(trace = TRUE))
## prints information about the iterative procedure at each iteration
update(houses.rsm, ~ . - bdroom + offset(7 * bdroom))
## "bdroom" is included as offset variable with fixed (= 7) coefficient

## Sea Level Data
data(venice)
attach(venice)
Year <- 1:51/51
venice.2.rsm <- rsm(sea ~ Year + I(Year^2), family = extreme)
## quadratic model fitted to sea level data
venice.1.rsm <- update(venice.2.rsm, ~. - I(Year^2))
## linear model fit
##
c11 <- cos(2*pi*1:51/11) ; s11 <- sin(2*pi*1:51/11)
c19 <- cos(2*pi*1:51/18.62) ; s19 <- sin(2*pi*1:51/18.62)
venice.rsm <- rsm(sea ~ Year + I(Year^2) + c11 + s11 + c19 + s19, 
                  family = extreme)
## includes 18.62-year astronomical tidal cycle and 11-year sunspot cycle
venice.11.rsm <- rsm(sea ~ Year + I(Year^2) + c11 + s11, family = extreme)
venice.19.rsm <- rsm(sea ~ Year + I(Year^2) + c19 + s19, family = extreme)
## includes either astronomical cycle
##
## comparison of linear, quadratic and periodic (11-year, 19-year) models 
plot(year, sea, ylab = "sea level") 
lines(year, fitted(venice.1.rsm))
lines(year, fitted(venice.2.rsm), col="red")
lines(year, fitted(venice.11.rsm), col="blue")
lines(year, fitted(venice.19.rsm), col="green")
##
detach()

## Darwin's Data on Growth Rates of Plants
data(darwin)
darwin.rsm <- rsm(cross - self ~ pot - 1, family  =  student(3), 
                  data = darwin)
## Maximum likelihood estimates
darwin.rsm <- rsm(cross - self ~ pot - 1, family = Huber, data = darwin)
## M-estimates
}
\keyword{models}
\keyword{regression}
