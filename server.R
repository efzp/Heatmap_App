#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(readxl)
library(xlsx)

# Define server logic required to draw a histogram
server <- function(input, output, session) {
  output$scatterplot <- renderPlot({
    inFile <- input$file1
    if (is.null(inFile))
      return(NULL)
    df <- readxl::read_excel(inFile$datapath,sheet = 1)
    cantidad_riesgos <- nrow(df)-31
    ggplot(data=df, aes(x = `impacto`, fill = `riesgo`)) +
      geom_ribbon(aes(ymin= `probabilidad_min`, ymax = `probabilidad`)) +
      scale_fill_manual(values = c(rep("NA",cantidad_riesgos) ,"green","orange","red","yellow")) +
      geom_point(aes(y = `y`, x = `x`, size = `vulnerabilidad`)) +
      labs(title = "Mapa de Calor de Riesgos", x = "Impacto riesgos", y = "Probabilidad de ocurrencia") +
      guides(fill=FALSE) + ylim(0,5)
    
  })
}


