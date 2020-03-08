### String Manipulation ---------------------------------------------------------------------------

getExpenseNames <- function(inDF){
  #'
  #' Retrieve the current expense category names
  #' 
  #' @param inDF the expense data.frame
  #' 
  #' @return names associated with expenses (i.e., non-metadata like 'time')
  #' 
  #' see here for more regex info:
  #' https://stackoverflow.com/questions/27986361/regular-expression-excluding-word-in-r
  #' 
  exNames <- grep(pattern = "^(?!.*time)", names(inDF), value = T, perl = T)
  if(length(exNames)==0) return(NULL)
  exNames
}
