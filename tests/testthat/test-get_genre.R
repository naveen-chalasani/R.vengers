test_that("errors for incorrect input", {
  
  expect_error(get_genre('winter', 'summer'), "Type is invalid. Please use one of these : movie, series, episode, game")
  expect_error(get_genre(), "No input provided. Please search again.")
  
})


test_that("correct genre output", {
  
  output <- get_genre('east', 'movie')
  expect_type(output, 'list')
  expect_true(is.data.frame(output))
  expect_equal(ncol(output), 4)
  expect_type(output$Genre, 'character')
  expect_equal(colnames(output)[4] , 'Genre')
  expect_equal(get_genre('the east'), get_genre('the+east'))
  expect_match(sample(output[[1]], 1), '*east*', ignore.case = TRUE)
  expect_equal(nrow(output), length(unique(output$Title)))
  
})