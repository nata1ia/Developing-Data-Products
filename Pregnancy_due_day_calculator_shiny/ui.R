library(shiny)
shinyUI(pageWithSidebar(
  headerPanel = ("Pregnancy due day calculator"),
  sidebarPanel(
    h5("This Shiny Application gets as input an the first day of last menstrual and cycle length from user online to calculate the due day of pregnancy."),
    
    dateInput("date","First day of last menstrual:"),
    numericInput("CL", "Cycle length, (days)", 28),
    submitButton('Calculate my due date')
    ),
  mainPanel(
    h2("Your first day of last menstrual is "),
    verbatimTextOutput("Oday"),
    
    h2("Your baby will be due on or around:"),
    verbatimTextOutput("Dday"),
    
    
    h4("How is the due date calculated?"),
    h5("The due date is calculated by adding 280 days to the first day of the last menstrual period (assuming a 28 day cycle). Note that the menstrual period and ovulation are counted as the first two weeks of pregnancy."),
    h5("If the cycles are longer or shorter than 28 days, then the day of ovulation may change and this calculator takes that into condideration when calculating the EDD."),
    h5("Due date = the first day of last menstrual + 280 days +(cycle length -28days)")
    
    
  )
  
)
        )