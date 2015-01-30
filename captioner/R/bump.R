#' Captioner bump function
#'
#' For figure numbers with sub-values (e.g. 1.1), increment one of the sub-values for use in
#' the next figure.
#' 
#' @param cap_fun Character string containing the name of your cpationer function
#' @param index Numeric indicating which sub-number should be incremented
#' 
#' @return None.
#' 
#' @details Normally captioner only increments the final number in your figure number, even if you have
#' hierarchical numbering (e.g. Fig 1.1.1).  This function will bump up any of the penultimate
#' numbers of your choice using a given index.  You can use it at the start of a section, for example,
#' to shift from Fig 1.5 to Fig 2.1.#' 
#' 
#' @examples
#' Create a new captioner object:
#' 
#' figs <- captioner(levels = 2)
#' figs("a")
#' 
#' bump(figs, 1)
#' 
#' @seealso \code{\link{captioner}}
#' 
#' @export

bump <- function(cap_fun, index){
  
}