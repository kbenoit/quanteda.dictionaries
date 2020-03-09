library("quanetda")
library("quanetda.dictionaries")
library("Matrix")

data_dictionary_liwc2015eng <- readliwc("tests/data/LIWC2015 dictionary poster.pdf")
data_char_wordlisten <- readLines("inst/extdata/words.txt")
data_tokens_wordlisten <- as.tokens(list(allwords = data_char_wordlisten))

mat <- Matrix(
    FALSE,
    nrow = length(data_char_wordlisten), ncol = length(data_dictionary_liwc2015eng),
    dimnames = list(word = data_char_wordlisten,
                    dictionary = paste("liwc", names(data_dictionary_liwc2015eng), sep = "_")),
    sparse = TRUE
)

for (category in names(data_dictionary_liwc2015eng)) {
    cat("Processing", category, "...")
    mat[, paste0("liwc_", category)] <-
        as.character(tokens_select(data_tokens_wordlisten, liwc[category], pad = TRUE)) != ""
    cat("matched", sum(mat[, paste0("liwc_", category)]), "words.\n")
}
