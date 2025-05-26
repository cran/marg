\name{nuclear}
\alias{nuclear}
\docType{data}
\title{Nuclear Power Station Data}
\description{
  This data frame contains data on the construction of 32 light water 
  reactors constructed in the USA.
}
\usage{data(nuclear)}
\format{
  A data frame with 32 observations on the following 11 variables.
  \describe{
    \item{\code{cost}}{
      cost of construction (in billions of dollars adjusted to a 1976
      base)
    }
    \item{\code{date}}{
      date at which the construction permit was issued
    }
    \item{\code{T1}}{
      time between application for and issue of permit
    }
    \item{\code{T2}}{
      time between issue of operating license and construction permit
    }
    \item{\code{cap}}{
      power plant capacity (in MWe)
    }
    \item{\code{PR}}{
      \code{1} if light water reactor already present on site
    }
    \item{\code{NE}}{
      \code{1} if constructed in north-east region of USA
    }
    \item{\code{CT}}{
      \code{1} if cooling tower used
    }
    \item{\code{BW}}{
      \code{1} if nuclear steam supply system manufactured by 
      Babcock-Wilcox
    }
    \item{\code{N}}{
      cumulative number of power plants constructed by each 
      architect-engineer
    }
    \item{\code{PT}}{
      \code{1} if partial turnkey plant
    }
  }
}
\source{
  The data were obtained from

  Cox, D.R. and Snell, E.J. (1981).  \emph{Applied Statistics} (page 81,
  Example G).  Chapman and Hall, London. 
}
\examples{
data(nuclear)
}
\keyword{datasets}
