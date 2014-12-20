#

library(shiny)

shinyServer(function(input, output) {
  
      

  output$distPlot <- renderPlot({
    a <- 7^5
    m <- (2^31)-1
    x <- 0:input$t
    y1 <- NULL
    y11 <- NULL
    y2 <- NULL
    y3 <- NULL
    y <- NULL
    y1[1] <- input$sd
    y11[1] <- (input$sd)^2
    for (i in 2:(input$t+1)) {
      y1[i] <- (a*y1[i-1]+10)%%m
      y11[i] <- (a*y11[i-1]+10)%%m
    }
    y1 <- y1/max(y1)
    y11 <- y11/max(y11)
    
    y2 <- sqrt(-2*log(y1))*sin(6.28*y11)
    y3 <- sqrt((2*input$sigma^2))*log(1/(exp(-5) + 1 - y1))
    
    meth <- NULL
    if (length(input$md) == 0) {
      meth <- 1
    }
    else {
      meth <- input$md
    }
    
    
      
    
    
    for (i in 1:length(meth)) {
      if (meth[i] == 1) {
        y <- cbind(y,y1)
      }
      else if (meth[i] == 2) {
        y <- cbind(y,y2)
      }
      
      else if (meth[i] == 3) {
        y <- cbind(y,y3)
      }
    }
    
    matplot(x, y, type = "l", xlab = "Time", ylab = "Noise")
    
    
  })

})
