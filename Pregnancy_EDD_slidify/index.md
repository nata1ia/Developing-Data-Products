---
title       : Pregnancy due day calculator
subtitle    : Pregnancy EDD presentation
author      : nata1ia
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Pregnancy due day calculator

This Shiny Application gets as input 

1. the first day of last menstrual
2. cycle length 

from user online to calculate the due day of pregnancy.


presentation

https://nata1ia.shinyapps.io/Pregnancy_due_day_calculator_shiny

--- .class #id 

## How is the due date calculated?
The due date is calculated by adding 280 days to the first day of the last menstrual period (assuming a 28 day cycle). 

If the cycles are longer or shorter than 28 days, then the day of ovulation may change and this calculator takes that into condideration when calculating the EDD.

Due date = the first day of last menstrual + 280 days +(cycle length -28days)

--- .class #id 

## ui.R

```r
library(shiny)
shinyUI(pageWithSidebar(
  headerPanel = ("Pregnancy due day calculator"),
  sidebarPanel(
    dateInput("date","First day of last menstrual:"),
    numericInput("CL", "Cycle length, (days)", 28),
    submitButton('Calculate my due date')
    ),
  mainPanel(
    h4("Your first day of last menstrual is "),
    verbatimTextOutput("Oday"),
    h4("Your baby will be due on or around:"),
    verbatimTextOutput("Dday")
    
    
  )
)
        )
```

<!--html_preserve--><div class="container-fluid">
<div class="row">Pregnancy due day calculator</div>
<div class="row">
<div class="col-sm-4">
<form class="well">
<div id="date" class="shiny-date-input form-group shiny-input-container">
<label class="control-label" for="date">First day of last menstrual:</label>
<input type="text" class="form-control datepicker" data-date-language="en" data-date-weekstart="0" data-date-format="yyyy-mm-dd" data-date-start-view="month"/>
</div>
<div class="form-group shiny-input-container">
<label for="CL">Cycle length, (days)</label>
<input id="CL" type="number" class="form-control" value="28"/>
</div>
<div>
<button type="submit" class="btn btn-primary">Calculate my due date</button>
</div>
</form>
</div>
<div class="col-sm-8">
<h4>Your first day of last menstrual is </h4>
<pre id="Oday" class="shiny-text-output"></pre>
<h4>Your baby will be due on or around:</h4>
<pre id="Dday" class="shiny-text-output"></pre>
</div>
</div>
</div><!--/html_preserve-->

--- .class #id 

## server.R

```r
library(shiny)


shinyServer(
  function(input, output){
    
    output$Oday <- renderPrint({input$date })
  
    output$Dday <- renderPrint({input$date + as.difftime(280-28+as.numeric(input$CL),unit="days")}) 
  }
)
```

--- .class #id 

