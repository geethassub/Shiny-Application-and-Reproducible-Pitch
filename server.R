#Download the libraries
library(shiny)
library(Ecdat)
library(dplyr)
data("Housing")

#Data cleansing

housing_1 <- Housing


housing_1$recroom <- ifelse(housing_1$recroom == "yes", 0,1)
housing_1$fullbase <- ifelse(housing_1$fullbase == "yes", 0,1)
housing_1$gashw <- ifelse(housing_1$gashw == "yes", 0,1)
housing_1$airco <- ifelse(housing_1$airco == "yes", 0,1)
housing_1$prefarea <- ifelse(housing_1$prefarea == "yes", 0,1)


shinyServer(function(input, output) {
output$table <- renderDataTable({
  data_housing <- transmute(housing_1, Price = price, Bedrooms = bedrooms, Bathrooms = bathrms, Stories = stories, Garage = garagepl, Driveway = driveway, RecreationRoom = recroom, PreferredArea = prefarea, AirCondition = airco, FurnishedBasement = fullbase )
  
  data_housing <- filter(data_housing, Bedrooms %in% input$bedroom, Bathrooms %in% input$bathroom, Garage %in% input$garage, RecreationRoom %in% input$rec, PreferredArea %in% input$area, FurnishedBasement %in% input$base, AirCondition %in% input$ac)
  data_housing <- mutate(data_housing, RecreationRoom = ifelse(RecreationRoom == 0, 'yes','no'),AirCondition = ifelse(AirCondition == 0, 'yes','no'),PreferredArea = ifelse(PreferredArea == 0, 'yes','no'),FurnishedBasement = ifelse(FurnishedBasement == 0, 'yes','no'))
  
  data_housing <- arrange(data_housing, Price)
  data_housing
  
  })

  
})
