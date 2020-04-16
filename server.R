# server.R
# ui.R
install.packages("maps")
library(shiny)
library(maps)
library(mapproj)

counties <- readRDS("data/counties.rds")
source("helpers.R")

shinyServer(
  function(input, output) {
    
    output$map <- renderPlot({
      var <- switch(input$var, 
      "Percent White" = counties$white,
      "Percent Black" = counties$black,
      "Percent Hispanic" = counties$hispanic,
      "Percent Asian" = counties$asian)
      
      legend.title <- switch(input$var, 
       "Percent White" = " White",
       "Percent Black" = " Black",
        "Percent Hispanic" = "Hispanic",
        "Percent Asian" = "Asian")
          
      
      color <- switch(input$var, 
      "Percent White" = "green",
        "Percent Black" = "black",
        "Percent Hispanic" = "purple",
        "Percent Asian" = "red")
      percent_map(var, color, legend.title, input$range[1], input$range[2])
    })
      
  }
)
    
