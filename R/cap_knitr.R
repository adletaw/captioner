#' cap_knitr
#'
#' Option to automatically show a caption after a knitr chunk.
#'
#' @param cap_function The name of the captioner function to be used.
#' 
#' @return NULL
#' 
#' @details cap_knitr sets a knitr option so your captions will automatically
#' display.  The caption is found by accessing the chunk name, so the caption
#' and chunk names must match.
#' 
#' \code{cap}: Logical chunk option specifying whether or not to display a
#' caption for the given chunk.
#' 
#' @examples
#' 
#' figs <- captioner()
#' cap_knitr(figs)
#'   
#' @export

cap_knitr <- function(cap_function)
{
  knitr::knit_hooks$set(cap = function(before, options) {
    if(!before){
      cap_name <- options$label
      return(fig_cap(cap_name))
    }
  })
}