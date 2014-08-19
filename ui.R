
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
data(mtcars)

shinyUI(fluidPage(
        tags$head(
                tags$style(HTML("
                      h1 {
                        font-family: 'Baskerville Old Face', cursive;
                        font-weight: 500;
                        line-height: 1.1;
#                         color: purple;
                      }
                      label {
                        font-family: Baskerville Old Face, cursive;
                        font-weight: 500;
                        line-height: 1.1;
                        font-size: 15pt;
                      }
                      div{
                        display:inline-block;
                      }
                      span,.checkbox.inline,#formulaetxt{
                        color: blue;
                      }
        
                "))
        ),
        
        headerPanel("Linear Regression with mtcars dataset"),
        
        sidebarPanel(width = 12,
                span("mpg ~"),
                textOutput(outputId = "formulaetxt"),
                br(),br(),
                checkboxGroupInput(inputId = "chgrp1",inline = T,
                     label = "Select a variable to add to the regression model:",
                     choices = list("cyl","disp","hp","drat","wt","qsec","vs","am","gear","carb")
                )
        )
        
        ,mainPanel(width = 12,
                plotOutput(width = "100%", height = "600",outputId = "formulaePlot")
                
        )
))