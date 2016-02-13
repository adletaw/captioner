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

cap_knitr <- function(where = "after")
{
  knitr::knit_hooks$set(cap = function(before, options) {

    ## Get the captioner function name and chunk name
    cap_function <- options$cap
    cap_name     <- options$label
    
    ## Get object list from function environment
    objects <- get("OBJECTS", envir = environment(get(cap_function)))
    
    if(!any(objects$name == cap_name)){
      stop("Caption not found.  Please confirm that chunk label matches an
           existing caption.")
    }
    
    ## Create the full caption
    full_caption <- paste("\n\n", get(cap_function)(cap_name), "\n\n")
    
    ## Get the display preferences based on the function name.
    chunk_opts <- get("KNITR", envir = environment(get(cap_function)))
    knitr::opts_current$set(chunk_opts)
    
    ## Display before or after the figure depending on settings
    if(where == "after"){
      if(!before){
        par(mar = c(1,4,4,2) + 0.1)
        ## Return the caption
        return(full_caption)
      }
    } else {
      if(before){
        par(mar = c(5,4,1,2) + 0.1)
        ## Return the caption
        return(full_caption)
      }
    }
  })
}