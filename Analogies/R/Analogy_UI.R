
## Analogies App User Interface
## Alexandra Pafford

# --------------------------------------------------------------------------

## Install dependencies
# install.packages(c("shiny", "readr", "writexl"))

## Load libraries with namespaces
library(shiny)
library(readr)
library(writexl)

# --------------------------------------------------------------------------

## Shiny UI

# Define UI
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
  
  shiny::tabsetPanel(
    id = "main_tabs",
    shiny::tabPanel("Analogies Generator",
                    shiny::sidebarLayout(
                      shiny::sidebarPanel(
                        shiny::numericInput("num_problems", "Number of problems:", 5, min = 1, max = 20),
                        shiny::selectInput("transformation_type", "Transformation Type:",
                                           choices = c("Shift Letters", "Reverse String", "Shift Two Letters", "Letter Deletion", "Letter Addition")),
                        shiny::downloadButton("downloadData", "Download")
                      ),
                      shiny::mainPanel(
                        shiny::tableOutput("analogy_table")
                      )
                    )
    ),
    shiny::tabPanel("About",
                    shiny::tags$h3("About Analogies"),
                    shiny::tags$p("Analogy is fundamental to the way we think, communicate, and experience the world (Ichien, 2020). In fact, analogy is thought to go hand-in-hand with abstract reasoning (Mitchell, 2021). Abstraction, which is the process of mentally mapping the essence of one situation to another, is important because it allows us to think in terms of concepts, which is a cornerstone of human cognition (Mitchell, 2021). This ‘mental mapping’ is otherwise known as generalization, and it is vital for learning in intelligent systems (Barnett & Ceci, 2002; Genter, 2017)."),
                    shiny::tags$p("One way to study this cognitive phenomenon is through letter-string analogies. In these puzzles, a string of letters is transformed according to a hidden rule, and the task is to use analogy and apply the transformation to a new string. Hofstadter laid the groundwork for letter-string analogies in his seminal piece on the Copycat Project (Hofstadter, 1984). He reduced these domains until the essence of analogy emerged in its basic form known as letter strings (Hofstadter, 1984). Letter-string analogies require very little domain knowledge, only a basic understanding of alphabetical principles of letters as abstract entities having a sequential order (Hofstadter, 1984; Chalmers, 1994; Mitchell, 2021). This ‘toy problem’ in fact offers us an idealized scenario to examine analogical reasoning in a “pure, uncontaminated way” (Hofstadter, 1984, p. 3)."),
                    shiny::tags$p("Thus, letter string analogies offer a robust way to study reasoning. Popular in psychology, they have not gone unnoticed by researchers in AI. Recent efforts in understanding abstraction and reasoning in intelligent systems have given new life to the once-niche field of analogy."),
                    shiny::tags$p("I hope that anyone interested in creativity, intelligence, reasoning, language, and cognition in general will find this app useful."),
                    shiny::tags$h3("About This App"),
                    shiny::tags$p("This application generates letter string analogies based on user-selected transformations. It is designed to aid users in experimental stimuli creation. Select the type of transformation and the number of problems you want to generate (up to 20 at a time), and then click the download button to save your analogies locally."),
                    shiny::tags$p("You can also use the Cognitive Task page to administer letter string analogies to participants in an experimental setting, or to play with the problems yourself. The app will tell you whether the response was correct, and move on to the next question after each problem is solved successfully."),
                    shiny::tags$p("Developed by: Alexandra N. Pafford")
    ),
    tabPanel("Cognitive Task",
             h3("Solve the Analogy"),
             p("Below is a letter string analogy problem. Try to solve it:"),
             textOutput("cognitive_task_problem"),
             textInput("user_answer", "Your answer:"),
             actionButton("answer_submit", "Submit"),
             textOutput("task_feedback"))
  )
)

# --------------------------------------------------------------------------