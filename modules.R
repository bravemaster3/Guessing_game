

guessingUI <- function(id){
  ns <- NS(id)
  
  tagList(
    titlePanel("Guessing number game"),
    wellPanel(
      numericInput(ns("guess_number"), 
                   label=h5("Guess a number between 1 and 10"),
                   value=0),
      actionButton(ns("BtnPlay"),"PLAY"),
      uiOutput(ns("generated_num")),
      uiOutput(ns("result"))
      
    )
  )
}


guessingServer <- function(id, n=1){
  moduleServer(id,
               function(input, output, session){
                 
                 counter <- reactiveVal(0)
                 score <- reactiveVal(0)
                 
                 observeEvent(input$BtnPlay,{
                   
                   if(counter() == n){
                     counter(0)
                     score(0)
                   }
                   
                   counter(counter() + 1)
                   
                   
                   gen_number <- sample(1:10,1)
                   
                   output$generated_num <- renderUI(paste("The correct number is: ",gen_number))
                   
                   if(gen_number==input$guess_number){
                     
                     score(score()+1)
                     
                     output$result <- renderUI(
                       tagList(
                         renderText("Current guess: Win!!!"),
                         renderText(paste0("Your current score is: ",score(),"/",counter()))
                       )
                     )
                   } else {
                     output$result <- renderUI(
                       tagList(
                         renderText("Current guess: Loose!!!"),
                         renderText(paste0("Your current score is: ",score(),"/",counter()))
                       )
                     )
                   }
                   
                  
                 })
                 
               })
}