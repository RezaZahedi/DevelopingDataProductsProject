library(shiny)

# Define UI for application that draws an n-edged circle
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Coloring n-edged shape!"),
  
  # Input Values
  sidebarLayout(
    sidebarPanel(
         selectInput("n", "Number of Edges:", 2:20, 5),
         
         sliderInput("red", "Red Intensity",
              min = 1, max = 255, value = 85
         ),
         
         sliderInput("green", "Green Intensity",
              min = 1, max = 255, value = 206
         ),
         
         sliderInput("blue", "Blue Intensity",
              min = 1, max = 255, value = 185
         ),
         
         sliderInput("xlim", "X Axis limits:",
                     min = -25, max = 25, value = c(0, 20)),
         
         sliderInput("ylim", "Y Axis limits:",
                     min = -25, max = 25, value = c(5, 15))
    ),
    
    
    
    # Show a plot of the generated n-edged shape
    mainPanel(
       h3("Discription:"),
       p("This app is designed to draw an n-edged shape, and color it usig the
         Red, Green and Blue components of a user specified color. It olso
         returns the hexadecimal color equivalent to the color selection."),
       h3("Inputs:"),
       p("Number of edges; Red, green and blue intesity; X and Y axis limits, to change something :D"),
       h3("Outputs:"),
       p("The hexadecimal color is:"),
       strong(textOutput("hex")),
       plotOutput("circlePlot")
    )
  )
))
