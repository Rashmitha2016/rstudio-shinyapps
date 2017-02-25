library(shiny)
ui <- fluidPage(
  sliderInput(inputId = "num",
              label = "Choose a number",
              value = 25,min = 1,max=100),  
              plotOutput("hist")
  
)

server<- function(input,output){
  output$hist <- renderPlot({
    title <- "Histogram for 100 Random normalvalues"
    hist(rnorm(input$num),main = title)
  })
}

shinyApp(ui = ui,server = server)