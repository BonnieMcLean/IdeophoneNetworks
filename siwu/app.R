library(visNetwork)
library(shiny)

ui <- fluidPage(
  h5("Siwu ideophones"),
  h6("Double click on a node to expand or contract it"),
  visNetworkOutput("network"),
  h6("Based on analysis in Dingemanse, M. & Majid, A. 2012. The semantic structure of sensory vocabulary in an African Language. Proceedings of the 34th Annual Conference of the Cognitive Science Society."))

server <- function(input,output){
  output$network <- renderVisNetwork({
    # minimal example
    nodes <- read.csv("siwunodes.csv",encoding = "UTF-8")
    edges <- read.csv("siwuedges.csv",encoding = "UTF-8")
    
    visNetwork(nodes, edges)%>%
      visOptions(collapse = TRUE)%>%
      visEdges(arrows="to")
  })
}

shinyApp(ui = ui, server = server)
