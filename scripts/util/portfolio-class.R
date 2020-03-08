#Class definition for the main object that stores
#  assets, expenses, expense allcation, and methods for computing

portfolio <- function(name, times){
  #' Initial of base portfolio class
  #'
  #' @param name  string of new portfolio's name
  #' @param times numeric vector of associated times
  #' 
  #' @return portfolio class object with initialized name and times
  #'         assets, expenses, and expenseAllocation attributes
  #'         set to NULL
  #'         
  pf <- list(name=name,
             times=times,
             assets=NULL,
             expenses=data.frame(time=times),
             expenseAllocation=NULL,
             CC=NULL)
  ## Set the name for the class
  class(pf) <- "pf"
  pf
}

