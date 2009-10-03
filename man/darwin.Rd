\name{darwin}
\docType{data}
\alias{darwin}
\title{Darwin's Data on Growth Rates of Plants}
\usage{data(darwin)}
\description{
The \code{darwin} data frame has 15 rows and 3 columns.

  Charles Darwin conducted an experiment to examine the superiority of
  cross-fertilized plants over self-fertilized plants.  15 pairs of
  plants were used. Each pair consisted of one cross-fertilized plant
  and one self-fertilized plant which germinated at the same time and
  grew in the same pot. The heights of the plants were measured at a
  fixed time after planting.  Four different pots were used.
}
\format{
  This data frame contains the following columns:
  \describe{
    \item{\code{cross}}{ 
      the heights of the cross-fertilized plants (in inches);
    }
    \item{\code{self}}{  
      the heights of the self-fertilized plants (in inches);
    }
    \item{\code{pot}}{   
      a factor variable for the pot number.
    }
  }
}
\source{
  The data were obtained from

  Andrews, D. F. and Herzberg, A. M. (1985) \emph{Data: A Collection 
  of Problems From Many Fields for the Student and Research Worker} 
  (Chapter 2).  New York: Springer-Verlag.  
}
\references{
  Darwin, C. (1878) \emph{The Effects of Cross and Self Fertilisation 
  in the Vegetable Kingdom } (2nd ed.).  London: John Murray.
}
\examples{
data(darwin)
plot(cross - self ~ pot, data = darwin)
}
\keyword{datasets}
