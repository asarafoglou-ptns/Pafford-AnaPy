
## Analogies App Server Logic
## Alexandra Pafford

# --------------------------------------------------------------------------

## Install dependencies
# install.packages(c("shiny", "readr", "writexl"))

## Load libraries with namespaces
library(shiny)
library(readr)
library(writexl)

# --------------------------------------------------------------------------

# Server logic
server <- function(input, output, session) {
  # Generate analogies for download and display
  analogies <- reactive({
    num_problems <- min(input$num_problems, 20)
    base_strings <- replicate(num_problems, generate_sequential_string(4), simplify = FALSE)
    transformation <- switch(input$transformation_type,
                             "Shift Letters" = function(s) shift_letters(s, 1),
                             "Reverse String" = reverse_string,
                             "Shift Two Letters" = function(s) shift_letters(s, 2),
                             "Letter Deletion" = letter_deletion,
                             "Letter Addition" = letter_addition)
    lapply(base_strings, function(bs) generate_analogy(bs, transformation))
  })
  
  output$analogy_table <- renderTable({
    data.frame(Analogy = sapply(analogies(), function(a) sprintf("%s : %s :: %s : %s", a$A, a$B, a$C, a$D)))
  })
  
  output$downloadData <- downloadHandler(
    filename = function() {
      paste("analogies-", Sys.Date(), ".csv", sep = "")
    },
    content = function(file) {
      write.csv(data.frame(Analogy = sapply(analogies(), function(a) sprintf("%s : %s :: %s : %s", a$A, a$B, a$C, a$D))), file)
    }
  )
  
  # Reactive value for storing and updating cognitive task
  current_problem <- reactiveVal()
  
  # Function to generate a new cognitive task
  generate_new_problem <- function() {
    base_string <- generate_sequential_string(4)
    transformation <- switch(input$transformation_type,
                             "Shift Letters" = function(s) shift_letters(s, 1),
                             "Reverse String" = reverse_string,
                             "Shift Two Letters" = function(s) shift_letters(s, 2),
                             "Letter Deletion" = letter_deletion,
                             "Letter Addition" = letter_addition)
    problem <- generate_analogy(base_string, transformation)
    current_problem(problem)  # Update the reactive value
  }
  
  # Initialize the first problem when the tab is first accessed or the type changes
  observeEvent(input$main_tabs, {
    if (input$main_tabs == "Cognitive Task") {
      generate_new_problem()
    }
  })
  
  # Display the current problem
  output$cognitive_task_problem <- renderText({
    req(current_problem())
    sprintf("%s : %s :: %s : ?", current_problem()$A, current_problem()$B, current_problem()$C)
  })
  
  # Check user's answer and update problem if correct
  observeEvent(input$answer_submit, {
    # Ensure there is a problem loaded
    req(current_problem())
    
    # Check if the user's answer is correct
    if(tolower(input$user_answer) == tolower(current_problem()$D)) {
      # Provide positive feedback
      output$task_feedback <- renderText("Correct answer! Well done.")
      
      # Generate a new problem
      generate_new_problem()  # This calls the function to create and set a new problem
    } else {
      # Provide feedback for an incorrect answer
      output$task_feedback <- renderText("Incorrect answer. Try again.")
    }
    
    # Clear the input field after submission to ready it for the next answer
    updateTextInput(session, "user_answer", value = "")
  })
}