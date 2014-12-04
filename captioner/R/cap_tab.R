#' Table caption generator
#' 
#' Allows you to create a table caption with automatically generated numbered prefix.
#' 
#' @examples my_caption <- cap_tab("flower_table", "Frequency table of flower colors.")
#' 
#' @seealso \code{\link{captioner}}, \code{\link{cap_fig}}
#' 
#' @export
cap_fig <- captioner(prefix = "Table")