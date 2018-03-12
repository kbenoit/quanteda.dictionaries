# Moral Foundations Dictionary

library("quanteda")

data_dictionary_MFD <- dictionary(file = "sources/MFD/moral_foundations_dictionary.dic")

devtools::use_data(data_dictionary_MFD, overwrite = TRUE)
