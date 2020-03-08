#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


library(plotly)
library(shiny)
library(DT)
library(lubridate)


#--------------------------------------------------------------------------------------------------
# Navigator Sidebar options:
#   summary (select portfolio)
#
# Tabs:
#   income
#   expenses
#   expense allocation
#   credit cards(?)
#--------------------------------------------------------------------------------------------------




# Define UI for application that draws a histogram
shinyUI(
    fluidPage(
        
        # Title
        titlePanel("Long-Mid Term Financial Planner"),
        sidebarPanel(
            # Portfolio Selection
            selectInput("pf",
                        label="Portfolio Selection:",
                        choices=c("<None>","all the way"),
                        selected=NULL),
            # Save Name
            textInput("pfSave", label="Portfolio Name:", value = "",
                      placeholder = "Joes Portfolio"),
            #Save Button
            actionButton("savePf", "Save Portfolio"),
            # Time period selection
            selectInput("timePeriod",
                        label="Time Interval:",
                        choices=c("month","year"),
                        selected="year"),
            
            # Time window selection, conditional panel for selection of time interval
            
            #By month-year
            conditionalPanel(
                condition = "input.timePeriod == 'month'",
                fluidRow(
                    # start month
                    column(width=6,
                           selectInput("timeSm",
                                       label="Start Month:",
                                       choices = month.abb,
                                       selected=month(Sys.Date())
                           )
                    ),
                    # start year
                    column(width=6,
                           selectInput("timeSy",
                                       label="Start Year:",
                                       choices = 1950:2100,
                                       selected=month(Sys.Date())
                           )
                    )
                ),
                fluidRow(
                    # end month
                    column(width=6,
                           selectInput("timeEm",
                                       label="End Month:",
                                       choices = month.abb,
                                       selected=month(Sys.Date())
                           )
                    ),
                    # end year
                    column(width=6,
                           selectInput("timeEy",
                                       label="End Year:",
                                       choices=1950:2100,
                                       selected=year(Sys.Date())+50
                           )
                    )
                )
            ),  # month conditional panel
            
            #By year
            conditionalPanel(
                condition = "input.timePeriod == 'year'",
                fluidRow(
                    # start year
                    column(width=6,
                           selectInput("timeSy",
                                       label="Start Year:",
                                       choices=1950:2100,
                                       selected=year(Sys.Date()))
                    ),
                    # end year
                    
                    column(width=6,
                           selectInput("timeEy",
                                       label="End Year:",
                                       choices=1950:2100,
                                       selected=year(Sys.Date())+50)
                    )
                )
            ), # year conditional panel
            
            width=3
        ), #side bar panel
        # 
        
        
        ### Main Panel Tabs ---------------------------------------------------------------------------
        mainPanel(
            tabsetPanel(
                tabPanel("Summary",
                         fluidRow(plotlyOutput("pSum")),
                         fluidRow(dataTableOutput("tSum"))
                ),
                
                tabPanel("Income",
                         #dropdown to select income
                         selectInput("sIn",
                                     label="Portfolio Selection:",
                                     choices=names(pf$assets)),
                         #table and plotly
                         fluidRow(column(width=3,
                                         dataTableOutput("tIn")),
                                  column(width=6,plotlyOutput("pIn")))
                ), # income panel
                
                tabPanel("Expense",
                         #dropdown to select expense
                         selectInput("sEx",
                                     label="Expense Selection:",
                                     choices=getExpenseNames(pf$expenses)),
                         #table and plotly
                         fluidRow(column(width=3,
                                         #dropdown to select expense
                                         dataTableOutput("tEx")),
                                  column(width=6,plotlyOutput("pEx")))
                ), #expense panel
                
                tabPanel("Expense Allocation",
                         #dropdown to select expense allocation method
                         selectInput("sExAL",
                                     label="Expense Allocation Method:",
                                     choices=c("Percent","Cost")),
                         fluidRow(column(width=3,
                                         dataTableOutput("tExAl")),
                                  column(width=6,plotlyOutput("pExAl")))
                ), # expense allocation panel
                
                tabPanel("Credit Cards",
                         #dropdown to select expense
                         selectInput("sCC",
                                     label="Credit Cards:",
                                     choices=names(pf$CC)),
                         #table and plotly
                         fluidRow(column(width=3,
                                         #dropdown to select expense
                                         dataTableOutput("tCC")),
                                  column(width=6,plotlyOutput("pCC")))
                ) # CC tab
                
            ) #tabset panel
        ) # main panel
    ) #fluid page
) # shiny UI
