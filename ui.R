#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
fluidPage(
  
    # File Input 
      titlePanel("Base de Datos Riesgos"),
      sidebarLayout(sidebarPanel(
        fileInput('file1', 'Choose xlsx file',
                  accept = c(".xlsx"))
      ),
      mainPanel(plotOutput(outputId = "scatterplot"))),

    # Application title
    titlePanel("HeatMap"),

        )
    

