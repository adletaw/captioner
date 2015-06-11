#' Captioner bump function
#' 
#' For figure numbers with sub-values (e.g. 1.1), increment one of the sub-values for use in
#' the next figure.
#' 
#' @param cap_fun The captioner function that needs to be bumped
#' @param level Numeric indicating which sub-number should be incremented
#' 
#' @return None.
#' 
#' @details Normally captioner only increments the final number in your figure number, even if you have
#' hierarchical numbering (e.g. Fig 1.1.1).  This function will bump up any of the penultimate
#' numbers of your choice using a given index.  You can use it at the start of a section, for example,
#' to shift from Fig 1.5 to Fig 2.1. 
#' 
#' @examples
#' figs <- captioner(levels = 2)
#' figs("a")
#' 
#' bump(figs, 1)
#' 
#' @seealso \code{\link{captioner}}
#' 
#' @export

bump <- function(cap_fun, level){
  # get the function's environment
  e <- environment(cap_fun)
  
  # the number of object numbers already present
  num_objs <- length(e$OBJECTS$number)
  
  # add a number incremented at the desired level to the objects list
  e$OBJECTS$number[[num_objs + 1]] <- increment(e$OBJECTS$number[[num_objs]], level)
}
