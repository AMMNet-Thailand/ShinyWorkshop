# Sompob Saralamba <saralamba@gmail.com>

library(deSolve)


shinyUI(

  pageWithSidebar(

    # title
    headerPanel("Everything should be made as simple as possible, but not simpler"),

    # Sidebar with sliders
    sidebarPanel(
      
      sliderInput("beta","beta", min = 0,max = 10,step = 0.001,value = 1.4),
      sliderInput("gamma","gamma", min = 0,max = 1,step = 0.001,value = 0.14)

      #add the quote
      , br(), hr(),
      tags$p("Is This the Right Room for an Argument ?_(Monty Python)")
    ),

    
    mainPanel(
      plotOutput("graphs")
    )
  )
)



