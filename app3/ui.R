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