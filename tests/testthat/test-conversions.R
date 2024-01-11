
library(sp)
library(terra)
data("meuse.grid")
d <- meuse.grid
coordinates(d) <- c("x", "y")

test_that("Conversion from SpatailPointsDataFrame to grid succeeds", {
  expect_silent(g <- as.grid(d, data.col = 3))
})

g <- as.grid(d, data.col = 3)

test_that("Conversion from SpatialPointsDataFrame to grid is consistent with past values", {
  expect_that(g, is_a("grid"))
  expect_true(is.grid(g))
  expect_known_hash(g, "a39d948d1f")
})

test_that("Conversion from grid to SpatailPointsDataFrame works", {
  expect_silent(s <- as.SpatialPointsDataFrame(g))
  # Note s is not the same as d because only one column of data from d is retained
  # in grid and grid has values for all cells which are retained when we
  # convert back to s
  cs <- coordinates(s)
  cd <- coordinates(d)
  sid <- paste(cs[, 1], cs[ , 2])
  did <- paste(cd[, 1], cd[ , 2])
  expect_true(all(did %in% sid))

  # Here I'm subsetting the backconvered rows to just those that are in the orignal
  # object and subsetting the original object to just the column we used to
  # make the grid.
  # After making those adjustments the result should be equivalent objects
  # But some attributes will differ (notably row names)
  mv <- match(did, sid)
  s2 <- s[mv, ]
  d2 <- d[, 3]
  names(d2) <- "z"
  expect_equivalent(s2, d2)
})


test_that("Grid to terra::SpatRaster conversion works", {
  expect_silent(r <- rast(g))
  expect_that(r, is_a("SpatRaster"))
  expect_silent(g2 <- as.grid(r))
  expect_equivalent(g, g2)
  expect_true(is.grid(g2))
  expect_equal(terra::values(r)[1000:1010], t(g$m)[1000:1010])
})

