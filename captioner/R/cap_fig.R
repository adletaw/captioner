#' Simple figure/table caption generators
#' 
#' A simplified captioner to create numbered figure or table captions without generating your own captioner
#' 
#' @examples my_caption <- cap_fig("flower_plot", "Histogram of flower colors.")
#' 
#' @seealso \code{\link{captioner}}
#' 
#' @export

cap_fig <- function(name, cite = FALSE, caption = "")
{
  if(exists("FIG_CAPTION_COUNTER", envir = globalenv())){
    assign("FIG_CAPTION_COUNTER", FIG_CAPTION_COUNTER + 1, envir = globalenv())
  } else{
    assign("FIG_CAPTION_COUNTER", 1, envir = globalenv())
    caption_it <- captioner(prefix = "Figure")
  }
  
  caption_it(name, cite, caption)
}

cap_tab <- function(name, cite = FALSE, caption = "")
{
  if(exists("TAB_CAPTION_COUNTER", envir = globalenv())){
    assign("TAB_CAPTION_COUNTER", TAB_CAPTION_COUNTER + 1, envir = globalenv())
  } else{
    assign("TAB_CAPTION_COUNTER", 1, envir = globalenv())
    caption_it <- captioner(prefix = "Table")
  }
  
  caption_it(name, cite, caption)
}
