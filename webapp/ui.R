#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

#--------------------------------------------------------------------------------------------------
# Navigator Sidebar options:
#   --- Portfolio Selection and Saving ---
#   select portfolio
#   portfolio save name
#   save portfolio button
#   --- Time Window Selection ---
#   time interval
#   start and stop times
#   
#
# Tabs:
#   summary
#   income
#   expenses
#   expense allocation
#   credit cards(?)
#--------------------------------------------------------------------------------------------------


cat("\nRunning ui")


shinyUI(
    fluidPage(
        
        ### Portfolio Selection and Saving --------------------------------------------------------
        
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
                      placeholder = "Joe's Portfolio"),
            #Save Button
            actionButton("savePf", "Save Portfolio"),
            # Time period selection
            selectInput("timePeriod",
                        label="Time Interval:",
                        choices=c("month","year"),
                        selected="year"),
            
            
            ### Time Window Selection -------------------------------------------------------------
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
                                       selected=year(Sys.Date())
                           )
                    )
                ), # fluidRow
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
                ) # fluidRow
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
        
        
        
        ### Main Panel Tabs -----------------------------------------------------------------------
        mainPanel(
            tabsetPanel(
                ### Summary -----------------------------------------------------------------------
                tabPanel("Summary",
                         fluidRow(plotlyOutput("pSum")),
                         fluidRow(dataTableOutput("tSum"))
                ), # summary tab panel

                ### Income ------------------------------------------------------------------------
                tabPanel("Income",
                         fluidRow(
                             # Income selection and creation options
                             column(width=4,
                                    selectInput("sIn",
                                                label="Income Selection:",
                                                choices=names(pf$assets))
                             ),
                             # Name of new income
                             column(width=4,
                                    textInput("sNewIn",label="New Income Name")
                             ),
                             # Add new income button
                             column(width=4,
                                    actionButton("sCreateIn",label="Add New Income"),
                             )
                         ), # Top row income
                         #table and plotly
                         fluidRow(plotlyOutput("pIn")),
                         fluidRow(dataTableOutput("tIn"))
                ), # income panel

                ### Expense -----------------------------------------------------------------------
                tabPanel("Expense",
                         fluidRow(
                             # Income selection and creation options
                             column(width=4,
                                    selectInput("eIn",
                                                label="Expense Selection:",
                                                choices=names(pf$expenses))
                             ),
                             # Name of new income
                             column(width=4,
                                    textInput("sNewName",label="New Expense Name")
                             ),
                             # Add new income button
                             column(width=4,
                                    actionButton("sMakeNew",label="Add New Expense"),
                             )
                         ), # Top row expense
                         #table and plotly
                         fluidRow(plotlyOutput("pEx")),
                         fluidRow(dataTableOutput("tEx"))
                ), # expense panel


                ### Credit Cards ------------------------------------------------------------------
                tabPanel("Credit Cards",
                         fluidRow(
                             # Credit Card selection and creation options
                             column(width=4,
                                    selectInput("eIn",
                                                label="CC Selection:",
                                                choices=names(pf$expenses))
                             ),
                             # Name of new income
                             column(width=4,
                                    textInput("sNewName",label="New CC Name")
                             ),
                             # Add new income button
                             column(width=4,
                                    actionButton("sMakeNew",label="Add New CC"),
                             )
                         ), # Top row expense
                         #table and plotly
                         fluidRow(plotlyOutput("pCC")),
                         fluidRow(dataTableOutput("tCC"))
                ), # CC tab

                ### Expense Allocation ------------------------------------------------------------
                tabPanel("Expense Allocation",
                         #dropdown to select expense allocation method
                         selectInput("sExAL",
                                     label="Expense Allocation Method:",
                                     choices=c("Percent","Cost")),
                         fluidRow(plotlyOutput("pExAl")),
                         fluidRow(dataTableOutput("tExAl"))
                ) # expense allocation panel
            ) #tabset panel
        ) # main panel
    ) #fluid page
) # shiny UI
