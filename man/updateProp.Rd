% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/updateProp.R
\name{updateProp}
\alias{updateProp}
\title{Update Node and Relationship Properties}
\usage{
updateProp(entity, ...)
}
\arguments{
\item{entity}{A node or relationship object.}

\item{...}{A named list. Property updates in the form key = value.}
}
\value{
A node or relationship object.
}
\description{
For a node or relationship object, update its properties. 
Existing properties can be overridden and new properties can be added.
}
\examples{
\dontrun{
graph = startGraph("http://localhost:7474/db/data/")
clear(graph)

alice = createNode(graph, "Person", name = "Alice")
bob = createNode(graph, "Person", name = "Bob")

alice = updateProp(alice, age = 24, eyes = "green")

newProps = list(age = 25, eyes = "brown")
bob = updateProp(bob, newProps)

alice
bob
}

}
\seealso{
\code{\link{deleteProp}}
}

