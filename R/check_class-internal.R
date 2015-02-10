#' Check the class of an input parameter
#' 
#' @export

check_class <- function(.param, .class){
  if(class(.param) != .class){
    stop(paste0("Wrong type supplied. Expecting parameter of class ", .class, "."))
  }
}