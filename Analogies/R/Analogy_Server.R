library(shiny)

# Shiny server logic
server <- function(input, output) {
  generate_analogies <- reactive({
    num_problems <- input$num_problems
    transformation_type <- input$transformation_type
    
    base_strings <- replicate(num_problems, generate_sequential_string(4))
    
    transformation <- switch(transformation_type,
                             "Shift Letters" = function(s) shift_letters(s, 1),
                             "Reverse String" = reverse_string,
                             "Shift Two Letters" = function(s) shift_letters(s, 2),
                             "Letter Deletion" = letter_deletion,
                             "Letter Addition" = letter_addition)
    
    analogies <- sapply(base_strings, generate_analogy, transformation = transformation)
    data.frame(Analogy = analogies)
  })
  
  output$analogy_table <- shiny::renderTable({
    generate_analogies()
  })
  
  output$downloadData <- shiny::downloadHandler(
    filename = function() {
      paste("analogies-", Sys.Date(), ".csv", sep = "")
    },
    content = function(file) {
      analogies <- generate_analogies()
      readr::write_csv(analogies, file)
    }
  )
}