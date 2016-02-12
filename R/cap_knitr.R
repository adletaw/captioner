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
#' To accomodate multiple captioner functions, cap_knitr uses the name of the
#' function you specify to generate the option name.  In other words, if you
#' have a captioner function called \code{fig_caps}, the knitr option will be
#' "fig_caps".  This option is logical (TRUE/FALSE).
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