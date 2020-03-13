
### Initialization Methods ------------------------------------------------------------------------

### createNewAsset --------------------------------------------------------------------------------

createNewAsset <- function( pf, name, ... ){
  #base class definition function
  cat(sprintf("\nCreating new asset:\t%s", name))
  UseMethod("createNewAsset",pf)
}

createNewAsset.default <- function( pf, name, ... ){
  #default function behavoir to non-portfolio
  cat(sprintf("\n\tNo available method for application of 'createNewAsset' to object of class %s",
              as.character(class(pf))))
  pf
}

createNewAsset.pf <- function( pf, name, ... ){
  #
  #' Adds a new data.frame to the income list with the specified name
  #' 
  #' @param pf portfolio class object to assing new asset
  #' @param name name of the new asset
  #' 
  #' @return portfolio with new zeroed-out asset defined
  #' 
  #' @example 
  #' pf <- createNewAsset(pf, "Joe-Income")
  #' 
  pf$assets[[name]] <- pf$assetTemplate
  cat(sprintf("\n\tAsset assigned correctly"))
  pf
}

### createNewExpense ------------------------------------------------------------------------------

createNewExpense <- function( pf, name, ...  ){
  #base class definition function
  cat(sprintf("\nCreating new expense:\t%s", name))
  UseMethod("createNewExpense",pf)
}


createNewExpense.default <- function( pf, name, ...  ){
  #default function behavoir to non-portfolio
  cat(sprintf("\n\tNo available method for application of 'createNewExpense' to object of class %s",
              as.character(class(pf))))
  pf
}

createNewExpense.pf <- function( pf, name, ...  ){
  #
  #' Adds a new expense column to the expense data.frame with the specified name
  #' 
  #' @param pf portfolio class object to assing new asset
  #' @param name name of the new expense
  #' 
  #' @return portfolio with new zeroed-out expense defined
  #' 
  #' @example 
  #' pf <- createNewAsset(pf, "Joe-Groceries")
  #' 
  pf$expenses[, name] <- 0
  cat(sprintf("\n\tExpense assigned correctly"))
  pf
}


### createCreditCard ------------------------------------------------------------------------------

createCreditCard <- function( pf, name, ...  ){
  #base class definition function
  cat(sprintf("\nCreating new credit card:\t%s", name))
  UseMethod("createCreditCard",pf)
}


createCreditCard.default <- function( pf, name, ...  ){
  #default function behavoir to non-portfolio
  cat(sprintf("\n\tNo available method for application of 'createCreditCard' to object of class %s",
              as.character(class(pf))))
  pf
}

createCreditCard.pf <- function( pf, name, ...  ){
  #
  #' Adds a new expense column to the expense data.frame with the specified name
  #' 
  #' @param pf portfolio class object to assing new asset
  #' @param name name of the new expense
  #' 
  #' @return portfolio with new zeroed-out expense defined
  #' 
  #' @example 
  #' pf <- createNewAsset(pf, "Joe-Groceries")
  #' 
  pf$CC[[name]] <- pf$
  cat(sprintf("\nCredit card assigned correctly"))
  pf
}







