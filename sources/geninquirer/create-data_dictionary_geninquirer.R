library("quanteda")

geninquirer <- read.csv("sources/geninquirer/inquireraugmented.csv",
                        stringsAsFactors = FALSE, comment.char = "")
require(magrittr)
GIpos <-
    c(geninquirer$Entry[geninquirer$Positiv == "Positiv"],
      geninquirer$Entry[geninquirer$Yes == "Yes"]) %>%
    char_tolower %>%
    stringi::stri_replace_all_regex("#\\w+$", "") %>%
    unique
GIneg <-
    c(geninquirer$Entry[geninquirer$Negativ == "Negativ"],
      geninquirer$Entry[geninquirer$No == "No"]) %>%
    char_tolower %>%
    stringi::stri_replace_all_regex("#\\w+$", "") %>%
    unique
data_dictionary_geninqposneg <-
    dictionary(list(positive = GIpos, negative = GIneg))

devtools::use_data(data_dictionary_geninqposneg, overwrite = TRUE)
