
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

removeExpense <- function( name ){
  #base class definition function
  cat(sprintf("\nRemoving asset:\t%s", name))
  UseMethod("removeAsset",pf)
}

removeExpense.default <- function( pf, name  ){
  #default function behavoir to non-portfolio
  cat(sprintf("\n\tNo available method for application of 'removeAsset' to object of class %s",
              as.character(class(pf))))
  pf
}

removeExpense.pf <- function( name ){
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