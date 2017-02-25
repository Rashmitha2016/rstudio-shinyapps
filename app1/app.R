library(shiny)
ui <- fluidPage(
  shinyUI(
    pageWithSidebar(
      headerPanel("Body mass index (BMI) calculator"),
      sidebarPanel(
        numericInput('weight', 'Weight (pounds)', 150, min = 0, max = 1000, step = 1),
        numericInput('height', 'Height (inches)', 66, min = 12, max = 108, step = 1),
        submitButton('Calculate')
      ),
      mainPanel(
        h3('Results'),
        h4('Your BMI is...'),
        verbatimTextOutput("bmi"),
        verbatimTextOutput("label")
      )
    )
  )
)

calculateBMI <- function(weight, height) {
  return((weight / (height * height)) * 703)
}

bmiToLabel <- function(bmi) {
  # Underweight = <18.5
  # Normal weight = 18.5–24.9 
  # Overweight = 25–29.9 
  # Obesity = BMI of 30 or greater
  if(bmi < 18.5) {
    return("Underweight")
  }
  else if(bmi < 25) {
    return("Normal weight")
  }
  else if(bmi < 30) {
    return("Overweight")
  }
  else {
    return("Obese")
  }
}

server(
  function(input, output) {
    output$bmi <- renderPrint({calculateBMI(input$weight, input$height)})
    output$label <- renderPrint({bmiToLabel(calculateBMI(input$weight, input$height))})
  }
)
shinyApp(ui = ui,server = server)
