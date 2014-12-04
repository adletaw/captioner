#' Captioner function
#'
#' Creates a function to create numbered captions for figures, tables or other objects
#' 
#' @param prefix Character string containing text to go before object number
#' 
#' @return A captioner function.
#' 
#' @details Captioner generates a function with the following parameters
#' 
#' \code{name}: Character string containing a unique object name
#' 
#' \code{caption}: The object caption
#' 
#' \code{cite}: Logical indicating whether or not you would like to generate a short form to use for in-text citation
#' 
#' And returns a character string containing the prefix and object number with or without a caption
#' 
#' @examples
#' fig_nums <- captioner()
#' fig_nums("flower_plot", "This plot shows the distribution of flower colors")
#' fig_nums("flower_plot", cite = TRUE)
#' 
#' @export

captioner <- function(prefix = "Figure")
{
  OBJ_LIST <- c()
  force(prefix)
  
  function(name, caption = "", cite = FALSE)
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
    if(cite) { text <- paste0(prefix, " ", obj_num) }
    else     { text <- paste0(prefix, " ", obj_num, ": ", caption) }
    
    return(text)
  }
}