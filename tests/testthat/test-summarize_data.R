# Test case 1: Vector with no NAs
test_that("Test Case 1: Vector with No NAs", {
  data <- data.frame(
    Group = c("A", "A", "B", "B"),
    Value = c(10, 15, 20, 25)
  )
  result <- summarize_data(data, group_vars = "Group", Mean_Value = mean(Value))
  expected_result <- data.frame(Group = c("A", "B"), Mean_Value = c(12.5, 22.5))
  expect_true(all.equal(result, expected_result, check.attributes = FALSE))
})

# Test case 2: Vector with NAs
test_that("Test Case 2: Vector with NAs", {
  data <- data.frame(
    Group = c("A", "A", "B", "B"),
    Value = c(10, 15, NA, 25)
  )
  result <- summarize_data(data, group_vars = "Group", Mean_Value = mean(Value, na.rm = TRUE))
  expected_result <- data.frame(Group = c("A", "B"), Mean_Value = c(12.5, 25))
  expect_equal(result$Mean_Value, expected_result$Mean_Value)
})

# Test Case 3: Vector of length 0
test_that("Test Case 3: Vector of Length 0", {
  data <- data.frame(
    Group = character(0),
    Value = numeric(0)
  )
  result <- summarize_data(data, group_vars = "Group", Mean_Value = mean(Value, na.rm = TRUE))
  expect_length(result$Mean_Value, 0)
})
