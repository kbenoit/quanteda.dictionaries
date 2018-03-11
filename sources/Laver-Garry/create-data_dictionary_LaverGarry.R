# Laver and Garry Dictionary of Policy Positions

library("quanteda")

data_dictionary_LaverGarry  <- dictionary(file = "sources/Laver-Garry/Laver_and_Garry_2000.cat")

devtools::use_data(data_dictionary_LaverGarry, overwrite = TRUE)
