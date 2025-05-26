\name{Huber}
\alias{dHuber}
\alias{pHuber}
\alias{qHuber}
\alias{rHuber}
\title{
  Huber's Least Favourable Distribution
}
\description{
  Density, cumulative distribution, quantiles and random number 
  generator for Huber's least favourable distribution.
}
\usage{
dHuber(x, k = 1.345)
pHuber(q, k = 1.345)
qHuber(p, k = 1.345)
rHuber(n, k = 1.345)
}
\arguments{
  \item{x}{
    vector of quantiles.  Missing values (\code{NA}s) are allowed.
  }
  \item{q}{
    vector of quantiles.  Missing values (\code{NA}s) are allowed.
  }
  \item{p}{
    vector of probabilities.  Missing values (\code{NA}s) are allowed.
  }
  \item{n}{
    sample size.  If \code{length(n)} is larger than 1, then
    \code{length(n)} random values are returned.
  }
  \item{k}{
    tuning constant.  Values should preferably lie between 1 and 1.5.
    The default is 1.345, which gives 95\% efficiency at the Normal.
  }
}
\details{
  Inversion of the cumulative distribution function is used to
  generate deviates from Huber's least favourable distribution. 
}
\value{
  Density (\code{dHuber}), probability (\code{pHuber}), 
  quantile (\code{qHuber}), or random sample (\code{rHuber}) 
  for Huber's least favourable distribution with tuning constant 
  \code{k}.  If values are missing, \code{NA}s will be returned.
}
\section{Side Effects}{
  The function \code{rHuber} causes creation of the dataset 
  \code{.Random.seed} if it does not already exist; otherwise its 
  value is updated.
}
\section{Background}{
  Huber's least favourable distribution is a compound distribution 
  with gaussian behaviour in the interval (-\code{k},\code{k}) and 
  double exponential tails.  It is strongly related to Huber's 
  M-estimator, which represents the maximum likelihood estimator of 
  the location parameter.
}
\references{
  Hampel, F. R., Ronchetti, E. M., Rousseeuw, P. J. and Stahel, W. A. 
  (1986) \emph{Robust Statistics: The Approach Based on Influence 
  Functions}.  New York: Wiley.
}
\examples{
pHuber(0.5)
## 0.680374
pHuber(0.5, k = 1.5)
## 0.6842623
}
\keyword{distribution}
