#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(UsingR)
library(plotly)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlotly({
    
    # generate bins based on input$bins from ui.R
    
    data(galton)
    
    p<-ggplot(galton)+geom_point(aes(parent,child))+geom_smooth(aes(parent,child),method = "lm")+labs(title="Visualisation of the Galton data set",x="Parents height",y="Childs height")
    
    p<-ggplotly(p)
    
    p
    
    
    
   # bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    #hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
  })
  output$text1<-renderText({
    
    fit<-lm(child~parent,galton)
    paste("Child's Height: ",round(predict(fit,newdata=data.frame(parent=input$height)),2))

    
  })
})
