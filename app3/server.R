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

shinyServer(
  function(input, output) {
    output$bmi <- renderPrint({calculateBMI(input$weight, input$height)})
    output$label <- renderPrint({bmiToLabel(calculateBMI(input$weight, input$height))})
  }
)