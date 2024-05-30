## Analogies

## Project Description
This is an R package and Shiny app to generate letter string analogy problems, and creates a cognitive task where you can use these analogies in laboratory environments.
I wanted to create an app that also had useful functions to go along with it, so regardless of your experimental needs, this app might be helpful for you.
In my own research, thinking of quality experimental stimuli has been challenging and time-consuming. I hope that anyone interested in researching cognitive science can find this package and its corresponding app useful.

## Features
- **Generate Analogies**: Automatically generate analogies based on selected transformation rules. You can generate up to 20 analogies at a time.
- **Interactive UI**: Solve analogies in a dedicated "Cognitive Task" tab.
- **Customizable Settings**: Choose the type of transformation for generating new analogies.
- **Export Capabilities**: Download generated analogies as a CSV file for further analysis or use.

## Installation
You can install the latest version of the package directly from GitHub:

```r
# install.packages("devtools")
devtools::install_github("anpafford/asarafoglou-ptns/Pafford-Analogy")
```

## Usage
To run the Shiny app included in the package, use the following command in your R console:
```r
library(analogies)
shiny::shinyApp(ui = ui, server = server)
```

## Functions

`generate_sequential_string(length)`
- Generates a sequential string of a specified length starting from a random letter.
- Parameters:
  - `length` The length of the letter string to generate.
- Returns: A string of sequential letters of the specified length.

`generate_new_problem(base_string, transformation, current_problem)`
- Generate and update a new problem for the cognitive task based on a given base string and transformation function.
- Parameters:
  - `base_string`: Starting string for generating the analogy.
  - `transformation`: Function used to transform the base string.
  - `current_problem`: Reactive variable to store the current problem.

`shift_letters(string, n)`
- Transformation function that applies a cyclic shift to each letter in the provided string by a specified number of positions.
- Parameters:
  - `string`: The string to shift.
  - `n`: The number of positions to shift each letter.
- Returns: The modified string with the shifted letters.

`reverse_string(string)`
- Transformation function that returns a new string that is the 'mirror' of the input string.
- Parameters:
  - `string`: The string to reverse
- Returns: The reversed string in a mirrored format.

`letter_deletion(string)`
- Transformation function that removes the last letter from a given string.
- Parameters:
  - `string`: The string from which to delete the last letter.
- Returns: The string minus the last letter.

`letter_addition(string)`
- Transformation function that adds the next sequential letter in the Latin alphabet to the end of the string. Wraps around to 'A' after 'Z'.
- Parameters:
  - `string`: The string to which a letter will be added
- Returns: The string with an additional letter appended.

`generate_analogy(base_string, transformation)`
- Constructs an analogy using a base string and a transformation function.
- Parameters:
  - `base_string`: The base string to use in the analogy.
  - `transformation`: A function that applies a transformation to a string.
- Returns: A formatted string representing the analogy.

## License
This project is licensed under the MIT License - see the LICENSE.md file for details.

## Author
Alexandra N. Pafford - @ANPafford



