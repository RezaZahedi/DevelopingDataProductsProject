library(shiny)

# Define server logic required to draw an n-edged shape
shinyServer(function(input, output) {
     
     # evaluating theta, the angles in which each vertex is
     theta <- reactive({
          n <- as.integer(input$n)
          if(n %% 2 == 0 ){
               seq(from = pi/n , to = 2 * pi + pi/n,
                            length.out = n+1)
          }
          else{
               seq(from = pi/2 , to = 2 * pi + pi/2,
                            length.out = n+1)
          }
     })
     
     # ploting the n-edged shape
     output$circlePlot <- renderPlot({
    
       cx = 10
       cy = 10
       rad <- 5
       n <- as.integer(input$n)
       lineWidth <- 7
       
       x <- cx + rad * cos(theta())
       y <- cy + rad * sin(theta())
       
       red <- 193
       green <- 70
       blue <- 13
       plot(x, y, ylim = input$ylim, xlim = input$xlim, type = "l", bty = "n",
            col = rgb(input$red, input$green, input$blue, max=255),
            lwd = lineWidth)
       points(10, 10, pch = 19)
       })
     
     # Determining the hexadecimal equivalent color
     hexcolor <- reactive({
       rgb(input$red, input$green, input$blue, maxColorValue = 255)
     })
     
     output$hex <- renderText({
       hexcolor()
     })
})
