#' Summarize Data by Group
#'
#' This function performs group-wise summarization of a data frame based on
#' specified grouping variables and summary statistics.
#'
#' @param data A data frame that contains the data to be summarized.
#' @param group_vars A character vector of grouping variables. These variables
#'        will be used to group the data.
#' @param ... A set of summary expressions using the "name = expression" format.
#'        These expressions will be applied to the columns in the data frame.
#'
#' @return A data frame with grouped summaries, where each group is defined by
#'         the specified grouping variables. The summary statistics for each
#'         column are calculated based on the expressions provided.
#'
#' @examples
#' # Example data frame
#' data <- data.frame(
#'   Group1 = c("A", "A", "B", "B"),
#'   Group2 = c("X", "Y", "X", "Y"),
#'   Value1 = c(10, 15, 20, NA),
#'   Value2 = c(5, 8, 12, 18)
#' )
#'
#' # Usage of the summarize_data function
#' result <- summarize_data(data, group_vars = c("Group1", "Group2"),
#'                         Mean_Value1 = mean(Value1, na.rm = TRUE),
#'                         Sum_Value2 = sum(Value2, na.rm = TRUE))
#'
#' @export
summarize_data <- function(data, group_vars, ...) {

  # Convert the ellipsis (...) to a list of expressions
  summary_exprs <- rlang::enquos(...)

  result <- dplyr::group_by(data, dplyr::across(dplyr::all_of(group_vars), .names = "group"))
  result <- dplyr::summarise(result, !!!summary_exprs, .groups = "drop")

  return(result)
}
