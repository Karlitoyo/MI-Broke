output$country <- renderInfoBox(
  infoBox(
    title = "Country", 
    value = input$country, 
    icon = icon("globe", lib="font-awesome"),
    color = "light-blue"
  )
)

updateSelectInput(
  session = session,
  inputId = "country",
  choices = countries,
  selected = countries[1]
)

output$industry <- renderInfoBox(
  infoBox(
    title = "Industry", 
    value = input$industry, 
    icon = icon("industry", lib="font-awesome"),
    color = "light-blue"
  )
)
