
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

y <- " ~."
shinyServer(function(input, output) {
        
        x <- reactive({input$chgrp1})
        formulaeText <- renderText({
                ifelse(substring(y,3) == ".",paste(" ", x()),paste(x(),collapse = "+"))
                })
        
        output$formulaetxt <- renderText({
                        y <<- ifelse(length(x()) == 0," .",formulaeText())
                })
        
        
        output$formulaePlot <- renderPlot({
                par(mfrow=c(2,2))
                tryCatch({
                        z <- (paste(x(),collapse = "+"))
                        plot(lm(as.formula(paste("mpg",z,sep="~")), data = mtcars))
                },error = function(e){
                        print("********************")
                        par(mfrow=c(2,2))
                        plot(lm(mpg~., data = mtcars))
                })
        })
        
})