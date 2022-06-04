library(shiny)
library(bslib)
library(glue)

source("modules.R")

ui <- fixedPage(
  theme =  bslib::bs_theme(bootswatch = "solar", bg = "#e6e6e6",fg = "#800000"),
  
  tabsetPanel(
    tabPanel("Guess Single",
             guessingUI(id="single")
             ),
    tabPanel("Guess Ten",
             guessingUI(id="ten")
             )
  ),
  
  aligned="center")

server <- function(input, output, session) {
  guessingServer("single", n=1)
  guessingServer("ten", n=10)
}

shinyApp(ui, server)


