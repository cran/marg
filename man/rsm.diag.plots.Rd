\name{rsm.diag.plots}
\alias{rsm.diag.plots}
\alias{plot.rsm}
\title{
  Diagnostic Plots for Regression-Scale Models
}
\description{
  Generates diagnostic plots for a regression-scale model using 
  different types of residuals, Cook's distance and the leverages.    
}
\usage{
rsm.diag.plots(rsmfit, rsmdiag = NULL, weighting = NULL, 
               which = NULL, subset = NULL, iden = FALSE, 
               labels = NULL, ret = FALSE, \dots)
\method{plot}{rsm}(x, \dots)
}
\arguments{
  \item{rsmfit, x}{
    a \code{rsm} object, i.e. the result of a call to \code{rsm}.
  }
  \item{rsmdiag}{
    the object returned by a call to \code{rsm.diag} containing the
    regression diagnostics for the regression-scale model defined by 
    \code{rsmfit}.  If not supplied, this object is created by 
    \code{rsm.diag.plots} and returned upon request (if 
    \code{ret = TRUE}).
  }
  \item{weighting}{
    character string; defines the weight matrix that should be used in
    the calculation of the residuals and diagnostics.  Possible  
    choices are \code{"observed"}, \code{"score"}, \code{"deviance"} 
    and \code{"max"}; see \cite{Jorgensen (1984)} for their 
    definition.  Will only be used if the \code{rsmdiag} argument is
    missing.
  }
  \item{which}{
    which plot to print.  Admissible values are \code{2} to \code{7} 
    corresponding to the choices in the menu below.
  }
  \item{subset}{
    subset of data used in the original \code{rsm} fit: should be 
    the same than the \code{subset} option used in the call to 
    \code{rsm} which generated \code{rsmfit}.  Needed only if the
    \code{subset} option was used in the call to \code{rsm}.  
  }
  \item{iden}{
    logical argument.  If \code{TRUE}, the user will be prompted after
    the plots are drawn.  A positive integer will select a plot and 
    invoke \code{identify()} on that plot.  After exiting 
    \code{identify()}, the user is again prompted, this loop 
    continuing until the user responds to the prompt with \code{0}.  
    If \code{iden} is \code{FALSE} (default) the user cannot 
    interact with the plots.
  }
  \item{labels}{
    a vector of labels for use with \code{identify()} if 
   \code{iden} is \code{TRUE}.  If it is not supplied, then the 
   labels are derived from \code{rsmfit}.
  }
  \item{ret}{
    logical argument indicating if \code{rsmdiag} should be 
    returned; the default is \code{FALSE}.
  }
  \item{\dots}{
    additional arguments such as graphical parameters.
  }
}
\details{
  The diagnostics required for the plots are calculated by 
  \code{\link{rsm.diag}}.  These are then used to produce the plots
  on the current graphics device.

  A menu lists all the plots that can be produced. They may be one or 
  all of the following:

  \preformatted{
 Make a plot selection (or 0 to exit)

1: All
2: Response residuals against fitted values
3: Deviance residuals against fitted values
4: QQ-plot of deviance residuals
5: Normal QQ-plot of r* residuals
6: Cook statistic against h/(1-h)
7: Cook statistic against observation number

Selection:
  }

  In the normal scores plots, the dotted line represents the expected 
  line if the residuals are normally distributed, i.e. it is the line 
  with intercept 0 and slope 1.

  In general, when plotting Cook's distance against the standardized 
  leverages, there will be two dotted lines on the plot.  The 
  horizontal line is at \eqn{8/(n-2p)}{8/(n-2p)}, where \eqn{n}{n} is 
  the number of observations and \eqn{p}{p} is the number of 
  estimated parameters.  Points above this line may be points with 
  high influence on the model.  The vertical line is at 
  \eqn{2p/(n-2p)}{2p/(n-2p)} and points to the right of this line have
  high leverage compared to the variance of the raw residual at that 
  point.  If all points are below the horizontal line or to the left 
  of the vertical line then the line is not shown.

  Use of \code{iden = TRUE} is encouraged for proper exploration of 
  these plots as a guide to how well the model fits the data and 
  whether certain observations have an unduly large effect on 
  parameter estimates.
}
\value{
  If \code{ret} is \code{TRUE} then the value of \code{rsmdiag} 
  is returned, otherwise there is no returned value.
}
\section{Side Effects}{
  The current device is cleared.  If \code{iden = TRUE}, interactive 
  identification of points is enabled.  All screens are closed, but 
  not cleared, on termination of the function.
}
\section{Acknowledgments}{
  This function is based on A. J. Canty's function 
  \code{glm.diag.plots} contained in the package \pkg{boot}.
}
\references{
  Davison, A. C. and Snell, E. J. (1991) Residuals and diagnostics.  
  In \emph{Statistical Theory and Modelling: In Honour of Sir David 
  Cox} (eds. D. V. Hinkley, N. Reid, and E. J. Snell), 83--106.  
  London: Chapman & Hall, London.

  Davison, A. C. and Tsai, C.-L. (1992) Regression model diagnostics.
  \emph{Int. Stat. Rev.}, \bold{60}, 337--353.

  Jorgensen, B. (1984) The Delta Algorithm and GLIM.  \emph{Int. Stat.
  Rev.}, \bold{52}, 283--300.
}
\seealso{
  \code{\link{rsm.diag}}, \code{\link{rsm.object}}, 
  \code{\link[graphics]{identify}}
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
\dontrun{
rsm.diag.plots(venice.rsm, which = 3)
}
## or
\dontrun{
plot(venice.rsm)
}
## menu-driven
##
rsm.diag.plots(venice.rsm, which = 5, las = 1)
## normal QQ-plot of r* residuals 
\dontrun{
rsm.diag.plots(venice.rsm, which = 7, iden = T, labels = paste(1931:1981))
}
## year 1932 highly influential
detach()
}
\keyword{hplot}
\keyword{models}
\keyword{regression}











