#
# Server for financial portflowio
#
#
#


cat("\nRunning server")


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$sumT <- makeBaseDT(pf$summary)
  output$sumP <- renderPlotly(plot_ly(mode="lines",type="scatter"))
  
  observeEvent(input$inSel,{
    output$inT <- makeBaseDT(pf$assets[[input$inSel]])
    output$inP <- renderPlotly(pIn(pf$assets[[input$inSel]]))
  })
  
  observeEvent(input$exSel,{
    output$exT <- makeBaseDT(pf$expenses)
    output$exP <- renderPlotly(pEx(pf$expenses))
  })
  
  observeEvent(input$ccSel,{
    output$ccT <- makeBaseDT(pf$CC[[input$ccSel]])
    output$ccP <- renderPlotly(plot_ly(mode="lines",type="scatter"))
  })
  
  observeEvent(input$exAlSel,{
    output$exAlT <- makeBaseDT(pf$expenseAllocation)
    output$exAlP <- renderPlotly(plot_ly(mode="lines",type="scatter"))
  })
  
  
  ### Saving and Loading ---------------------------------------------------------------------------
  
  observeEvent(input$pfSave,{
    pf$name <- input$pfSave
    cat(sprintf("\nNew portfolio name:\t'%s'", input$pfSave))
  })
  
  observeEvent(input$savePf,{
    createSaveDir()
    savePortfolio(pf)
  })
  
  observeEvent(input$pfSel,{
    loadFileName <- sprintf("%s/%s.yaml",pfSaveDir,input$pfSel)
    if(file.exists(loadFileName))
      pf <- read_yaml(file = loadFileName)
  })
  
  ### Change Portfolio Selection ------------------------------------------------------------------
  
  
  
  ### Change Start/End Dates ----------------------------------------------------------------------
  #Preserve data at given times, expand/contract DF
  
  # observeEvent(input$, {
  #   
  #   
  # })
  
  ### Add/Remove Element to Portflio -----------------------------------------------------------------
  #Add asset, expense, or credit card
  
  observeEvent(input$inMakeNew, { # make new asset
    createNewAsset(pf = pf, name = input$inNewName)
  })
  
  observeEvent(input$inRemove, { # remve asset
    removeAsset(pf = pf, name = input$inSel)
  })

  observeEvent(input$exMakeNew, { #make new expense
    createNewExpense(pf = pf, name = input$exNewName)
  })
  
  observeEvent(input$exRemove, { # remove expense
    removeExpense(pf = pf, name = input$exSel)
  })

  observeEvent(input$dMakeNew, { # make new debt
    createNewDebt(pf = pf, name = input$dNewName)
  })
  
  observeEvent(input$dRemove, { # remove debt
    removeCC(pf = pf, name = input$dSel)
  })
  
  ### Console Log -------------------
  
  withCallingHandlers({
    shinyjs::html("text", "")
    foo()
  })
  
  message = function(m) {
    shinyjs::html(id = "text", html = m$message, add = TRUE)
  }
  
})
