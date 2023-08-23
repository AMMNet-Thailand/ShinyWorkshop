
shinyUI(

  pageWithSidebar(

    # title
    headerPanel("Everything should be made as simple as possible, but not simpler"),

    # Sidebar with sliders
    sidebarPanel(
      
      sliderInput("k","k", min = -10,max = 10,step = 0.001, value = 5.0)

      #add the quote
      , br(), hr(),
      tags$p("The Candlelight Was Just Right_(Beastie Boys)")
    ),

    mainPanel(
      plotOutput("graphs")
    )
  )
)

