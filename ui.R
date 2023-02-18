library(shiny)
library(plotly)


shinyUI(fluidPage(
  
  titlePanel("Big Five Stocks"),
  
  sidebarLayout(
    sidebarPanel(
      uiOutput("company")
    ),
    
    
    mainPanel(
      h3(textOutput("text1")),
      plotlyOutput("distPlot")
    )
  )
)
)