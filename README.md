# Developing-Data-Products
# Peer Assignment
## Introduction
This Shiny Application gets as input an the first day of last menstrual and cycle length from user online 
to calculate the due day of pregnancy.

##How is the due date calculated?
The due date is calculated by adding 280 days to the first day of the last menstrual period (assuming a 28 day cycle). Note that the menstrual period and ovulation are counted as the first two weeks of pregnancy. 

If the cycles are longer or shorter than 28 days, then the day of ovulation may change and this calculator takes that into condideration when calculating the EDD.

Due date = the first day of last menstrual + 280 days +(cycle length -28days)
