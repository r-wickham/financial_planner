###___Computing -----------------------------------------------------------------------------------

computeIncome <- function(dfIn){
  #'
  #' Balances income dataframe
  #'   eMount = (sAmount + income - expense)*(1+ror/100)
  #'
  #' @param dfIn income dataframe
  #' 
  #' @return balanced income with dataframe
  #' 
  for( k in 1:nrow(dfIn)){
    dfIn$eAmount[k] <- with(dfIn[k,],
                            (sAmount + income - expense)*(1+ror/100))
    if( k != nrow(dfIn)) dfIn$sAmount[k+1] <- dfIn$eAmount[k]
  }
  dfIn
}

### Rounding Dataframes ---------------------------------------------------------------------------

roundDF <- function(dfIn, prec=2, colsToRound=NULL){
  #'
  #' Rounds all values in dataframe to provided decimal position
  #' 
  #' @param dfIn input dataframe
  #' @param prec desired precision (default = 2)
  #' @param colsToRound perl reguluar expression to be evaulated or column names as string 
  #' 
  #' @return dataframe with rounded columns
  #' 
  dfNames <- names(dfIn)
  if(!is.null(colsToRound)) 
    colsToRound <- grep(pattern = paste(colsToRound,collapse="|"),
                        x = dfNames, perl = T,value = T)
  dfIn[, colsToRound] <- lapply(dfIn[, colsToRound], round, digits=2)
  dfIn
}

roundIncomeDF <- 
  copyfun(roundDF,colsToRound=c("sAmount","income","expense","ror","eAmount"))

roundExpenseDF <- 
  copyfun(roundDF,colsToRound="^(?!.*total)")

roundExpenseAllocationDF <- 
  copyfun(roundDF,colsToRound=c("per_","c_"))

