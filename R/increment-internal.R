#' Increment function, for incrementing a hierarchical number
#' 
#' @param values The list of figure numbers that need to be incremented
#' @param level Which number should be incremented
#' 
#' @keywords internal
#' @export

increment <- function(values, level)
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
    # Increment a lowercase letter
    else if(any(letters == n_list[[index]]))
    {
      num <- which(letters == n_list[[index]])
      n_list[[index]] <- letters[num + 1]
      check_letter(num)
    }
    # Increment an uppercase letter
    else if(any(LETTERS == n_list[[index]]))
    {
      num <- which(LETTERS == n_list[[index]])
      n_list[[index]] <- LETTERS[num + 1]
      check_letter(num)
    }
    else stop("List contains invalid data types.  Only character or numeric allowed.")
    
    return(n_list)
  }
  
  # If requested increment level is greater than the length of the list, stop.
  if(level > length(values))
  {
    stop("Increment level supplied is out of bounds.")
  }
  # If requested level is equal to the length of the list, increment
  # only the final value in the list
  else if(level == length(values))
  {
    values <- inc_lett_num(values, level)
  }
  # If requested level is less than the length of the list, increment the value
  # and set all following values to 1, a, or A
  else
  {
    values <- inc_lett_num(values, level)
    
    # set all remaining letters/numbers to the lowest value
    for(i in (level + 1):length(values)){
      if(any(LETTERS == values[i])){
        values[i] <- "A"
      } else if(any(letters == values[i])){
        values[i] <- "a"
      } else values[i] <- 1
    }
  }
  
  return(values)
}