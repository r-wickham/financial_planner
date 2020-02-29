
### Initialization Methods ------------------------------------------------------------------------

### Create New Asset ------------------------------------------------------------------------------

createNewAsset <- function( pf, name  ){
  #base class definition function
  cat(sprintf("\nCreating new asset:\t%s", name))
  UseMethod("createNewAsset",pf)
}

createNewAsset.default <- function( pf, name  ){
  #default function behavoir to non-portfolio
  cat(sprintf("\n\tNo available method for application of 'createNewAsset' to object of class %s",
              as.character(class(pf))))
  return(NULL)
}

createNewAsset.pf <- function( pf, name  ){
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
  cat(sprintf("\n\tAssest assigned correctly"))
  pf$assets[[name]] <- data.frame(time=pf$times,
                                  sAmount=0,
                                  income=0,
                                  deduction=0,
                                  ror=0,
                                  eAmount=0,
                                  total=0)
  pf
}
