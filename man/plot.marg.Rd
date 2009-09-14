\name{plot.marg}
\alias{plot.marg}
\title{
  Generate Plots for an Approximate Marginal Inference Object
}
\description{
  Creates a set of plots for an object of class \code{marg}.
}
\usage{
\method{plot}{marg}(x = stop("nothing to plot"), from = x.axis[1], to = x.axis[n], 
     which = NULL, alpha = 0.05, add.leg = TRUE, loc.leg = FALSE, 
     add.labs = TRUE, cex = 0.7, cex.lab = 1, cex.axis = 1, 
     cex.main = 1, lwd1 = 1, lwd2 = 2, lty1 = "solid", 
     lty2 = "dashed", col1 = "black", col2 = "blue", tck = 0.02, 
     las = 1, adj = 0.5, lab = c(15, 15, 5), \dots)           
}
\arguments{
  \item{x}{
    a \code{marg} object.  This is assumed to be the result returned 
    by the \code{\link{cond.rsm}} function.
  }
  \item{from}{
    the starting value for the x-axis range.  The default value has 
    been set by \code{cond.rsm}.
  }
  \item{to}{
    the ending value for the x-axis range.  The default value has been 
    set by \code{cond.rsm}.
  }
  \item{which}{
    which plot to print.  Admissible values are \code{2} to \code{7} 
    corresponding to the choices in the menu below.
  }
  \item{alpha}{
    the level used to read off confidence intervals; the default is 
    5\%.
  }
  \item{add.leg}{
    if \code{TRUE}, a legend is added to each plot; default is 
    \code{TRUE}.
  }
  \item{loc.leg}{
    if \code{TRUE}, the position of the legend can be located by hand; 
    default is \code{FALSE}.
  }
  \item{add.labs}{
    if \code{TRUE}, labels are added; default is \code{TRUE}.
  }
  \item{cex, cex.lab, cex.axis, cex.main}{
    the character expansions relative to the standard size of the 
    device to be used for printing text, labels, axes and main title. 
    See \code{\link[graphics]{par}} for details. 
  }
  \item{lwd1, lwd2}{
    the line widths used to compare different curves in the same plot; 
    default is \code{lwd2 = 2} for higher order solutions and 
    \code{lwd1 = 1} for first order solutions.
  }
  \item{lty1, lty2}{
    line type used to compare different curves in the same plot; 
    default is \code{lty2 = "dashed"} for the Wald statistic and 
    \code{lty1 = "solid"} for the remaining first and higher order 
    statistics.
  }
  \item{col1, col2}{
    colors used to compare different curves in the same plot; default 
    is \code{col2 = "blue"} for higher order solutions, and 
    \code{col1 = "black"} for the remaining first order statistics.
  }
  \item{tck, las, adj, lab}{
    further graphical parameters.  See \code{\link[graphics]{par}} for 
    details. 
  }
  \item{\dots}{
    optional graphical parameters; see \code{\link[graphics]{par}} for 
    details.  
  }
}
\details{
  Several plots are produced for an object of class \code{marg}.  A 
  menu lists all the plots that can be produced.  They may be one or 
  all of the following ones:
  \preformatted{
 Make a plot selection (or 0 to exit)

1: All
2: Profile and modified profile log likelihoods
3: Profile and modified profile likelihood ratios
4: Profile and modified likelihood root
5: Lugannani-Rice approximation
6: Confidence intervals
7: Diagnostics based on INF/NP decomposition

Selection:
  }
  If no nuisance parameters are presented, a subset of the above 
  pictures is produced.  A message is printed if this is the case.  
  More details and examples are given in \cite{Brazzale (2000, 
  Sections 6.5 and 5.3.2)}.
    
  This function is a method for the generic function \code{plot()} for
  class \code{marg}.  It can be invoked by calling \code{plot} or
  directly \code{plot.marg} for an object of the appropriate class.
}
\value{
  A plot is created on the current graphics device.
}
\section{Side Effects}{
  The current device is cleared.  When \code{add.leg} is 
  \code{TRUE}, a legend is added to each plot. Furthermore, if
  \code{loc.leg} is \code{TRUE}, the location of the legend can
  be set by the user.  All screens are closed, but not cleared, on 
  termination of the function.
}
\note{
  If the parameter of interest is the scale parameter, all calculations
  are performed on the log scale, though most results are reported
  on the original scale.  

  Four diagnostic plots are provided.
  The two panels on the right trace the information and nuisance
  correction terms, \acronym{INF} and \acronym{NP}, against the
  likelihood root statistic.  These are generally smooth functions
  and used to approximate the information and nuisance parameter
  aspects as a function of the parameter of interest, as shown in the
  two panels on the left.  This procedure has the advantage
  of largely eliminating the numerical instabilities that affect the
  statistics around the \acronym{MLE}.  All four pictures are intended
  to give an idea of the order of magnitude of the two correction
  terms while trying to deal with the numerical problems that likely
  occur for these kinds of data.

  More details can be found in \cite{Brazzale (2000, Appendix B.2)}.  
}
\references{
  Brazzale, A. R. (2000) \emph{Practical Small-Sample Parametric
  Inference}.  Ph.D. Thesis N. 2230, Department of Mathematics, Swiss 
  Federal Institute of Technology Lausanne.
}
\seealso{
  \code{\link{cond.rsm}}, \code{\link{marg.object}}, 
  \code{\link{summary.marg}}
}
\examples{
# Sea Level Data
data(venice)
attach(venice)
Year <- 1:51/51
c11 <- cos(2*pi*1:51/11) ; s11 <- sin(2*pi*1:51/11)
c19 <- cos(2*pi*1:51/18.62) ; s19 <- sin(2*pi*1:51/18.62)
#
# quadratic model fitted to the sea level, includes 18.62-year 
# astronomical tidal cycle and 11-year sunspot cycle
venice.rsm <- rsm(sea ~ Year + I(Year^2) + c11 + s11 + c19 + s19, 
                  family = extreme)
venice.marg <- cond(venice.rsm, I(Year^2))
plot(venice.marg, which = 4)
##
detach()
}
\keyword{methods}
\keyword{regression}
