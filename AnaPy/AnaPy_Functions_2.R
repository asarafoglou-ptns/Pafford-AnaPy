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

#' @export
reverse_string <- function(string) {
  paste(rev(strsplit(string, "")[[1]]), collapse = "")
}


#' @export
generate_analogy <- function(base_string, transformation) {
  A <- base_string
  B <- transformation(A)
  C <- shift_letters(A, 5)
  D <- transformation(C)
  
  sprintf("%s : %s :: %s : %s", A, B, C, D)
}
