library(RNeo4j)
context("Relationships")

neo4j = startGraph("http://localhost:7474/db/data/")
clear(neo4j, input=F)

mugshots = createNode(neo4j, "Bar", name="Mugshots", location="México")
nastys = createNode(neo4j, "Bar", name="Nasty's")
rel = createRel(mugshots, "IS_NEAR", nastys, since=2001)

test_that("createRel works", {
  expect_true("relationship" %in% class(rel))
})

test_that("array propertied are added correctly", {
  newRel = createRel(mugshots, "SOMETHING", nastys, array=c(1,3,4))
  expect_identical(newRel$array, c(1,3,4))
})

test_that("getRels works", {
  r = getRels(neo4j, "MATCH ()-[r]-() RETURN r")
  x = class(r[[1]])
  expect_true("relationship" %in% x)
})

test_that("getRels works with parameters", {
  r = getRels(neo4j, "MATCH ({name:{name}})-[r]-() RETURN r", name="Mugshots")
  x = class(r[[1]])
  expect_true("relationship" %in% x)
})

test_that("getSingleRel works", {
  r = getSingleRel(neo4j, "MATCH ()-[r]-() RETURN r")
  x = class(r)
  expect_true("relationship" %in% x)
})

test_that("getSingleRel works with parameters", {
  r = getSingleRel(neo4j, "MATCH ({name:{name}})-[r]-() RETURN r", name="Mugshots")
  x = class(r)
  expect_true("relationship" %in% x)
})

test_that("startNode works", {
  n = startNode(rel)
  x = class(n)
  expect_true("node" %in% x)
  expect_identical(n, mugshots)
})

test_that("endNode works", {
  n = endNode(rel)
  x = class(n)
  expect_true("node" %in% x)
  expect_identical(n, nastys)
})

test_that("outgoingRels works", {
  r = outgoingRels(mugshots)
  x = class(r[[1]])
  expect_true("relationship" %in% x)
})

test_that("outgoingRels works with given type", {
  r = outgoingRels(mugshots, "SOMETHING")
  x = class(r[[1]])
  expect_true("relationship" %in% x)
})

test_that("incomingRels works", {
  r = incomingRels(nastys)
  x = class(r[[1]])
  expect_true("relationship" %in% x)
})

test_that("incomingRels works with given type", {
  r = incomingRels(nastys, "SOMETHING")
  x = class(r[[1]])
  expect_true("relationship" %in% x)
})