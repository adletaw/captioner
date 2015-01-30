#' Captioner function
#'
#' Creates a function to create numbered captions for figures, tables or other objects
#' 
#' @param prefix Character string containing text to go before object number. The default is "Figure".
#' @param auto_space Logical indicating whether or not a space should automatically be added following the prefix.  Space is added by default.
#' @param levels Logical or number indicating whether or not you want hierarchical numbering, and if so, how many levels.  Hierarchical numbering is turned off by default.
#' @param type Vector with same length as `levels` indicating whether figure numbering should be numeric ("n"), lowercase character ("c"), or uppercase character ("C").
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

captioner <- function(prefix = "Figure", auto_space = TRUE, levels = 1,
                      type = NULL, infix = ".")
{
  # Check the parameter classes
  check_class(prefix,     "character")
  check_class(auto_space, "logical")
  check_class(levels,     "numeric")
  check_class(infix,      "character")
  
  # store object names, numbers, and captions
  OBJECTS <- list("name"    = NULL,
                  "caption" = NULL,
                  "number"  = NULL)
  
  # add a space after the prefix if auto_space is on
  if(auto_space){
    prefix <- paste(prefix, " ")
  }
  
  # create the first caption number
  OBJECTS$number <- list()
  OBJECTS$number[[1]] <- list()
  
  for(i in 1:levels){
    if(missing(type)){
      OBJECTS$number[[1]][[i]] <- 1
    } else if(type[i] == "c"){
      OBJECTS$number[[1]][[i]] <- "a"
    } else if(type[i] == "C"){
      OBJECTS$number[[1]][[i]] <- "A"
    } else{
      OBJECTS$number[[1]][[i]] <- 1
    }
  }
  
  # force the parameter values for use in the return function
  force(levels)  
  force(prefix)
  force(infix)
  
  function(name, caption = "", cite = FALSE)
  {
    # grab the caption and number lists from the enclosing environment
    objects <- OBJECTS
    
    # check to see if the object name is already stored
    if(any(objects$name == name)) {
      # find the index associated with the stored name
      obj_ind <- match(name, objects$name)
      
      # find the caption associated with the stored name
      # if the caption is missing, and you supplied one with the current function
      # call, the missing one will be filled in with the new one
      if(objects$caption[obj_ind] == ""){
        # replace empty caption
        objects$caption[obj_ind] <- caption
      } else {
        # access existing caption
        caption <- objects$caption[obj_ind]
      }
    } else {
      # check for an existing object number
      # add name and caption to index of earliest unassigned number
      
      # add the object to the local copy of the object vector
      objects$name    <- c(objects$name, name)
      objects$caption <- c(objects$caption, caption)
      
      # get the number of the object
      obj_num <- match(name, objects$name)
    }
    
    # assign objects to the parent environment
    assign("OBJECTS", objects, envir = parent.env(environment()))
        
    # choose between short or long format
    if(!cite) {
      text <- paste0(prefix, obj_num, ": ", caption)
    } else {
      text <- paste0(prefix, obj_num)
    }
    
    return(text)
  }
}