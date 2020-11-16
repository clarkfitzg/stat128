library(shiny)

# Define UI ----
ui <- fluidPage(
  titlePanel("Stat 128 Demo")
  , numericInput("a", label = "slope of line", value = 1)
  , numericInput("b", label = "intercept", value = 0)
  , numericInput("sd", label = "standard deviation of noise", value = 0.1)
  , textOutput("msg")
  , plotOutput("xyplot")
  , textOutput("conclusion")
)

# Define server logic ----
server <- function(input, output) {
  
  x = seq(from = -1, to = 1, length.out = 100)
  
  output$msg = renderText({
    # talk about sprintf
    sprintf("Simulated data from y = %g*x + %g", input$a, input$b)
  })

  output$xyplot = renderPlot({
    noise = rnorm(length(x), sd = input$sd)
    y = input$a * x + input$b + noise
    plot(x, y)
  })
  
  output$conclusion = renderText({
    sprintf("The slope divided by the SD of the noise is %g."
            , abs(input$a / input$sd))
  })
 
}

# Run the app ----
shinyApp(ui = ui, server = server)