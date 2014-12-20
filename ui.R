# This shinyy app generates white noise using different methods
# and plots them.

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("White Noise Models"),

  # Sidebar with a slider input for the seed
  sidebarLayout(
    sidebarPanel(
      sliderInput("sd",
                  "Seed:",
                  min = 1,
                  max = 50,
                  value = 10),
    
    
    
    
      sliderInput("t",
                "Time:",
                min = 100,
                max = 1000,
                value = 200),
      
      sliderInput("sigma",
                  "Sigma:",
                  min = 0,
                  max = 1,
                  value = 1),
    
    
    # Check Box Input for the Method
    checkboxGroupInput("md","Checkbox: Types of Methods",
                       c("Uniform Random Generator" = "1",
                         "Normal Random Generator" = "2",
                         "Rayleigh Random Generator" = "3"))
    ),

    # Show a plot of the generated distribution
  mainPanel(
    plotOutput("distPlot")
    )
  )
))

