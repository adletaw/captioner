#' cap_knitr
#'
#' Option to automatically show a caption after a knitr chunk.
#'
#' @param cap_function The name of the captioner function to be used, in quotes.
#' 
#' @return NULL
#' 
#' @details cap_knitr sets a knitr option so your captions will automatically
#' display.  The caption is found by accessing the chunk name, so the caption
#' and chunk names must match.
#' 
#' To accomodate multiple captioner functions, cap_knitr uses the name of the
#' function you specify to generate the option name.  In other words, if you
#' have a captioner function called \code{fig_caps}, the knitr option will be
#' "fig_caps".  This option is logical (TRUE/FALSE).
#' 
#' @examples
#' 
#' figs <- captioner()
#' cap_knitr("figs")
#'   
#' @export

## This should be an internal function that is automatically called when
## a new captioner function is created.  Formatting can be set on that first
## call.  Formatting settings are specific to the captioner function so each
## one can have different formatting.
cap_knitr <- function()
{
  knitr::knit_hooks$set(cap = function(before, options) {
    if(!before){
      ## Get the chunk name.  This must match the caption name to work.
      ## Generate a warning/error if there is no match.
      cap_name     <- options$label
      
      ## Get the function name.  This is specified inside the chunk option.
      cap_function <- options$cap
      
      ## Get the display preferences based on the function name.
      ## These must be in the environment in which the function was created.
      
      ## Return the caption
      return(get(cap_function)(cap_name))
    }
  })
}