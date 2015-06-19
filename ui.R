## ui.R

library(shiny)
library(shinythemes)

shinyUI(
         fluidPage( theme = shinytheme("cerulean"),
        
# Title Panel
#=========================================  
        titlePanel("K-means Clustering Interactive ShinyApp"),
        
# Sidebar Panel
#=========================================  
    
sidebarLayout(
            sidebarPanel(
                
                # Caption Input
                #=========================================  
                textInput("text", "Fill in Notes", "Cluster Analysis on Iris.....is cool!! "),
                
                # Selection Input
                #========================================= 
                selectInput('xcol', 'Choose X Variable', names(iris)<-c("Sepal.Length",
                                                                        "Sepal.Width",
                                                                        "Petal.Length",
                                                                        "Petal.Width")),
                
                selectInput('ycol', 'Choose Y Variable', names(iris)<-c("Sepal.Length",
                                                                        "Sepal.Width",
                                                                        "Petal.Length",
                                                                        "Petal.Width"),
                            selected=names(iris)[[2]]),
                #br(),
                
                
                # Slider Input
                #========================================= 
                sliderInput("clusters","Choose Cluster Count",min = 1,max = 9,value = 3),#step=1),
                br(),
                
                # Submit Button
                #========================================= 
                p(strong("Click the button")),
                submitButton("Submit "),
                br(),
                
                # Image
                #========================================= 
                p(strong("Image of Iris")),
                img(src="iris.png", height = 100, width = 100),
                br()
                
                
            ),  
# Main Panel
#=========================================             
            
            mainPanel( 
                
                # Documentation Panel
                #=========================================
                
                p(strong("Automatic Timer")),
                textOutput("currentTime"),
                br(),
                
                p(strong("K-means Clustering")),
                p(em("It is the most popular partitioning method in R.It requires the analyst to specify the number of clusters to extract.")) ,
               
                p(strong("Instructions")),
                helpText("Type in any text in the textbox(This is optional!).Select the X and Y variables to be used for clustering.Move the Slider for the desired number of clusters.
         Click on the Submit button.Click on the tabbed panels to view the updates you made! Enjoy!!"),

               
                p(strong("Results")),
                p(em("Your selections:")),verbatimTextOutput("inputValue"),
                
                # Tabbed Panel
                #=========================================
                
# Show a tabset that includes a plot,table,summary and caption.
                tabsetPanel(type = "tabs", 
                            tabPanel("Plot", plotOutput("plot1")), 
                            tabPanel("Table", tableOutput("table")),
                            tabPanel("Summary", verbatimTextOutput("summary")),
                            tabPanel("Notes", textOutput("text")) 
                )
                
            )
        )
    )) 
