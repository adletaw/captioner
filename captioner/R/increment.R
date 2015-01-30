#' Increment function, for incrementing a hierarchical number
#'
#' Given a vector of numbers representing a subfigure, or a subsection figure, this function will
#' increment the original figure number
#' 
#' @param number A vector of numbers representing your subfigure numbering
#' @param level An index designating at which level the number should be incremented
#' 
#' @return A vector representing the incremented number
#' 
#' @details Captioner generates a function with the following parameters
#'
#' And returns a character string containing the prefix and object number with or without a caption.
#' The initial numbering is determined based on the order of caption creation.  However, this order
#' is modified based on the citations you use.  The first figure to be cited will be moved to the
#' beginning of the list, becoming "Figure 1".
#' 
#' @examples
#' Create a new captioner object:
#' fig_nums <- captioner()
#' 
#' Store a caption with the key word "flower_plot". Print the caption
#' including the figure number:
#' 
#' @export

increment <- function(number, level)
{
  
}