#' Table caption generator
#' 
#' Allows you to create a table caption with automatically generated numbered prefix.
#' 
#' @examples my_caption <- cap_tab("The mosaic plot shows a significant relationship between )
#' 
#' @seealso \code{\link{incrementer}}, \code{\link{caption}}
#' 
#' @export

cap_tab <- function(clear = FALSE, ...)
{
  # if it is the first time called, create a new incrementer
  # otherwise increment the current incrementer
  # store the caption 
  # if clear, clear the caption list first
}