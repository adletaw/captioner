#' Object incrementer function
#'
#' Creates a function to keep track of and number figures, tables or other objects
#'
#' @return An incrementer function.
#' 
#' @author Alathea D Letaw, \email{alathea@@zoology.ubc.ca}
#' 
#' Keeps a vector of objects, numbers them, and generates labels
#' 
#' @param obj Character string containing a unique object name
#' @param label Logical indicating whether or not you would like to generate a label
#' @param pre_text Character string containing text to go before your object number
#' 
#' @return If label is TRUE, a character string containing the object number with preceding text


incrementer <- function()
{
  # a vector of object names stored in the function's
  # enclosing environment
  OBJ_LIST <- c()
  
  function(obj, label = FALSE, pre_text = "Figure"){
    # pre_text only required if label is desired
    # default is "Figure"
    
    # grab the object list from the enclosing environment
    obj_list <- OBJ_LIST
    
    # print the object label if specified
    if(label){
      # add the item to the list if it is not there
      if(!any(obj_list == obj)){
        assign("OBJ_LIST", c(obj_list, obj), inherits = TRUE)
        
        # re-grab the object list now that it has been updated
        obj_list <- OBJ_LIST
      }
      
      # get the number of the object in the vector
      obj_num <- match(obj, obj_list)
      # create a label using designated text and the number
      obj_label <- paste(pre_text, obj_num, sep = " ")
      
      return(obj_label)
    } else{
      # make sure this object has not been added already
      if(any(obj_list == obj)) {
        stop("This object name has already been assigned.")
      }
      
      # add the object to the list in the enclosing environment
      assign("OBJ_LIST", c(obj_list, obj), inherits = TRUE)
      
      return(invisible())
    }
  }
}