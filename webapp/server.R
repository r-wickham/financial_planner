#
# Server for financial portflowio
#
#
#


cat("\nRunning server")


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$tSum <- makeDataTable(pf$summary)
    output$tIn <- 
    output$tEx <- makeDataTable(pf$expenses)
    
    output$tExAl <- 
    output$tCC <- 
      makeDataTable(data.frame(times=seq(as.Date("2000-01-01"), length.out=1000, by="d"),
                               value=sample(1:1000,1000)))
  
  output$pSum <-
    output$pIn <-
    output$pEx <-
    output$pExAl <- 
    output$pCC <- 
    renderPlotly(plot_ly(mode="lines",type="scatter"))
  
  ### Change Start/End Dates ----------------------------------------------------------------------
  
  # observeEvent(input$printInput, {
  #   
  #   
  # })
  
  ### Add New Element to Portflio -----------------------------------------------------------------
  #Add asset, expense, or credit card
  
  # observeEvent(input$addToPf, {
  #   #Retrieve the type of element to create
  #   
  # })
  
  
})
