library(shiny)

# Define UI ---- user interface
ui <- fluidPage(
  titlePanel("Normal Distribution")
  , numericInput("mean", label = "mean", value = 0)
  , numericInput("sd", label = "standard deviation", value = 1, min = 0.1)
  , numericInput("n", label = "number of random samples in histogram", value = 100, min = 5)
  , numericInput("breaks", label = "number of breaks in histogram", value = 10, min = 5)
  , plotOutput("distplot")
)

# Define server logic ----
server <- function(input, output) {
  
  output$distplot = renderPlot({
    imean = input$mean
    isd = input$sd
    nsamples = input$n
    main = sprintf("Mean %g and standard deviation %g", input$mean, input$sd)

    samples = rnorm(nsamples, mean = imean, sd = isd)
    h = hist(samples, breaks = input$breaks, plot = FALSE)

    x = seq(from = min(samples), to = max(samples), length.out = 1000)
    y = dnorm(x, mean = imean, sd = isd)

    plot(h, freq = FALSE, xlab = "", main = "", ylim = c(0, max(y, h$density)))
    lines(x, y, col = "blue", lwd = 2)
  })
  
}

# Run the app ----
shinyApp(ui = ui, server = server)