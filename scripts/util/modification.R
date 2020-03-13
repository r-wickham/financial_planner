
### removeAsset ----------------------------------------------------------------------------

removeAsset <- function( name ){
  #base class definition function
  cat(sprintf("\nRemoving asset:\t%s", name))
  UseMethod("removeAsset",pf)
}

removeAsset.default <- function( pf, name  ){
  #default function behavoir to non-portfolio
  cat(sprintf("\n\tNo available method for application of 'removeAsset' to object of class %s",
              as.character(class(pf))))
  pf
}

removeAsset.pf <- function( name ){
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
  UseMethod("removeAsset",pf)
}

removeExpense.default <- function( pf, ...  ){
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
  pf$expenses[[name]] <- NULL
  pf
}

### add Asset -------------------------------------------------------------------------------------

addAsset <- function(  pf, name, ... ){
  #base class definition function
  cat(sprintf("\nAdding asset:\t%s", name))
  UseMethod("addAsset",pf)
}

addAsset.default <- function( pf, name, ...  ){
  #default function behavoir to non-portfolio
  cat(sprintf("\n\tNo available method for application of 'addAsset' to object of class %s",
              as.character(class(pf))))
  pf
}

addAsset.pf <- function( pf, name, ... ){
  #'
  #' Removes asset from portflio
  #' 
  #' @param name name of asset to remove
  #' 
  #' @return portflio with asset removed
  #' 
  pf$assets[[name]] <- pf$assetTemplate
  pf
}

### add Expense -----------------------------------------------------------------------------------





