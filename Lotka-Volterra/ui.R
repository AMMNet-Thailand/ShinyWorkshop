# Sompob Saralamba <saralamba@gmail.com>


shinyUI(

  pageWithSidebar(

    # title
    headerPanel("Everything should be made as simple as possible, but not simpler"),

    # Sidebar with sliders
    sidebarPanel(
      
        sliderInput("rIng","rate of ingestion", min = 0,max = 2,step = 0.01, value = 0.2),
        sliderInput("rGrow","growth rate of prey", min = 0,max = 10,step = 0.01, value = 1.0),
        sliderInput("rMort","mortality rate of predator", min = 0,max = 10,step = 0.01, value = 0.2),
        sliderInput("assEff","assimilation efficiency", min = 0,max = 10,step = 0.01, value = 0.5),
        sliderInput("K","carrying capacity", min = 0,max = 30,step = 0.1, value = 10)

      #add the quote
      , br(), hr(),
      tags$p("Ich war schwanger, mir gings zum kotzen_(Nina Hagen)")
    ),

    mainPanel(
      plotOutput("graphs")
    )
  )
)

