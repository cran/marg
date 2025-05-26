\name{houses}
\docType{data}
\alias{houses}
\title{House Price Data}
\description{
  The \code{houses} data frame has 26 rows and 5 columns.

  Ms. Terry Tasch of Long-Kogan Realty, Chicago, provides data on 
  the selling prices of houses and on different variables describing
  their status.  This data frame contains the prices and a subset
  of the covariates.  
}
\usage{data(houses)}
\format{
  This data frame contains the following columns:
  \describe{
    \item{\code{price}}{
      selling price (in thousands of dollars);
    }
    \item{\code{bdroom}}{
      number of bedrooms;
    }
    \item{\code{floor}}{
      floor space (in square feet);
    }
    \item{\code{rooms}}{
      total number of rooms;
    }
    \item{\code{front}}{
      front footage of lot (in feet).
    }
  }
}
\source{
  The data were obtained from

  Sen, A. and Srivastava, M. (1990) \emph{Regression Analysis: Theory,
  Methods and Applications} (Exhibit 2.2, page 32).  New York:
  Springer-Verlag.
}
\examples{
data(houses)
summary(houses)
pairs(houses)
}
\keyword{datasets}
