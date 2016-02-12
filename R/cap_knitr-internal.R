#' cap_knitr
#'
#' Option to automatically show a caption after a knitr chunk.
#'
#' @param before Logical determining whether to display the caption before
#' or after the figure.
#' 
#' @return NULL
#' 
#' @details cap_knitr sets the knitr option \code{cap} so your captions will
#' automatically display.  The caption is found by accessing the chunk name,
#' so the caption and chunk names must match. \code{cap} takes the name of
#' the corresponding captioner function, in quotes.
#'
#' @keywords internal   
#' @export

## This should be an internal function that is automatically called when
## a new captioner function is created.  Formatting can be set on that first
## call.  Formatting settings are specific to the captioner function so each
## one can have different formatting.
cap_knitr <- function(where = "after")
{
  knitr::knit_hooks$set(cap = function(before, options) {

    ## Get the chunk name.  This must match the caption name to work.
    ## Generate a warning/error if there is no match.
    cap_name     <- options$label
    
    ## Get the function name.  This is specified inside the chunk option.
    cap_function <- options$cap
    
    ## Get the display preferences based on the function name.
    ## These must be in the environment in which the function was created.
    chunk_opts <- get("KNITR", envir = environment(get(cap_function)))
    knitr::opts_current$set(chunk_opts)
    
    if(where == "after"){
      if(!before){
        ## Return the caption
        return(get(cap_function)(cap_name))
      }
    } else {
      if(before){
        ## Return the caption
        return(get(cap_function)(cap_name))
      }
    }
  })
}