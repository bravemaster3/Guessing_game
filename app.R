library(shiny)

ui <- fluidPage(
  numericInput("guess_number", 
               label=h3("Guess a number between 1 and 10"),
               value=0),
  actionButton("BtnPlay","PLAY"),
  uiOutput("result"),
  uiOutput("generated_num")
)

server <- function(input, output, session) {
  observeEvent(input$BtnPlay,{
    gen_number <- sample(1:10,1)
    if(gen_number==input$guess_number){
      output$result <- renderUI(
        renderText("Win!!!")
      )
    } else {
      output$result <- renderUI(
        renderText("Loose!!!")
      )
    }
    
    output$generated_num <- renderUI(paste("The correct number is: ",gen_number))
  })
}

shinyApp(ui, server)

