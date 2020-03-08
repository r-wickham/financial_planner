#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# library(shinydashboard)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  output$tSum <- 
    output$tIn <- 
    output$tEx <- 
    output$tExAl <- 
    output$tCC <- renderDataTable(datatable(data = data.frame(a=1:10,b=letters[1:10]),editable = T))
  
  output$pSum <-
    output$pIn <-
    output$pEx <-
    output$pExAl <- 
    output$pCC <- renderPlotly(plot_ly(mode="lines",type="scatter"))

})
