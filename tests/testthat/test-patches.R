context("Patch scan and derived functions")



m <- matrix(c(2, 2, 4, 4, 2,
              4, NA, 2, 3, 2,
              2, 4, 1, 3, 1,
              1, 1, 1, 1, 3,
              4, 4, 4, 2, 2),
            5, 5, byrow = TRUE)

p4 <- matrix(c(0, 0, 1, 1, 2,
               3, NA, 4, 5, 2,
               6, 7, 8, 5, 9,
               8, 8, 8, 8, 10,
               11, 11, 11, 12, 12),
             5, 5, byrow = TRUE)

p8 <- matrix( c(0, 0, 1, 1, 2,
                3, NA, 0, 4, 2,
                5, 3, 6, 4, 6,
                6, 6, 6, 6, 4,
                7, 7, 7, 8, 8), 5, 5, byrow = TRUE)


res8n <-  patchscan(m)
res4n <- patchscan(m, nr = 4)


m2 <- matrix(c(1, 1, 3, 4, NA, 6:9), 3, 3, byrow = TRUE)

test_that("Patchscan doesn't affect NA values", {
  expect_equal(is.na(m), is.na(res8n$patches))
  expect_equal(is.na(m), is.na(res4n$patches))
})

test_that("Patchscan correctly identifies patches", {
  expect_equal(res4n$patches, p4)
  expect_equal(res8n$patches, p8)
})

test_that("Patchscan correctly returns the maximum patch id", {
  expect_equal(res4n$count, max(res4n$patches, na.rm = TRUE) + 1 )
  expect_equal(res8n$count, max(res8n$patches, na.rm = TRUE) + 1)
})

test_that("Grid method to patchscan returns proper object", {
  g <- asgrid(m, xll = 0, yll = 0, cellsize = 10)
  res <- patchscan(g)$patches
  expect_true(is.grid(res))
  expected <- g
  expected$m <- p8
  expect_equal(expected, res)
})


test_that("Nibble picks mode", {
  res <- nibbleNA(m2)
  expected <- m2
  expected[2, 2] <- 1 # Central cell should be 1
  expect_equal(res, expected)
})

test_that("Grid nibble works", {
  g <- asgrid(m2, xll = 0, yll = 0, cellsize = 10 )
  expect_true(is.grid(g))
  res <- nibbleNA(g)
  expected <- g
  expected$m[2, 2] <- 1
  expect_equal(res, expected)
})


test_that("Eliminate small patches works", {
  g <- asgrid(m, xll = 0, yll = 0, cellsize = 10 )
  expect_true(is.grid(g))
  res <- eliminatesmallpatches(g, maxsize = 2)

  expected <- asgrid(matrix(c(2, 2, 2, 3, 3,
                               2, NA, 2, 3, 3,
                               1, 1, 1, 3, 1,
                               1, 1, 1, 1, 3,
                                4, 4, 4, 1, 3),
                             5, 5, byrow  = TRUE),
                      xll = 0, yll = 0, cellsize = 10)
  expect_equal(res, expected)

})









