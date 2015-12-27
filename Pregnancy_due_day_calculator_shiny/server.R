library(shiny)


shinyServer(
  function(input, output){
    
    output$Oday <- renderPrint({input$date })
  
    output$Dday <- renderPrint({input$date + as.difftime(280-28+as.numeric(input$CL),unit="days")}) 
  }
)