# plumber.R
library(plumber)
library(textcat)

#* @get /textcat
#* @param txt A character value, text to categorise
guessLanguage = function(txt) {
  
  txt = input
  output = textcat(input)
  
  cat("input: ", input, "\n",
      "likely: ", output, "\n")
  
  return(output)
  
}

