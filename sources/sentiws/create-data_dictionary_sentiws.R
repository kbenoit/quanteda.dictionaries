# SentiWS Dictionary

library("quanteda")
library("dplyr")
library("tidyr")
library("stringr")

read_senti_scores <- function(filename) {
    
    results <- read.delim(filename, header = FALSE, encoding="UTF-8") %>%
        cbind(str_split_fixed(.$V3, "[,-]",50),stringsAsFactors = FALSE) %>%
        mutate(
            V1 = str_sub(str_match(V1,".*\\|"),1,-2),
            nr = row_number()
        ) %>%
        select(-V3) %>%
        mutate(nr = as.character(nr)) %>%
        gather(wordstem,word,V1,1:48, -nr,-V2) %>%
        select(word,V2) %>% rename(score=V2) %>%
        filter(word != "") %>%
        arrange(word)
    
}

positive <- read_senti_scores("/Users/stefan/GitHub/phd-thesis/analysis/comments_pledge_studies/data/SentiWS_v1.8c_Positive.txt") %>% 
    mutate(sentiment = "positive")

negative <- read_senti_scores("/Users/stefan/GitHub/phd-thesis/analysis/comments_pledge_studies/data/SentiWS_v1.8c_Negative.txt") %>% 
    mutate(sentiment = "negative") 

sentis <- bind_rows(positive, negative)

data_dictionary_sentiws <- as.dictionary(sentis)

devtools::use_data(data_dictionary_sentiws, overwrite = TRUE)

