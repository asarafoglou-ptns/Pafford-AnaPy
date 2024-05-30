
## Analogies App
## Alexandra Pafford

# --------------------------------------------------------------------------

## Install dependencies
# install.packages(c("shiny", "readr", "writexl"))

## Load libraries with namespaces
library(shiny)
library(readr)
library(writexl)

# --------------------------------------------------------------------------

# Install the Analogies app
devtools::install_github("asarafoglou-ptns/Pafford-Analogy/Analogies")

library(Analogies)

# --------------------------------------------------------------------------

# Load in the UI and Server Logic

# getwd() # You can use this to find where you're working

source("[your_path_here]/Analogy_UI.R")
source("[your_path_here]/Analogy_Server.R")

# --------------------------------------------------------------------------

# Run the application
shiny::shinyApp(ui = ui, server = server)

