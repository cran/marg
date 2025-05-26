 \name{cond}
\alias{cond}
\title{
  Approximate Conditional Inference - Generic Function
}
\description{
  Performs approximate conditional inference.
}
\usage{
cond(object, offset, \dots)
}
\arguments{
  \item{object}{
    a fitted model object.  Families supported are binomial and 
    Poisson with canonical link function (class \code{glm}), and 
    regression-scale models (class \code{rsm}).  
  }
  \item{offset}{
    the covariate occurring in the model formula whose coefficient
    represents the parameter of interest.  May be numerical or a 
    two-level factor.  In case of a two-level factor, it must be 
    coded by contrasts and not appear as two dummy variables in the 
    model.  Can also be a call to a mathematical function (such as 
    \code{exp}, \code{sin}, \ldots) or to a mathematical 
    operator (\code{\^}, \code{/}, \ldots) applied to a 
    numerical variable.  The call must always agree with the label 
    used to identify the corresponding parameter in the fitted model 
    object passed through the \code{object} argument.  Beware that 
    the label includes the identity function \code{I()} if an 
    arithmetic operator was used.  Other function types (e.g. 
    \code{factor}) and interactions are not admitted.
  }
  \item{\dots}{
    absorbs any additional arguments.  See \code{\link[cond]{cond.glm}} 
    and \code{\link[marg]{cond.rsm}} for details.
  }
}
\details{
  This function is generic (see \code{\link[utils]{methods}}); method
  functions can be written to handle specific classes of data.  
  Classes which already have methods for this function include: 
  \code{glm} and \code{rsm}. 
}
\value{
  The returned value is an \emph{approximate conditional inference}
  object.  Classes already supported are \code{cond} and 
  \code{marg} depending on whether the fitted model object passed 
  through the \code{object} argument has class \code{glm} or 
  \code{rsm}.  See \code{\link[cond]{cond.object}} or 
  \code{\link[marg]{marg.object}} for more details.
}
\references{
  Brazzale, A. R. (2000) \emph{Practical Small-Sample Parametric 
  Inference}.  Ph.D. Thesis N. 2230, Department of Mathematics, Swiss 
  Federal Institute of Technology Lausanne.  Chapter 6.
}
\seealso{
  \code{\link[cond]{cond.glm}}, \code{\link[marg]{cond.rsm}}, 
  \code{\link[cond]{cond.object}}, \code{\link[marg]{marg.object}}
}
\examples{
## Urine Data 
\dontrun{
data(urine)
urine.glm <- glm(r ~ gravity + ph + osmo + cond + urea + log(calc), 
                 family = binomial, data = urine)
##
## function call as offset variable 
labels(coef(urine.glm))
cond(urine.glm, log(calc))
##
## large estimate of regression coefficient
urine.glm <- glm(r ~ gravity + ph + osmo + cond + urea + calc, 
                 family = binomial, data = urine)
coef(urine.glm)
urine.glm <- glm(r ~ I(gravity * 100) + ph + osmo + cond + urea + calc, 
                 family = binomial, data = urine)
coef(urine.glm)
urine.cond <- cond(urine.glm, I(gravity * 100))
plot(urine.cond, which = 4)
}

## House Price Data
data(houses)
houses.rsm <- rsm(price ~ ., family = student(5), data = houses)
##
## parameter of interest: scale parameter
houses.marg <- cond(houses.rsm, scale)
plot(houses.marg, which = 2)
}
\keyword{models}
\keyword{regression}
\keyword{methods}

