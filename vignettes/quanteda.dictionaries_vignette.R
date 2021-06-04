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
output_nrc <- liwcalike(data_corpus_moviereviews, data_dictionary_LSD2015)
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

