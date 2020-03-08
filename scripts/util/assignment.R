### Assignment Methods
#
# General:
#   fillForwardDF(inDF)                             fills forward last valid value
#
# For income:
#   assignAssetSAmount(pf, name, time, value)       asset start amount assignment
#   assignAssetIncome(pf, name, time, value)        asset income assignment
#   assignAssetDeduction(pf, name, time, value)     assed deduction assignment
#   assignAssetRoR(pf, name, time, percent)         asset rate of return assignment
#
# For expenses:
#   assignExpenseValue(pf, name, time, value)       expense value assignment
#

### General ---------------------------------------------------------------------------------------

###_copyFun ---------------------------------------------------------------------------------------

copyfun <- function(f, ...){
  #'
  #' Copies a function with a new default arguments
  #' 
  #' @param f function to be copied with new arguments specified in '...'
  #' @param ... reasigned or additonal arguments to be specified for function
  #'
  l <- pairlist(...)
  a <- formals(f)
  n <- names(l)[names(l) %in% names(a)]
  a[n] <- l[n]
  formals(f) <- a
  f
}

###_fillForwardDF  --------------------------------------------------------------------------------

fillForwardDF <- function(inDF, defaultVal=0){
  #'
  #' Fills NA values in dataframe with non-NA values from 
  #' previous row.  If no valid values, uses default value
  #' of zero.
  #' 
  #' @param inDF input dataframe
  #' @param defaultVal default value to fill
  #' 
  #' @return input dataframe with NA values filled forward
  #' 
  #' @example 
  #' inDF=data.frame(time=1:10,a=NA)
  #' inDF$a[5]=100 #fill in a non-NA value
  #' fillForwardDF(inDF)
  #' 
  library(zoo)
  out <- na.locf(inDF, na.rm=F)
  out[is.na(out)] <- defaultVal
  out
}

























###_assignOverTimes -------------------------------------------------------------------------------

assignOverTimes <- function(inDF, times, values, colName){
  #'
  #' Assigns value to specific times associated with column provided
  #' 
  #' @param inDF dataframe to assing values to
  #' @param times times to assing value over
  #' @param value value to assign
  #' @param colName column name
  #' 
  #' @return input dataframe with values assigned
  #' 
  inDF[, colName] <- NA
  inDF[which(inDF$time %in% times), colName] <- values
  inDF
}

### Income ----------------------------------------------------------------------------------------

###_assignAssetSAmount ----------------------------------------------------------------------------

assignAssetSAmount <- function( pf, name, times, values,... ){
  #base class definition function
  cat(sprintf("\nCreating new expense:\t%s", name))
  UseMethod("assignAssetSAmount",pf)
}

assignAssetSAmount.default <- function( pf, ...){
  #default function behavoir to non-portfolio
  cat(sprintf("\n\tNo available method for application of 'assignAssetSAmount' to object of class %s",
              as.character(class(pf))))
  pf
}

assignAssetSAmount.pf <- function(pf, name, times, values,...){
  #'
  #' Assigns asset start amounts for given times
  #'
  #' @param pf portfolio class object to assign asset start amounts
  #' @param name name of asset to assign start amount
  #' @param times at which to assign values
  #' @param value constant numeric to assign
  #' 
  #' @return portfolio class with new asset start amount assigned
  #' 
  pf$assets[[name]] <- assignOverTimes(inDF = pf$assets[[name]], times = times, values= values, colName = "sAmount")
  cat("\n\t Asset start amount assigned correctly")
  pf
}

###_assignAssetIncome -----------------------------------------------------------------------------
#assign constant value over specified times

assignAssetIncome  <- function(pf, name, times, values,...){
  #base class definition function
  cat(sprintf("\nAssigning asset income:\t%s", name))
  UseMethod("assignAssetIncome",pf)
}

assignAssetIncome.default <- function(pf, ...){
  #default function behavoir to non-portfolio class
  cat(sprintf("\n\tNo available method for application of 'assignAssetIncome' to object of class %s",
              as.character(class(pf))))
  pf
}

assignAssetIncome.pf <- function(pf, name, times, values, ...){
  #'
  #' Assigns asset start amounts for given times
  #'
  #' @param pf portfolio class object to assign asset start amounts
  #' @param name name of asset to assign start amount
  #' @param times at which to assign values
  #' @param value constant numeric to assign
  #' 
  #' @return portfolio class with new asset start amount assigned
  #' 
  pf$assets[[name]] <- assignOverTimes(inDF = pf$assets[[name]], times = times, values= values, colName = "income")
  cat("\n\tAsset income assigned correctly")
  pf
}


###_assignAssetDeduction --------------------------------------------------------------------------
#assign deduction value to column

assignAssetDeduction  <- function(pf, name, times, values,...){
  #base class definition function
  cat(sprintf("\nAssigning asset deduction:\t%s", name))
  UseMethod("assignAssetDeduction",pf)
}

assignAssetDeduction.default <- function( pf, ...){
  #default function behavoir to non-portfolio class
  cat(sprintf("\n\tNo available method for application of 'assignAssetDeduction' to object of class %s",
              as.character(class(pf))))
  pf
}

assignAssetDeduction.pf <- function(pf, name, times, values, ...){
  #'
  #' Assigns asset start amounts for given times
  #'
  #' @param pf portfolio class object to assign asset start amounts
  #' @param name name of asset to assign start amount
  #' @param times at which to assign values
  #' @param value constant numeric to assign
  #' 
  #' @return portfolio class with new asset start amount assigned
  #' 
  pf$assets[[name]] <- assignOverTimes(inDF = pf$assets[[name]], times = times, values= values, colName = "expense")
  cat("\n\tAsset deduction assigned correctly")
  pf
}

###_assignAssetRoR --------------------------------------------------------------------------------
#assign rate of return value to column

assignAssetROR  <- function( pf, name, times, values,...){
  #base class definition function
  cat(sprintf("\nAssigning asset rate of return:\t%s", name))
  UseMethod("assignAssetROR",pf)
}

assignAssetROR.default <- function( pf, ...  ){
  #default function behavoir to non-portfolio class
  cat(sprintf("\n\tNo available method for application of 'assignAssetROR' to object of class %s",
              as.character(class(pf))))
  pf
}

assignAssetROR.pf <- function(pf, name, times, values,...){
  #'
  #' Assigns asset start amounts for given times
  #'
  #' @param pf portfolio class object to assign asset start amounts
  #' @param name name of asset to assign start amount
  #' @param times at which to assign values
  #' @param value constant numeric to assign
  #' 
  #' @return portfolio class with new asset start amount assigned
  #' 
  pf$assets[[name]] <- assignOverTimes(inDF = pf$assets[[name]], times = times, values= values, colName = "ror")
  cat("\n\tAsset rate of return assigned correctly")
  pf
}

### Expenses --------------------------------------------------------------------------------------

###_assignExpenseValue ----------------------------------------------------------------------------


assignExpense  <- function( pf, name, times, values,... ){
  #base class definition function
  cat(sprintf("\nAssigning expense:\t%s", name))
  UseMethod("assignExpense",pf)
}

assignExpense.default <- function( pf, ... ){
  #default function behavoir to non-portfolio class
  cat(sprintf("\n\tNo available method for application of 'assignExpense' to object of class %s",
              as.character(class(pf))))
  pf
}

assignExpense.pf <- function(pf, name, times, values,...){
  #'
  #' Assigns asset start amounts for given times
  #'
  #' @param pf portfolio class object to assign asset start amounts
  #' @param name name of asset to assign start amount
  #' @param times at which to assign values
  #' @param value constant numeric to assign
  #' 
  #' @return portfolio class with new asset start amount assigned
  #' 
  pf$expenses <- assignOverTimes(inDF = pf$expenses, times = times, values = values, colName = "ror")
  cat("\n\tExpense assigned correctly")
  pf
}

### Credit Card -----------------------------------------------------------------------------------
