library(shiny)
library(plotly)
library(lubridate)


shinyServer(
  
  function(input, output) {
    
    data <- read.csv("big_five_stocks.csv", sep = ',', quote = '"', 
                     dec = '.', stringsAsFactors = FALSE)
    data$date <- as.Date(data$date, "%Y-%m-%d")
    
    output$company <- renderUI({
      selectInput("company", "Choose a company:", as.list(unique(data$name)), 
                  selected = levels(data$name)[60] ) 
    })
    
    output$text1 <- renderText({
      paste("You have selected: ", input$company)
    })
    
    
    output$distPlot <- renderPlotly({
      dt <- data[data$name == input$company, ]
      
      p <- ggplot(data = dt, aes(x = date, y = close)) + geom_line()
      
      p <- ggplotly(p)
    })
    
  })