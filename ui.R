#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

library(markdown)
shinyUI(navbarPage("Select Recommended Cars for Your Trip",
                   tabPanel("Home",
                            # Sidebar
                            sidebarLayout(
                              sidebarPanel(
                                helpText("Enter trip details and car preferences:"),
                                numericInput('dis', 'Travel Distance in Miles:', 25, min = 1, max = 1000),
                                numericInput('cost', 'Gas Cost Per Gallon):', 2.00, min = 2, max = 4, step=0.01),
                                numericInput('gas', 'Budgeted Gasoline Cost:', 25, min=1, max=1000),
                                checkboxGroupInput('cyl', 'Desired Number of cylinders:', c("Four"=4, "Six"=6, "Eight"=8), selected = c(4)),
                                checkboxGroupInput('am', 'Desired Transmission:', c("Automatic"=0, "Manual"=1), selected = c(0))
                              ),
                              mainPanel(
                                dataTableOutput('table')
                              )
                            )
                   ),
                   tabPanel("About",
                            mainPanel(
                              plotOutput("About.Rmd")
                            )
                   )
))  
