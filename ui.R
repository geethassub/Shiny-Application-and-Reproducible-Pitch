
library(shiny)

shinyUI(fluidPage(
  titlePanel("Select the Housing Requirements"),
  sidebarLayout(
    sidebarPanel(
      numericInput("bedroom", "No of Bedrooms", min = 1, max = 6, value = 1),
      numericInput("bathroom", "No of Bathrooms", min = 1, max = 4, value = 1),
      numericInput("garage", "No of garages", min = 0, max = 3, value = 3),
      checkboxGroupInput("area", "Preferred Neighbourhood",c("Yes" = 0, "No" = 1), selected = c(0,1)),
      checkboxGroupInput("rec", "Recreation Room",c("Yes" = 0, "No" = 1), selected = c(0,1)),
      checkboxGroupInput("base", "Full Furnished Basement",c("Yes" = 0, "No" = 1), selected = c(0,1)),
      checkboxGroupInput("ac", "Air Condition",c("Yes" = 0, "No" = 1), selected = c(0,1))
    ),
    mainPanel(
      dataTableOutput('table')
      )
  )
))
