% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rfdata.R
\name{summary.rfdata}
\alias{summary.rfdata}
\title{Summary function for class rfdata}
\usage{
\method{summary}{rfdata}(object, ..., showid = FALSE)
}
\arguments{
\item{object}{an object of class \code{rfdata}.}

\item{...}{other options to pass to the function.}

\item{showid}{a logical indicating if the indices of noisy samples must be displayed (default: \code{FALSE}).}
}
\value{
A list including information related to the noise filtering process contained in the object \code{object} of class \code{rfdata} with the following elements:

\item{xclean}{a data frame with the input attributes of clean samples (without errors).}
\item{yclean}{a double vector with the output regressand of clean samples (without errors).}
\item{numclean}{an integer with the amount of clean samples.}
\item{idclean}{an integer vector with the indices of clean samples.}
\item{xnoise}{a data frame with the input attributes of noisy samples (with errors).}
\item{ynoise}{a double vector with the output regressand of noisy samples (with errors).}
\item{numnoise}{an integer with the amount of noisy samples.}
\item{idnoise}{an integer vector with the indices of noisy samples.}
\item{filter}{the full name of the noise filter used.}
\item{param}{a list of the argument values.}
\item{call}{the function call.}

This list also includes the \code{showid} argument.
}
\description{
This methods displays a summary containing information about the noise
filtering process contained in an \code{object} of class \code{rfdata}.
}
\details{
This function presents a summary containing information of the regression noise filter and the resulting
dataset contained in the \code{object} of class \code{rfdata}.
The information offered is as follows:
\itemize{
   \item the function call.
   \item the name of the regression noise filter.
   \item the parameters associated with the noise filter.
   \item the number of noisy and clean samples in the dataset.
   \item the indices of the noisy and clean samples (if \code{showid = TRUE}).
}
}
\examples{
# load the dataset
data(rock)

# apply the regression noise filter
set.seed(9)
output <- regAENN(x = rock[,-ncol(rock)], y = rock[,ncol(rock)])

# print the results
summary(output)

}
\seealso{
\code{\link{print.rfdata}}, \code{\link{regEF}}, \code{\link{regDF}}, \code{\link{regHRRF}}, \code{\link{regIRF}}
}
