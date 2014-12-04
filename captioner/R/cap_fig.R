#' Simple figure/table caption generators
#' 
#' A simplified captioner to create numbered figure or table captions without generating your own captioner
#' 
#' @examples my_caption <- cap_fig("flower_plot", "Histogram of flower colors.")
#' 
#' @seealso \code{\link{captioner}}, \code{\link{cap_tab}}
#' 
#' @export

cap_fig <- function(name, cite = FALSE, caption = "")
{
  captioner(prefix = "Figure")
}

cap_tab <- function(name, cite = FALSE, caption = "")
{
  captioner(prefix = "Table")
}