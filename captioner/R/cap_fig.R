#' Figure caption generator
#' 
#' Allows you to create a table caption with automatically generated numbered prefix.
#' 
#' @examples my_caption <- cap_fig("flower_plot", "Histogram of flower colors.")
#' 
#' @seealso \code{\link{captioner}}, \code{\link{cap_tab}}
#' 
#' @export
cap_fig <- captioner(prefix = "Figure")