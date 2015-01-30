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
  # check if you got to the end of the alphabet
  check_letter <- function(n){
    if(n >= 26) warning("You have reached the end of the alphabet. Returning NA.")
  }
    
  # check if the value at the supplied index is a letter or a number
  # then increment it
  inc_lett_num <- function(n_list, index){
    # Increment a number
    if(is.numeric(n_list[[index]]))
    {
      n_list[[index]] <- n_list[[index]] + 1
    }
    else if(any(letters == n_list[[index]]))
    {
      num <- which(letters == n_list[[index]])
      n_list[[index]] <- letters[num + 1]
      check_letter(num)
    }
    else if(any(LETTERS == n_list[[index]]))
    {
      num <- which(LETTERS == n_list[[index]])
      n_list[[index]] <- LETTERS[num + 1]
      check_letter(num)
    }
    else stop("List contains invalid data types.  Only character or numeric allowed.")
    
    return(n_list)
  }
  
  # Check level to see if it is >, < or == the length of the number
  if(level > length(number)){
    stop("Increment level supplied is out of bounds.")
  } else if(level == length(number)){
    number <- inc_lett_num(number, level)
  } else {
    number <- inc_lett_num(number, level)
    
    # set all remaining letters/numbers to the lowest value
    for(i in (level + 1):length(number)){
      if(any(LETTERS == number[i])){
        number[i] <- "A"
      } else if(any(letters == number[i])){
        number[i] <- "a"
      } else number[i] <- 1
    }
  }
  
  return(number)
}