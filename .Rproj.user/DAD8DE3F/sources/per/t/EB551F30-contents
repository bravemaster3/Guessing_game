library(shiny)
library(glue)
library(bslib)
#library(shinyjs)

source("dependencies.R")

ui <- fillPage(
  tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "sketchy.css")),#"quartz.css" / "morph.css" / "sketchy.css" /"darkly.css"
  theme = bslib::bs_theme(
    version = 5  # use Bootstrap version 5
  ),
  tabsetPanel(
    tabPanel("Guess 1",
             singleGuessUI("guess1")
    ),
    tabPanel("Guess 10",
             singleGuessUI("guess10")
             ),
    tabPanel("Guess n",
             fluidRow(
               column(3),
               column(6,
                      sliderInput("n_guess", "Select number of guess",
                                  min=1, max=100, value=5, step=1),
                      align="center")
             ),
             singleGuessUI("guessn")
             )
  ),
  tags$footer(tags$a(href="https://github.com/bravemaster3/Guessing_game", "View Source Code On Github"), align = "center", style = "
              position: fixed;
              bottom:0;
              margin : 0;
              width:100%;
              height:45px;   /* Height of the footer */
              color: white;
              padding-top: 10px;
              background-color: #caf0f8;
              z-index: 2")
)

server <- function(input, output, session) {
  
  singleGuessServer("guess1", n=1)
  singleGuessServer("guess10", n=10)
  observeEvent(input$n_guess, {
      singleGuessServer("guessn", n=input$n_guess)
    })
}



shinyApp(ui, server)

