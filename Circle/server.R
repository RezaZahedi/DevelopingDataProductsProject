#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$circlePlot <- renderPlot({
    
       cx = 10
       cy = 10
       rad <- 5
       n <- as.integer(input$n)
       lineWidth <- 7
       if(n %% 2 == 0 ){
            theta <- seq(from = pi/n , to = 2 * pi + pi/n,
                         length.out = n+1)
       }
       else{
            theta <- seq(from = pi/2 , to = 2 * pi + pi/2,
                         length.out = n+1)
       }
       x <- cx + rad * cos(theta)
       y <- cy + rad * sin(theta)
       
       red <- 193
       green <- 70
       blue <- 13
       plot(x, y, ylim = input$ylim, xlim = input$xlim, type = "l", bty = "n",
            col = rgb(input$red, input$green, input$blue, max=255),
            lwd = lineWidth)
       points(10, 10, pch = 19)
       
    
  })
  
})
