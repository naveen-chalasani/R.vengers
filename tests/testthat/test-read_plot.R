test_that("errors for incorrect input", {
  
  expect_error(read_plot('winter', 'summer'), "Type is invalid. Please use one of these : movie, series, episode, game")
  expect_error(read_plot(), "No input provided. Please search again.")
  
})


test_that("correct plot output", {
  
  output <- read_plot('women', 'movie')
  expect_type(output, 'list')
  expect_true(is.data.frame(output))
  expect_equal(ncol(output), 4)
  expect_type(output$Plot, 'character')
  expect_equal(colnames(output)[4] , 'Plot')
  expect_equal(read_plot('the women'), read_plot('the+women'))
  expect_match(sample(output[[1]], 1), '*women*', ignore.case = TRUE)
 # expect_equal(nrow(output), length(unique(output$Title)))
  
})