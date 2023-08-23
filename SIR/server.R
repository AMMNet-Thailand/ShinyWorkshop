
# Sompob Saralamba <saralamba@gmail.com>

# initial values for each compartment
init <- c(S = 1-1e-6, I = 1e-6, R= 0.0)

# a vector of times to keep the outputs
times <- seq(0, 70, by = 1)


# model 
sir <- function(time, state, parameters) {
  with(as.list(c(state, parameters)), {
    dS <- -beta*S*I
    dI <- beta*S*I - gamma*I
    dR <- gamma*I
    
    return(list(c(dS, dI, dR)))
  })
}


RunOde <- function(parms){

  parameters <- c(parms)
  
  out <- as.data.frame(ode(y = init, times = times, func = sir, parms = parameters))

return(out)
}


shinyServer(

function(input, output, session) {


  parms <- reactive(c(

    beta= input$beta,
    gamma= input$gamma

  ))


  outode <- reactive(RunOde(parms()))


  #plotting function
  plotX <- function(){

    out <- outode()
    matplot(times, out[,c("S","I","R")], type = "l", xlab = "Time", ylab = "Susceptibles and Recovereds", 
            main = "SIR Model", lwd = 1, lty = 1, bty = "l", col = 2:4)
    legend(40, 0.7, c("Susceptibles", "Infecteds", "Recovereds"), pch = 1, col = 2:4)

  }


  output$graphs <- renderPlot({
    plotX()
  })

})

