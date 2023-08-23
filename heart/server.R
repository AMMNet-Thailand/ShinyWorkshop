# Sompob Saralamba <saralamba@gmail.com>

library(deSolve)

init <- c(Y1=0,Y2=0)
timegrid <- seq(0,20*pi,0.1)

heart <- function(t, state, parms){
  with(as.list(c(state,parms,t)),{

    # y''(t) = -k sin(y(t)) + sin(t)
    # dy1 = y2
    # dy2 = -k sin(y(t)) + sin(t)
    
    dY1<-Y2
    dY2<-k*sin(Y1)+sin(t)

    list(c(dY1,dY2))
  })
}



RunOde <- function(parms){

  parameters <- c( parms )

  out <- ode(y = init, times = timegrid, func = heart, parms = parameters)

  return(out)
}


shinyServer(

function(input, output, session) {


  parms <- reactive(c(

    k= input$k

  ))


  outode <- reactive(RunOde(parms()))


  #plotting function
  plotX <- function(){

    out <- outode()

    plot(out[,c(2,3)],col="red", type='l')

  }


  output$graphs <- renderPlot({
    plotX()
  })

})






