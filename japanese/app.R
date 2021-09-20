library(shiny)
library(visNetwork)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Japanese mimetics"),
    h4("Hover over the picture to see a video/more information"),
    visNetworkOutput("network")
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$network <- renderVisNetwork({
        # minimal example
        nodes <- read.csv("nodes.csv")
        edges <- read.csv("edges.csv")
        
        visNetwork(nodes, edges)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
