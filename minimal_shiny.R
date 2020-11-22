ui <- fluidPage(
  numericInput("a", label = "a", value = 1)
  , textOutput("msg")
)

s <- function(input, output) {
  
  output$msg = renderText({
    paste("value of a is", input$a)
  })  
  
  NULL
}

shinyApp(ui = ui, server = s)