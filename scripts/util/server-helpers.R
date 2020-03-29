#
# Functions to simplify the calls made on the server
#
#

### DT --------------------------------------------------------------------------------------------
#datatable package helpers

# Default function for data table creation
makeBaseDT <- function(inDF, fixedCols=0){
  #'
  #' Creates a DT object for rendering with uneditable first column
  #' 
  #' @param inDF input dataframe
  #' @param fixedCols which columns in the dataframe should be uneditable
  #' 
  library(DT)
  renderDataTable(
  datatable(data = inDF,
            filter="none",
            escape=T,
            rownames=F,
            selection="multiple",
            editable = list(target="column",disable=list(columns=fixedCols)),
            options=list(pageLength=nrow(inDF)))
  )
}


# Income datatable
makeIncomeDT <- copyfun(makeBaseDT, fixedCols=c(0,5))

# CC datatable
makeCCDT <- copyfun(makeBaseDT, fixedCols=c(0,4))




