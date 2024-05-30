library(shiny)

# Define UI for application
ui <- shiny::fluidPage(
  # Add custom CSS to style the app
  shiny::tags$head(
    shiny::tags$style(shiny::HTML("
      body {
        background-color: #FFD1DC;
        color: #333333;
        font-family: 'Arial', sans-serif;
      }
      .well {
        background-color: #FFC0CB;
        border-color: #FFB6C1;
      }
      h1 {
        color: #CC8899;
      }
      .btn {
        background-color: #FFB6C1;
        color: #FFFFFF;
        border: none;
      }
      .btn:hover {
        background-color: #FFA6B9;
      }
      .form-control {
        border-color: #FFA6B9;
      }
      .shiny-output-error {
        color: #660033;
      }
      .shiny-output-error:before {
        content: 'Error: ';
      }
    "))
  ),
  
  shiny::titlePanel("Letter String Analogy Generator"),
  
  shiny::sidebarLayout(
    shiny::sidebarPanel(
      shiny::numericInput("num_problems", "Number of problems:", 5, min = 1),
      shiny::selectInput("transformation_type", "Transformation Type:",
                         choices = c("Shift Letters", "Reverse String", "Shift Two Letters", "Letter Deletion", "Letter Addition")),
      shiny::downloadButton("downloadData", "Download")
    ),
    shiny::mainPanel(
      shiny::tableOutput("analogy_table")
    )
  )
)