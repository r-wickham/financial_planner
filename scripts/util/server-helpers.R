#
# Functions to simplify the calls made on the server
#
#

### DT --------------------------------------------------------------------------------------------
#datatable package helpers

makeDataTable <- function(inDF){
  library(DT)
  renderDataTable(
  datatable(data = inDF,
            filter="none",
            escape=T,
            rownames=F,
            selection="single",
            editable = list(target="column",disable=list(columns=0)),
            options=list(pageLength=nrow(inDF)))
  )
}