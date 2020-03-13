# The first script to be run in the webapp
#
# Set options
# Initializes global functions
#
library(plotly)
library(shiny)
library(DT)
library(lubridate)

# The app name
appName <- "financial_planner"

# Ensuring the working directory is correct
while( basename(getwd()) != appName ) setwd("..")

### Options ---------------------------------------------------------------------------------------

# Setting the datatable options globally
options(DT.options=
          list(scroller=T, scrollY=300, dom='ti', autoWidth=T))


### Sourcing Scripts ------------------------------------------------------------------------------ 
scriptsToSource <- dir("scripts/util",full.names = T,pattern = "*.R")

cat(sprintf("\nSourcing scripts:\n\t%s",
            paste0(scriptsToSource, collapse="\n\t")))

for(s in scriptsToSource) source(s)


### Default Portfolio -----------------------------------------------------------------------------
# A default portfolio to use as an example
#
# TODO:   Eventually save a pre-created portfolio as 'Default Portfolio'
#         to auto-load or be created on startup if no other portfolios are available
#         to load

# 50 years out from now
pf <- portfolio(name = "Default Portfolio",
                times = year(Sys.Date()):(year(Sys.Date())+60))

# Add steady 50k income
pf <- addAsset(pf = pf, name = "Joe's Income")

# Add 

# Assume expenses of 40k



