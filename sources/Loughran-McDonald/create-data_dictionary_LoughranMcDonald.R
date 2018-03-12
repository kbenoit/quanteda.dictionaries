# Loughran and McDonald Sentiment Word Lists

library("quanteda")

data_dictionary_LoughranMcDonald  <- dictionary(file = "sources/Loughran-McDonald/Loughran_and_McDonald_2014.cat")

devtools::use_data(data_dictionary_LoughranMcDonald, overwrite = TRUE)
