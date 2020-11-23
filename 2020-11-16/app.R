# 123 GO - What's an enjoyable rainy day activity?

# Plan: Build a dashboard!

# shiny - R package to build dashboards
# developed by RStudio
# https://shiny.rstudio.com/tutorial/#written-tutorials

# https://shiny.rstudio.com/tutorial/written-tutorial/lesson2/
#
# "This code is the bare minimum needed to create a Shiny app."

# 123 GO - have you done any web development whatsoever?

library(shiny)

# Define UI ---- user interface
ui <- fluidPage(
  titlePanel("Stat 128 Live Demo")
  # ax + b
  , numericInput("a", label = "slope of the line", value = 1)
  , numericInput("b", label = "intercept", value = 10, max = 20)
  , withMathJax(helpText("Some math here $$\\alpha+\\beta$$"))
  , textOutput("msg")
  , plotOutput("the_plot_thickens")
)

# Why not just use text for all the inputs?

# Define server logic ----
server <- function(input, output) {
  
  x = seq(from = -1, to = 1, length.out = 201)
  
  output$msg = renderText({
    sprintf("Simulated data from y = %g * x + %g", input$a, input$b)
  })
  
  output$the_plot_thickens = renderPlot({
    noise = rnorm(length(x))
    y = input$a * x + input$b + noise
    plot(x, y)
  })
  
}

# Run the app ----
shinyApp(ui = ui, server = server)

