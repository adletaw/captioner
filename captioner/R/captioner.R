#' Captioner function
#'
#' Creates a function to create numbered captions for figures, tables or other objects
#' 
#' @param prefix Character string containing text to go before object number. The default is "Figure".
#' @param auto_space Logical indicating whether or not a space should automatically be added following the prefix.  Space is added by default.
#' @param levels Logical or number indicating whether or not you want hierarchical numbering, and if so, how many levels.  Hierarchical numbering is turned off by default.
#' @param type Vector with same length as `levels` indicating whether figure numbering should be numeric ("n"), lowercase alphabetical ("a"), or uppercase alphabetical ("A").
#' @param infix Character string containing text to go between figure numbers if hierarchical numbering is on.
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
#' fig_nums("flower_plot", "This plot shows the distribution of flower colors")
#' 
#' Cite the figure e.g. "Figure 1", using the key word:
#' fig_nums("flower_plot", cite = TRUE)
#' 
#' Now you can print the caption any time using the designated key:
#' fig_nums("flower_plot")
#' 
#' @export

captioner <- function(prefix = "Figure", auto_space = TRUE)
captioner <- function(prefix = "Figure", auto_space = TRUE, levels = FALSE,
                      type, infix = ".")
{
  OBJ_LIST  <- c() # store object names
  CAPTIONS  <- c() # store captions
  
  # add a space after the prefix if auto_space is on
  if(auto_space){
    prefix <- paste(prefix, " ")
  }
  
  # force the number of levels, if not set to FALSE
  if(levels){
    force(levels)
  }
  
  force(prefix)
  
  function(name, caption = "", cite = FALSE)
  {
    # grab the object and caption vectors from the enclosing environment
    obj_list  <- OBJ_LIST
    captions  <- CAPTIONS
    
    # check to see if the object name is already stored
    if(any(obj_list == name)) {
      # find the number associated with the stored name
      obj_num <- match(name, obj_list)
      
      # find the caption associated with the stored name
      # if the caption is missing, and you supplied one with the current function
      # call, the missing one will be filled in with the new one
      if(captions[obj_num] == ""){
        # replace empty caption
        captions[obj_num] <- caption
        
        # assign to parent environment
        assign("CAPTIONS",  captions,  envir = parent.env(environment()))
      } else {
        # access existing caption
        caption <- captions[obj_num]
      }
    } else {
      # add the ojbect to the local copy of the object vector
      obj_list <- c(obj_list, name)
      captions <- c(captions, caption)
      
      # get the number of the object
      obj_num <- match(name, obj_list)
      
      # assign the local vector to the copy in the enclosing environment
      assign("OBJ_LIST",  obj_list,  envir = parent.env(environment()))
      assign("CAPTIONS",  captions,  envir = parent.env(environment()))
    }
        
    # choose between short or long format
    if(!cite) {
      text <- paste0(prefix, obj_num, ": ", caption)
      return(text)
    } else {
      text <- paste0(prefix, obj_num)
    }
    
    return(text)
  }
}