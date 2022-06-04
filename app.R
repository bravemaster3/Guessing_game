library(shiny)
library(bslib)

source("modules.R")

ui <- fixedPage(
  theme =  bslib::bs_theme(bootswatch = "solar", bg = "#e6e6e6",fg = "#800000"),
  tabsetPanel(
    tabPanel("guess single",
             guessingUI("guess1")
             ),
    tabPanel("guess ten",
             guessingUI("guess10")
             ),
    tabPanel("guess n",
             
             sliderInput("n_guess", "Select number of guess",
                         min=1,max=100,value=10,step=1),
             guessingUI("guessn")
    )
  )
  )

server <- function(input, output, session) {

  guessingServer("guess1", n=1)
  
  guessingServer("guess10", n=10)
  
  guessingServer("guessn", n=input$n_guess)
}


shinyApp(ui, server)


