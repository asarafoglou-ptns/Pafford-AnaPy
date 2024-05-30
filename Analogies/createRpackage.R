# set directory to where your function file is located!
setwd("C:/Users/alexa/Documents/Programming2")
rm(list = ls())
getwd()

# install.packages('devtools')
# install.packages('roxygen2')
# install.packages('usethis')

library(devtools)
library(roxygen2)
library(usethis)

# 1. create the R package skeleton, choose a name for your R package
devtools::create('Analogies')

# set working directory to *inside* your R package
setwd("C:/Users/alexa/Documents/Programming2/Analogies")
getwd()
search()


# populate the DESCRIPTION file
# never touch your NAMESPACE file

# # 2. add a license
usethis::use_ccby_license()

# 3. move your R file with your functions into the R directory of your package

# 4.1 Define which functions should be available to your users
# use "#' @export" for that, add it to your .R function file
# 4.2 Use the document() function to make the functions available
# to users
devtools::document()
devtools::build()

# 5. Do your R functions depend on other packages?
# (1) mark those functions clearly in your R file, by adding the package name + :: 
# in front of your functions (e.g., ggplot2::ggplot())
# (2) add the packages to your dependencies in the Description file, e.g.,
# Imports:
#   ggplot2

# 6. build your package
# creates an installable file with ending "tar.gz"
devtools::build()

# 7. your package can now be installed (by you and others!)
devtools::install()

install.packages("Analogies")
library(Analogies)

# Example base string
base_string <- "abcdef"

# Generate an analogy using the reverse string transformation
analogy_reverse <- generate_analogy(base_string, reverse_string)
print(analogy_reverse)

# Generate an analogy using the shift letters transformation
analogy_shift <- generate_analogy(base_string, function(x) shift_letters(x, 1))
print(analogy_shift)
??Analogies  
?generate_analogy
