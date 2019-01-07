## This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(datasets)
library(dplyr)

shinyServer(function(input, output) {
  output$table <- renderDataTable({
    data <- transmute(mtcars, Car = rownames(mtcars), MilesPerGallon = mpg, 
                      TotalGasolineCost = input$dis/mpg*input$cost,
                      Cylinders = cyl, 
                      Transmission = am,
                      wt)
    data <- filter(data, TotalGasolineCost <= input$gas, Cylinders %in% input$cyl, 
                   Transmission %in% input$am)
    data <- mutate(data, Transmission = ifelse(Transmission==0, "Automatic", "Manual"))
    data <- arrange(data, TotalGasolineCost)
    data
  }, options = list(lengthMenu = c(5, 15, 30), pageLength = 30))
})


