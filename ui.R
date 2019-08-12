#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Geospatial Distance Calculator"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      numericInput("long1", "Longitude 1:", 121.049941, min = -180, max = 180),
      numericInput("lat1", "Latitude 1:", 14.553600, min = -90, max = 90),
      numericInput("long2", "Longitude 2:", 121.049815, min = -180, max = 180),
      numericInput("lat2", "Latitude 2:", 14.572073, min = -90, max = 90),
      submitButton("Submit")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       leafletOutput("mapPlot"),
       h3("Distance calculated between two points:"),
       textOutput("Distance")
    )
  )
))
