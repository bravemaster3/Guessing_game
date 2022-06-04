guessingUI <- function(nmspace){
  ns <- NS(nmspace)
  
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


guessingServer <- function(nmspace, n){
  moduleServer(nmspace, function(input,output,session){
    
    counter <- reactiveVal(0)
    score <- reactiveVal(0)
    
    observeEvent(input$BtnPlay,{
      
      
      counter(counter()+1)
      
      if(counter() > n){
        counter(1)
        score(0)
      } 
    
      
      gen_number <- sample(1:10,1)
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
      
      
      output$generated_num <- renderUI(paste("The correct number is: ",gen_number))
    })
    
  })
}
