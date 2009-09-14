\name{venice}
\docType{data}
\alias{venice}
\title{Sea Level Data}
\description{
  The \code{venice} data frame has 51 rows and 2 columns.

  \cite{Pirazzoli (1982)} collected the ten largest values of sea 
  levels in Venice (with a few exceptions) for the years 1887--1981.  
  The \code{venice} data frame contains the maxima for the years 
  1931--1981.
}
\usage{data(venice)}
\format{
  This data frame contains the following columns:
  \describe{
    \item{\code{year}}{
      the years;
    }
    \item{\code{sea}}{
      the sea levels (in cm).
    }
  }
}
\source{
  The data were obtained from

  Smith, R. L. (1986) Extreme value theory based on the 
  \eqn{r}{r}-largest annual events.  \emph{Journal of Hydrology }, 
  \bold{86}, 27--43.
}
\references{
  Pirazzoli, P. (1982) Maree estreme a Venezia (periodo 1872--1981).
  \emph{Acqua Aria}, \bold{10}, 1023--1039.
}
\examples{
data(venice)
attach(venice)
#
plot(sea ~ year, ylab = "sea level")
##
Year <- 1:51/51
venice.l <- rsm(sea ~ Year + I(Year^2), family = extreme)
lines(year, fitted(venice.l))
##
c11 <- cos(2*pi*1:51/11) ; s11 <- sin(2*pi*1:51/11)
c19 <- cos(2*pi*1:51/18.62) ; s19 <- sin(2*pi*1:51/18.62)
venice.p <- rsm(sea ~ Year + I(Year^2) + c11 + s11 + c19 + s19, 
                family = extreme)
lines(year, fitted(venice.p), col = "red")
##
detach()
}
\keyword{datasets}



