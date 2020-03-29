# The first script to be run in the webapp
#
# Set options
# Initializes global functions
#
library(plotly)
library(shiny)
library(DT)
library(lubridate)
library(yaml)
library(shinyjs)

"%!in%" <- function(x,y)!(x %in% y)

# The app name
appName <- "financial_planner"

# Ensuring the working directory is correct
while( basename(getwd()) != appName ) setwd("..")

#Save directory for portfolio relative to project base dir
pfSaveDir <- "saved_portfolios"

### Options ---------------------------------------------------------------------------------------

# Setting the datatable options globally
# Website: https://datatables.net/reference/option/
options(DT.options=
          list(scroller=T, 
               scrollY=300, # height of scroll window
               dom='ti',    # data control elements 
               autoWidth=T))


### Sourcing Scripts ------------------------------------------------------------------------------ 
scriptsToSource <- dir("scripts/util",full.names = T,pattern = "*.R")

cat(sprintf("\nSourcing scripts:\n\t%s",
            paste0(scriptsToSource, collapse="\n\t")))

for(s in scriptsToSource) source(s)





### CONTINUE HERE ######################

# For testing writing messages to a console
foo <- function() {
  message("one")
  Sys.sleep(0.5)
  message("two")
}

# Allocate expenses
# pf <- allocateExpenses()












