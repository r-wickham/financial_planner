
### Generic ---------------------------------------------------------------------------------------

pGeneric <- function( dfIn, colsToPlotP1=NULL, colsToPlotP2=NULL, yAxisP1=NULL, yAxisP2=NULL, ... ){
  #'
  #' Creates plotly object of portfolio selection
  #'
  library(plotly)
  library(reshape2)
  
  #Default is to plot everything
  colNames <- names(dfIn)
  if(is.null(colsToPlotP1)) colsToPlotP1 <- colNames
  
  # melt by date
  mData <- melt(data = dfIn, id.vars="time",measure.vars = colNames[colNames != "time"],
                na.rm = F, factorsAsStrings = T)
  
  pOut <- p1 <- plot_ly(data = mData[mData$variable %in% colsToPlotP1,],
                        x=~time, y=~value, color=~variable,
                        type="scatter", mode="lines") %>%
    layout(yaxis=list(title=yAxisP1))
  
  if( !is.null(colsToPlotP2) ){
    p2 <- plot_ly(data = mData[mData$variable %in% colsToPlotP2,],
                  x=~time, y=~value, color=~variable,
                  type="scatter", mode="lines") %>%
      layout(yaxis=list(title=yAxisP2))
    pOut <- subplot(p1, p2, nrows=2, shareX = T, titleY = T)
  }
  pOut
}


### Summary ---------------------------------------------------------------------------------------






### Income ----------------------------------------------------------------------------------------

#'
#' Creates plotly object for current selected income 
#'
pIn <- copyfun(f = pGeneric,
               colsToPlotP1=c("time","income","expense","eAmount"),
               colsToPlotP2=c("ror"),
               yAxisP1="Value ($1k)",
               yAxisP2="Rate of Return (%)")


### Expenses --------------------------------------------------------------------------------------

#'
#' Creates plotly object for current selected income 
#'
pEx <- copyfun(f = pGeneric,
               yAxisP1="Value ($1k)")


### Expense Allocation ----------------------------------------------------------------------------



