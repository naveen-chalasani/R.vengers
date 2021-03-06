test_that("errors for incorrect input", {
  
  expect_error(get_runtime('winter', 'summer'), "Type is invalid. Please use one of these : movie, series, episode, game")
  expect_error(get_runtime(), "No input provided. Please search again.")
  
})


test_that("correct runtime output", {
  
  output <- get_runtime('water', 'movie')
  expect_type(output, 'list')
  expect_true(is.data.frame(output))
  expect_equal(ncol(output), 4)
  expect_type(output$Year, 'double')
  expect_equal(colnames(output)[1] , 'Title')
  expect_equal(get_runtime('black water'), get_runtime('black+water'))
  expect_match(sample(output[[1]], 1), '*water*', ignore.case = TRUE)
 # expect_equal(nrow(output), length(unique(output$Title)))
  
})
