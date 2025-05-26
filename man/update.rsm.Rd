\name{update.rsm}
\alias{update.rsm}
\title{
  Update and Re-fit a RSM Model Call}
\description{
  \code{update.rsm} is used to update a \code{\link[marg]{rsm}} model 
  formulae.  This typically involves adding or dropping terms, but 
  updates can be more general.
}
\usage{
\method{update}{rsm}(object, formula., \dots, evaluate = TRUE)
}
\arguments{
  \item{object}{
    a model of class \code{rsm} to be updated.
  }
  \item{formula.}{
    changes to the formula -- see \code{\link[stats]{update.formula}} 
    for details.
  }
  \item{\dots}{
    additional arguments to the call, or arguments with changed
    values.  Use \code{name = NULL} to remove the argument 
    \code{name}.
  }
  \item{evaluate}{
    if \code{TRUE} evaluate the new call else return the call.
  }
}
\value{
  If \code{evaluate = TRUE} the fitted object, otherwise the updated 
  call.
}
\note{
  Based upon \code{\link{update.default}}.
}
\seealso{
  \code{\link[stats]{update}}, \code{\link{update.default}}, 
  \code{\link[stats]{update.formula}}
}
\examples{
data(houses)
houses.rsm <- rsm(price ~ ., family = student(5), data = houses)
## model fit including all covariates
##
houses.rsm <- update(houses.rsm, method = "rsm.fit", 
                     control = glm.control(trace = TRUE))
## prints information about the iterative procedure at each iteration
##
update(houses.rsm, ~ . - bdroom + offset(7 * bdroom))
## "bdroom" is included as offset variable with fixed (= 7) coefficient
}
\keyword{models}
\keyword{regression}
