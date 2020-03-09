## ----echo = FALSE-------------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, 
                      comment = "##")

## ----eval=TRUE, warning=FALSE, message=FALSE----------------------------------
library("quanteda")
library("quanteda.dictionaries")

## -----------------------------------------------------------------------------
data(data_corpus_moviereviews, package = "quanteda.textmodels")

## ---- eval=FALSE--------------------------------------------------------------
#  liwc2007dict <- dictionary(file = "LIWC2007.cat", format = "wordstat")
#  tail(liwc2007dict, 1)
#  # Dictionary object with 1 primary key entry and 2 nested levels.
#  # - [SPOKEN CATEGORIES]:
#  #   - [ASSENT]:
#  #     - absolutely, agree, ah, alright*, aok, aw, awesome, cool, duh, ha, hah, haha*, heh*, hm*, huh, lol, mm*, oh, ok, okay, okey*, rofl, uhhu*, uhuh, yah, yay, yea, yeah, yep*, yes, yup
#  #   - [NON-FLUENCIES]:
#  #     - er, hm*, sigh, uh, um, umm*, well, zz*
#  #   - [FILLERS]:
#  #     - blah, idon'tknow, idontknow, imean, ohwell, oranything*, orsomething*, orwhatever*, rr*, yakn*, ykn*, youknow*

## -----------------------------------------------------------------------------
output_nrc <- liwcalike(data_corpus_moviereviews, data_dictionary_NRC)
head(output_nrc)

## ----fig.width=7, fig.height=6------------------------------------------------
output_nrc$net_positive <- output_nrc$positive - output_nrc$negative
output_nrc$sentiment <- docvars(data_corpus_moviereviews, "sentiment")

library("ggplot2")
# set ggplot2 theme
theme_set(theme_minimal())
ggplot(output_nrc, aes(x = sentiment, y = net_positive)) +
    geom_boxplot() +
    labs(x = "Classified sentiment", 
         y = "Net positive sentiment",
         main = "NRC Sentiment Dictionary")

## ----fig.width=7, fig.height=6------------------------------------------------
output_geninq <- liwcalike(data_corpus_moviereviews, data_dictionary_geninqposneg)
names(output_geninq)

output_geninq$net_positive <- output_geninq$positive - output_geninq$negative
output_geninq$sentiment <- docvars(data_corpus_moviereviews, "sentiment")

ggplot(output_geninq, aes(x = sentiment, y = net_positive)) +
    geom_boxplot() +
    labs(x = "Classified sentiment", 
         y = "Net positive sentiment", 
         main = "General Inquirer Sentiment Association")

## ----fig.width=7, fig.height=6------------------------------------------------
cor.test(output_nrc$net_positive, output_geninq$net_positive)

cor_dictionaries <- data.frame(
    nrc = output_nrc$net_positive,
    geninq = output_geninq$net_positive
)

ggplot(data = cor_dictionaries, aes(x = nrc, y = geninq)) + 
    geom_point(alpha = 0.2) +
    labs(x = "NRC Word-Emotion Association Lexicon",
         y = "General Inquirer Net Positive Sentiment",
         main = "Correlation for Net Positive Sentiment in Movie Reviews")

## -----------------------------------------------------------------------------
dict <- dictionary(list(positive = c("great", "phantastic", "wonderful"),
                          negative = c("bad", "horrible", "terrible")))

output_custom_dict <- liwcalike(data_corpus_moviereviews, dict)

head(output_custom_dict)

## -----------------------------------------------------------------------------
ndoc(data_corpus_inaugural)

## -----------------------------------------------------------------------------
inaug_corpus_paragraphs <- corpus_reshape(data_corpus_inaugural, to = "paragraphs")
ndoc(inaug_corpus_paragraphs)

## -----------------------------------------------------------------------------
output_paragraphs <- liwcalike(inaug_corpus_paragraphs, data_dictionary_NRC)
head(output_custom_dict)

## ---- eval=FALSE--------------------------------------------------------------
#  # save as csv file
#  write.csv(output_custom_dict, file = "output_dictionary.csv",
#           fileEncoding = "utf-8")
#  
#  # save as Excel file (xlsx)
#  library(rio)
#  rio::export(output_custom_dict, file = "output_dictionary.xlsx")

## -----------------------------------------------------------------------------
txt <- c(uk = "endeavour to prioritise honour over esthetics",
         us = "endeavor to prioritize honor over aesthetics")
toks <- quanteda::tokens(txt)

## -----------------------------------------------------------------------------
quanteda::tokens_lookup(toks, data_dictionary_uk2us, 
                        exclusive = FALSE, capkeys = FALSE)

## -----------------------------------------------------------------------------
quanteda::tokens_lookup(toks, data_dictionary_us2uk,
                        exclusive = FALSE, capkeys = FALSE)

## -----------------------------------------------------------------------------
# original dfm
quanteda::dfm(toks)

# homogeni[zs]ed dfm
quanteda::dfm(quanteda::tokens_lookup(toks, data_dictionary_uk2us,
                                      exclusive = FALSE, capkeys = FALSE))

