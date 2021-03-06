% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/networkAnalysis.R
\name{adj2igraph}
\alias{adj2igraph}
\title{Initialize network's vertex attributes}
\usage{
adj2igraph(YY, XY = NULL, info, weighted = F, dropnull = TRUE)
}
\arguments{
\item{YY}{adjacency matrix encoding y--y edges of conditional graphical model. If a 
logical matrix, TRUE denotes the existence of an edge. Format should conform to 
\code{igraph::graph_from_adjacency_matrix} input.}

\item{XY}{adjacency matrix encoding x--y edges of conditional graphical model. If NULL,
then a network encoding just y--y edges is made and \code{info} should just contain attributes for (y(1), ..., y(Q)).}

\item{info}{data.frame encoding the attributes of the vertices 
in the order of (x(1), ..., x(p), y(1), ..., y(q)) if both YY and XY are specified.
If just YY is specified, then \code{info} should just contain attributes for (y(1), ..., y(Q)). 
See details for required attributes to include and optional attributes.}

\item{weighted}{logical indicating whether the values of YY and XY should indicate 
weights of the vertices. Defaults to FALSE.}

\item{dropnull}{logical indicating to remove vertices with degree zero from the graph. Defaults to TRUE.}
}
\description{
Label vertex attributes of a  conditional graphical model's
 output.
}
