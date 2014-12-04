#' Object incrementer function
#'
#' Creates a function to keep track of and number figures, tables or other objects.
#' Incrementer takes no arguments but generates a function with the parameters found below.
#' 
#' @param obj Character string containing a unique object name
#' @param label Logical indicating whether or not you would like to generate a label
#' @param pre_text Character string containing text to go before your object number
#'
#' @return An incrementer function.
#' 
#' @return A character string containing the figure label and number, if \code{label = TRUE}
#' 
#' @examples
#' fig_nums <- incrementer()
#' fig_nums("flower_plot")
#' fig_nums("tree_plot", label = TRUE)
#' 
#' @seealso \code{\link{caption}}
#' 
#' @export

captioner <- function(prefix = "Figure")
{
  OBJ_LIST <- c()
  force(prefix)
  
  function(name, cite = FALSE, caption = "")
  {
    # grab the object vector from the enclosing environment
    obj_list <- OBJ_LIST
    
    # check to see if the object name is already stored
    if(!any(OBJ_LIST == name)) {
      # add the ojbect to the local copy of the object vector
      obj_list <- c(obj_list, name)
      
      # assign the local object vector to the copy in the enclosing environment
      assign("OBJ_LIST",  obj_list,  envir = parent.env(environment()))
    }
        
    # get the number of the object
    obj_num <- match(name, obj_list)
    
    # choose between short or long format
    if(cite){
      text <- paste0(prefix, " ", obj_num)
    } else{
      text <- paste0(prefix, " ", obj_num, ": ", caption)
    }
    
    return(text)
  }
}