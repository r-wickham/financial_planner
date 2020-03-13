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
  # Initial portfolio object
  pf <- list(name=name,
             times=times,
             assets=NULL,
             expenses=data.frame(time=times),
             expenseAllocation=data.frame(time=times),
             CC=NULL)
  
  #Template for new asset
  pf$assetTemplate <- data.frame(time=pf$times,
                                 sAmount=0,
                                 income=0,
                                 expense=0,
                                 ror=0,
                                 eAmount=0)
  
  #Template for new credit card
  pf$creditCardTemplate <- data.frame(time=pf$times,
                                      bill=0,
                                      payment=0,
                                      interest=0,
                                      carryover=0)
  #Assign name attribute
  attr(pf,"name") <- name
  
  ## Set the name for the class
  class(pf) <- "pf"
  pf
}

