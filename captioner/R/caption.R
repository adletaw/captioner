#' Caption generator
#' 
#' Works well in conjunction with \code{\link{incrementer}} for creating a numbered figure
#' caption.  The caption can be stored as an object and used in .Rmd documents for numbering
#' and labelling figures.
#' 
#' @param ... Character string(s) containing the caption
#' 
#' @return A character string containing the caption
#' 
#' @examples
#' 
#' caption("This histogram shows the distribution of flower species.")
#' 
#' fig_nums <- incrementer()
#' caption(fig_nums("tree_histogram", label = TRUE),
#'         "This histogram shows the distribution of tree species.")
#' 
#' @export

caption <- function(...)
{
  # pastes together all function inputs
  paste(..., sep = "")
}