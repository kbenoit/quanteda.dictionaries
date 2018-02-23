library("quanteda")

data_dictionary_HuLiu <-
    dictionary(list(positive = scan(file = "sources/Hu-Liu/positive-words.txt",
                                    what = "character", comment.char = ";"),
                    negative = scan(file = "sources/Hu-Liu/negative-words-UTF8.txt",
                                    what = "character", comment.char = ";")))
devtools::use_data(data_dictionary_HuLiu, overwrite = TRUE)
