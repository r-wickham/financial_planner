
### removeAsset ----------------------------------------------------------------------------------

removeAsset <- function( pf, name, ... ){
  #base class definition function
  cat(sprintf("\nRemoving income:\t%s", name))
  UseMethod("removeIncome",pf)
}

removeAsset.default <- function( pf, name, ...  ){
  #default function behavoir to non-portfolio
  cat(sprintf("\n\tNo available method for application of 'removeIncome' to object of class %s",
              as.character(class(pf))))
  pf
}

removeAsset.pf <- function( pf, name, ... ){
  #'
  #' Removes asset from portflio
  #' 
  #' @param name name of asset to remove
  #' 
  #' @return portflio with asset removed
  #' 
  pf$assets[[name]] <- NULL
  pf
}

### removeExpense ---------------------------------------------------------------------------------

removeExpense <- function( pf,name, ... ){
  #base class definition function
  cat(sprintf("\nRemoving asset:\t%s", name))
  UseMethod("removeExpense",pf)
}

removeExpense.default <- function( pf,name, ...  ){
  #default function behavoir to non-portfolio
  cat(sprintf("\n\tNo available method for application of 'removeAsset' to object of class %s",
              as.character(class(pf))))
  pf
}

removeExpense.pf <- function( pf,name, ... ){
  #'
  #' Removes expense from portflio
  #' 
  #' @param name name of asset to remove
  #' 
  #' @return portflio with expense removed
  #' 
  pf$expenses[,name] <- NULL
  pf
}

### removeCC -----------------------------------------------------------------------------------------

removeDebt <- function( pf, name, ... ){
  #base class definition function
  cat(sprintf("\nRemoving debt\t%s", name))
  UseMethod("removeCC",pf)
}

removeDebt.default <- function( pf, name, ...  ){
  #default function behavoir to non-portfolio
  cat(sprintf("\n\tNo available method for application of 'removeDebt' to object of class %s",
              as.character(class(pf))))
  pf
}

removeDebt.pf <- function( pf, name, ... ){
  #'
  #' Removes asset from portflio
  #' 
  #' @param name name of asset to remove
  #' 
  #' @return portflio with asset removed
  #' 
  pf$debt[[name]] <- NULL
  pf
}

### totalExpenses ---------------------------------------------------------------------------------


totalExpenses <- function(inDF){
  #'
  #' Sums the expenses to the total column 
  #' 
  colsToSum <- names(inDF)[names(inDF) %!in% c("time","total")]
  inDF$total = Reduce("+", as.data.frame(inDF[,colsToSum]))
  inDF
}

### allocateExpenses ------------------------------------------------------------------------------

allocateExpenses <- function(pf, usePercent=T){
  #'
  #' Assigns expenses to the income DF
  #' 
  #' Default behavior is to allocate all to the first expense
  #'
  
  # Assign expense values to expense column of asset
  
  # For each expense, assign the designated amount
  #   by percent or cost
  
  pf
}


#' 
#' ### addIncome -------------------------------------------------------------------------------------
#' 
#' addIncome <- function(  pf, name, ... ){
#'   #base class definition function
#'   cat(sprintf("\nAdding asset:\t%s", name))
#'   UseMethod("addAsset",pf)
#' }
#' 
#' addIncome.default <- function( pf, name, ...  ){
#'   #default function behavoir to non-portfolio
#'   cat(sprintf("\n\tNo available method for application of 'addIncome' to object of class %s",
#'               as.character(class(pf))))
#'   pf
#' }
#' 
#' addIncome.pf <- function( pf, name, ... ){
#'   #'
#'   #' Removes asset from portflio
#'   #' 
#'   #' @param name name of asset to remove
#'   #' 
#'   #' @return portflio with asset removed
#'   #' 
#'   pf$assets[[name]] <- pf$assetTemplate
#'   pf
#' }
#' 
#' ### addExpense ---------------------------------------------------------------------------------
#' 
#' addExpense <- function( pf,name, ... ){
#'   #base class definition function
#'   cat(sprintf("\nRemoving asset:\t%s", name))
#'   UseMethod("removeAsset",pf)
#' }
#' 
#' addExpense.default <- function( pf, ...  ){
#'   #default function behavoir to non-portfolio
#'   cat(sprintf("\n\tNo available method for application of 'addExpense' to object of class %s",
#'               as.character(class(pf))))
#'   pf
#' }
#' 
#' addExpense.pf <- function( pf,name, ... ){
#'   #'
#'   #' Removes expense from portflio
#'   #' 
#'   #' @param name name of asset to remove
#'   #' 
#'   #' @return portflio with expense removed
#'   #' 
#'   pf$expenses[,name] <- 0
#'   pf
#' }
#' 
#' ### addCC -----------------------------------------------------------------------------------------
#' 
#' addCC <- function( pf, name, ... ){
#'   #base class definition function
#'   cat(sprintf("\nAdd credit card:\t%s", name))
#'   UseMethod("addCC",pf)
#' }
#' 
#' addCC.default <- function( pf, name, ...  ){
#'   #default function behavoir to non-portfolio
#'   cat(sprintf("\n\tNo available method for application of 'addCC' to object of class %s",
#'               as.character(class(pf))))
#'   pf
#' }
#' 
#' addCC.pf <- function( pf, name, ... ){
#'   #'
#'   #' Removes asset from portflio
#'   #' 
#'   #' @param name name of asset to remove
#'   #' 
#'   #' @return portflio with asset removed
#'   #' 
#'   pf$CC[[name]] <- pf$creditCardTemplate
#'   pf
#' }
#' 

