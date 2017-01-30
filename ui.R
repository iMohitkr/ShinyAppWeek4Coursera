#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predicting the Childs height"),
  helpText("Find the height of child by entering the parent's height via slider"),
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("height",
                   "Height of Parent:",
                   min = 1,
                   max = 73,
                   value = 40)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotlyOutput("distPlot"),
       textOutput("text1")
       
       
    )
  )
))
