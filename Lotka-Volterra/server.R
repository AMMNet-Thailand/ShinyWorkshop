
library(deSolve)


yini  <- c(Prey = 1, Predator = 2)
times <- seq(0, 200, by = 1)

LVmod <- function(Time, State, Pars) {
  with(as.list(c(State, Pars)), {
    Ingestion    <- rIng  * Prey * Predator
    GrowthPrey   <- rGrow * Prey * (1 - Prey/K)
    MortPredator <- rMort * Predator

    dPrey        <- GrowthPrey - Ingestion
    dPredator    <- Ingestion * assEff - MortPredator

    return(list(c(dPrey, dPredator)))
  })
}



RunOde <- function(parms){

  parameters  <- c( parms )

  out   <- ode(yini, times, LVmod, parms=parameters)

return(out)
}


shinyServer(

function(input, output, session) {


  parms <- reactive(c(

    rIng= input$rIng,
    rGrow= input$rGrow,
    rMort= input$rMort,
    assEff= input$assEff,
    K= input$K
  ))

  outode <- reactive(RunOde(parms()))


  #plotting function
  plotX <- function(){

    out <- outode()
  ## User specified plotting
    matplot(out[ , 1], out[ , 2:3], type = "l", xlab = "time", ylab = "Conc",
            main = "Lotka-Volterra", lwd = 2)
    legend("topright", c("prey", "predator"), col = 1:2, lty = 1:2)

}


  output$graphs <- renderPlot({
    plotX()
  })

})

