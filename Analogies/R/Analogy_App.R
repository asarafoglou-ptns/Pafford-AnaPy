source("Analogy_UI.R")
source("Analogy_Server.R")

# Run the application
shiny::shinyApp(ui = ui, server = server)