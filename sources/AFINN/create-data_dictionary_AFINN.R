# AFINN Dictionary

library("quanteda")

afinn <- read.delim("sources/AFINN/AFINN-111.txt", col.names = c("word", "valence"))
afinndf <-
    dplyr::mutate(afinn, sentiment = ifelse(as.numeric(valence) > 0, "positive", "negative"))

data_dictionary_AFINN <- as.dictionary(afinndf)

afinndf$sentiment <- with(afinndf, paste(substring(sentiment, 1, 3),
                                          abs(valence), sep = "_"))
afinndf$sentiment[afinndf$valence == 0] <- "neutral"

data_dictionary_AFINNscale <- as.dictionary(afinndf)

devtools::use_data(data_dictionary_AFINN, overwrite = TRUE)

