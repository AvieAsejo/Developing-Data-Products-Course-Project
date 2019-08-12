#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)
library(geosphere)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$mapPlot <- renderLeaflet({
    long1 <- input$long1
    lat1 <- input$lat1
    long2 <- input$long2
    lat2 <- input$lat2
    
    markers <- data.frame(lat = c(lat1, lat2),
                          long = c(long1, long2))
    
    markers %>%
      leaflet() %>%
      addTiles() %>%
      addMarkers()
  })
  
  output$Distance <- renderText({
    long1 <- input$long1
    lat1 <- input$lat1
    long2 <- input$long2
    lat2 <- input$lat2
    distm(c(long1, lat1), c(long2, lat2), fun = distHaversine)
  })
  
})
