# AFINN Dictionary

library("dplyr")
library("tidyr")
library("quanteda")

afinn <- readLines("sources/AFINN/AFINN-111.txt") %>% 
    as.data.frame() %>% 
    separate('.', into = c("word", "score"), sep = "\t") %>% 
    mutate(sentiment = ifelse(as.numeric(score) > 0, "positive", "negative"))

data_dictionary_AFINN <- as.dictionary(afinn)

devtools::use_data(data_dictionary_AFINN, overwrite = TRUE)

