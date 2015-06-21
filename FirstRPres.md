Iris K-means Clustering Interactive ShinyApp
========================================================
author: Devi
date: June 15 2015 
transition: zoom   
  
    
      
        
#
![alt text](iris.png)



My First ShinyApp Overview
========================================================
This ShinyApp allows the user to visualize the **iris** dataset being clustered(using **k-means algorithm**) interactively.
The user has to hit the submit button after selecting his choices for the X and Y-axis variables using the 'up and down arrows' and the desired number of clusters to be created using the slider.The user can also type any text in the textbox and hit the submit button.There are also tabbed panels for viewing the plot,table,summary and notes.

![alt text](iris.png)

Sample Code and Plot
========================================================

```r
library(ggplot2)
data(iris)
iris <- iris
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, colour = Species)) + geom_point()
```

![plot of chunk unnamed-chunk-1](FirstRPres-figure/unnamed-chunk-1-1.png) 

Screenshot of the Deployed Shiny App 
========================================================
This is a screenshot of the deployed shiny app for default values.

![alt text](IRIS_Shiny.png)

Information on Links
========================================================
This ShinyApp was based on the examples from the shiny rstudio tutorials and also from the gallery.

You can access the foll from the below URL's :

 - Shinyapp : For the deployed app 
 https://devi.shinyapps.io/DevelopingDataProducts

 - Github : For the server.R and ui.R code 
 https://github.com/etlindevi9/DevelopingDataProducts

 - Rpubs Presentation:  
 http://rpubs.com/Devi/

