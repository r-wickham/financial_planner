### Saving Methods --------------------------------------------------------------------------------
#
# createSaveDir           creates Portfolio save directory
#
# savePortfolio           save portfolio class to RData using name


createSaveDir <- function() {
  #'
  #' Creates portfolio save directory if doesn't already exist
  #' 
  if( !dir.exists("portfolios"))
    dir.create("portfolios")
}

savePortfolio <- function(pf){
  #'
  #' Saves portfolio to designated directory using assigned name
  #' 
  #' @param pf  portfolio class object to save
  #' 
  createSaveDir()
  saveFileName <- sprintf("portfolios/%s.RData", pf$name)
  cat(sprintf("\nSaved portfolio:\t'%s'", saveFileName))
  save(pf,file = saveFileName)
}

getPfSaveNames <- function(){
  c("testing")
}
