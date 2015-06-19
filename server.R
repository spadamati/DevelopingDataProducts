## server.R

library(shiny)
library(ggplot2)
data(iris)

palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3", "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))


shinyServer(function(input, output,session) {
    
     # Combine the selected variables into a new data frame
    #=======================================================
    selectedData <- reactive({ 
        
        iris[,-5]
        iris[, c(input$xcol, input$ycol)]
    }) 
    clusters <- reactive({ kmeans(x = selectedData(), centers= input$clusters) })
    
    
    # Generate a plot
    #===============================
    
      output$plot1 <- renderPlot({height=200
      width=100
        par(mar = c(10, 4, 2, 1))
        plot(selectedData(),main="K-means Clustering Visualization on Iris",
             col = clusters()$cluster,
             pch = 20, cex = 3)
        points(clusters()$centers, pch = 5, cex = 4, lwd = 4)
    
       
    }) 
    
    # Generate a timer
    #===============================
        output$currentTime <- renderText({
        invalidateLater(1000, session)
        paste("The current date and time is", Sys.time())
    })
    
    # Generate the updated caption
    #===============================
    output$text <- renderText({ input$text})
    
    # Generate the selected input values
    #===============================
    output$inputValue <- renderText({
        paste("X Variable:",input$xcol,"||","Y Variable:",input$ycol,"||",
              "Cluster Count:",input$clusters)
        
        })

    # Generate an HTML table view of the data
    #==========================================
    output$table <- renderTable({
        data.frame(x=selectedData())
    })
    
    # Generate a summary of the data
    #===============================
    output$summary <- renderPrint({
        summary(selectedData())
              })
})
    
