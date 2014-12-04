#' Simple figure/table caption generators
#' 
#' @aliases cap_tab
#' cap_fig
#' 
#' A simplified captioner to create numbered figure or table captions without generating your own captioner
#' 
#' @usage cap_fig(name, cite = FALSE, caption = "")
#' cap_tab(name, cite = FALSE, caption = "")
#' 
#' @param name Character string giving a unique name for the figure or table
#' @param cite Logical indicating whether or not you would like a short form for in text citing
#' @param caption Character string containing the caption
#' 
#' @return Character string containg the prefix and figure/table number with or without caption
#' 
#' @examples cap_fig("flower_plot", "Histogram of flower colors.")
#' cap_tab("flower_table", "Table showing flower color distribution.")
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
