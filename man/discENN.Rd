% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/discENN.R
\name{discENN}
\alias{discENN}
\alias{discENN.default}
\alias{discENN.formula}
\title{Edited Nearest Neighbors for Regression by Discretization}
\usage{
\method{discENN}{default}(x, y, k = 5, ...)

\method{discENN}{formula}(formula, data, ...)
}
\arguments{
\item{x}{a data frame of input attributes.}

\item{y}{a double vector with the output regressand of each sample.}

\item{k}{an integer with the number of nearest neighbors to be used (default: 5).}

\item{...}{other options to pass to the function.}

\item{formula}{a formula with the output regressand and, at least, one input attribute.}

\item{data}{a data frame in which to interpret the variables in the formula.}
}
\value{
The result of applying the regression filter is a reduced dataset containing the clean samples (without errors or noise), since it removes noisy samples (those with errors).
This function returns an object of class \code{rfdata}, which contains information related to the noise filtering process in the form of a list with the following elements:
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

Note that objects of the class \code{rfdata} support \link{print.rfdata}, \link{summary.rfdata} and \link{plot.rfdata} methods.
}
\description{
Application of the discENN noise filtering method in a regression dataset.
}
\details{
\code{discENN} discretizes the numerical output variable to make it compatible with \emph{Edited Nearest Neighbors} (ENN), typically used in classification tasks. 
ENN removes a sample if its class label is different from that of the majority of its nearest neighbors (\code{k}).
}
\examples{
# load the dataset
data(rock)

# usage of the default method
set.seed(9)
out.def <- discENN(x = rock[,-ncol(rock)], y = rock[,ncol(rock)])

# show results
summary(out.def, showid = TRUE)

# usage of the method for class formula
set.seed(9)
out.frm <- discENN(formula = perm ~ ., data = rock)

# check the match of noisy indices
all(out.def$idnoise == out.frm$idnoise)

}
\references{
L. Devroye, L. Gyorfi and G. Lugosi,
\strong{Condensed and edited nearest neighbor rules.}
\emph{In: A Probabilistic Theory of Pattern Recognition}, 31:303-313, 1996.
\doi{https://doi.org/10.1007/978-1-4612-0711-5_19}.

A. Arnaiz-González, J. Díez-Pastor, J. Rodríguez, C. García-Osorio,
\strong{Instance selection for regression by discretization.}
\emph{Expert Systems with Applications}, 54:340-350, 2016.
\doi{https://doi.org/10.1016/j.eswa.2015.12.046}.
}
\seealso{
\code{\link{discCNN}}, \code{\link{discTL}}, \code{\link{discNCL}}, \code{\link{print.rfdata}}, \code{\link{summary.rfdata}}
}
