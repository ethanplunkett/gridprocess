
test_that("Grid to terra::SpatRaster conversion works", {
  g <- dem
  expect_silent(r <- rast(g))
  expect_that(r, is_a("SpatRaster"))
  expect_silent(g2 <- asgrid(r))
  expect_equivalent(g, g2)
  expect_true(is.grid(g2))
  expect_equal(terra::values(r)[1000:1010], t(g$m)[1000:1010])
})

