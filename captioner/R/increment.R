#' Increment function, for incrementing a hierarchical number
#'
#' Given a vector of numbers representing a subfigure, or a subsection figure, this function will
#' increment the original figure number
#' 
#' @param number A list of numbers or characters representing the complete figure numbering
#' @param level An index designating at which level the number should be incremented
#' 
#' @return A vector representing the incremented number
#' 
#' @details Increment details here...
#' 
#' @examples
#' 
#' @export

increment <- function(number, level)
{
  # Function to see if you got to the end of the alphabet
  check_letter <- function(.index){
    if(.index >= 26) warning("You have reached the end of the alphabet. Returning NA.")
    else(return(invisible()))
  }
  
  # Increment a number
  inc_lett_num <- function(){
    if(is.numeric(number[[level]])){
      # Increment the number
      number[[level]] <- number[[level]] + 1
    } else if(is.character(number[[level]])){
      # Find the letter in one of the letter vectors
      # Then pick the next letter in the vector
      if(any(letters == number[[level]])){
        num <- which(letters == number[[level]])
        number[[level]] <- letters[num + 1]
        check_letter(num)
      } else{
        num <- which(LETTERS == number[[level]])
        number[[level]] <- LETTERS[num + 1]
        check_letter(num)
      } else stop("Number contains invalid data types.")
    }
  }
  
  # Check level to see if it is >, < or == the length of the number
  if(level > length(number)){
    stop("Increment level supplied is out of bounds.")
  } else if(level == length(number)){
    inc_lett_num()
  } else {
    inc_lett_num()
    # set all remaining letters/numbers to 1, "a", or "A"
  }
  
  return(number)
}