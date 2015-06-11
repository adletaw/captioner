#' Check the class of an input parameter
#' 
#' @param .param The object that you want to check the class of
#' @param .class The expected class for \code{.param}
#' 
#' @keywords internal
#' @export

check_class <- function(.param, .class){
  if(class(.param) != .class){
    stop(paste0("Wrong type supplied. Expecting parameter of class ", .class, "."))
  }
}