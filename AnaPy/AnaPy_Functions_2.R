#' @title Shift Letters
#' 
#' 
#' @description This function shifts each letter in the input string by a specified number of places in the alphabet. 
#' Both lowercase and uppercase letters are shifted, and other characters are not altered.
#' 
#' @param string A character string where letters will be shifted.
#' @param n An integer specifying the number of positions each letter in the string should be shifted.
#'
#' @return A character string with the letters shifted.
#' 
#' @examples
#' # Element A (base_string) = abcd
#' Shift the base string by 1 position
#' shift_letter(abcd, 1)
#' 
#' # Element A (base_string) = pqrs
#' shift the base string by 3 positions in the alphabet
#' shift_letter(pqrs, 3)
#' 
#' @export
shift_letters <- function(string, n) {
  shifted <- sapply(strsplit(string, "")[[1]], function(char) {
    if (grepl("[a-z]", char)) {
      intToUtf8((utf8ToInt(char) - utf8ToInt('a') + n) %% 26 + utf8ToInt('a'))
    } else if (grepl("[A-Z]", char)) {
      intToUtf8((utf8ToInt(char) - utf8ToInt('A') + n) %% 26 + utf8ToInt('A'))
    } else {
      char
    }
  })
  paste(shifted, collapse = "")
}


#' @title Reverse String
#' 
#' 
#' @description This function reverses, or mirrors, the input string. This means that
#' the A element is mirrored into the B element.
#' 
#' @param string A character string where letters will be shifted.
#'
#' @return A character string with the letters reversed.
#' 
#' @examples
#' # Element A (base_string) = abcd
#' Shift the base string by 1 position
#' reverse_letter(abcd)
#'
#' 
#' @export
reverse_string <- function(string) {
  paste(rev(strsplit(string, "")[[1]]), collapse = "")
}

#' @title Generate Letter String Analogy
#'
#' @description This function creates a letter string analogy based on a given transformation function applied to a base string.
#' It first applies the transformation to the base string, shifts the letters of the base string, and then applies
#' the transformation again to generate a structured analogy in the format A:B::C:D.
#'
#' @param base_string A character string that serves as the starting point for generating the analogy.
#' @param transformation A function that specifies how each letter in the base string should be transformed.
#'                       This function must take a single string as input and return a transformed string.
#'
#' @return A character string representing the analogy in the format "A:B::C:D", where
#'         A is the original base string,
#'         B is the transformed base string,
#'         C is the shifted version of the base string,
#'         D is the transformed version of the shifted string.
#'
#' @examples
#' # Example using a simple character shift transformation
#' simple_shift <- function(s) {
#'   sapply(strsplit(s, ""), function(char) {
#'     intToUtf8((utf8ToInt(char) + 1) %% 128)
#'   }) %>% paste0(collapse = "")
#' }
#' generate_analogy("abc", simple_shift)
#'
#' # Example using a reverse string transformation
#' generate_analogy("xyz", reverse_string)

#' @export
generate_analogy <- function(base_string, transformation) {
  A <- base_string
  B <- transformation(A)
  C <- shift_letters(A, 5)
  D <- transformation(C)
  
  sprintf("%s : %s :: %s : %s", A, B, C, D)
}
