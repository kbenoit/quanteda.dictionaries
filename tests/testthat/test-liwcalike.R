context("test liwcalike.R")

test_that("test dictionary count etc.", {

    txt <- c("The red-shirted lawyer gave her ex-boyfriend $300 out of pity :(.",
             "The green-shirted lawyer gave her $300 out of pity :(.")
    myDict <- quanteda::dictionary(list(people = c("lawyer", "boyfriend"),
                              colorFixed = "red",
                              colorGlob = "red*",
                              mwe = "out of"))
    myCount <- liwcalike(txt, myDict, what = "word")

    toks <- quanteda::tokens(txt[1], remove_hyphens = TRUE)
    num_words_txt1 <- quanteda::ntoken(toks)

    # dictionary count
    num_people <- sum(toks$text1 == "lawyer") + sum(toks$text1 == "boyfriend")
    expect_equivalent(round(as.numeric(myCount$people[1]), 2),
                      round(100 * num_people / num_words_txt1, 2))

    # period count
    num_Period <- stringi::stri_count_fixed(txt[1], ".") / num_words_txt1 * 100
    expect_equivalent(round(as.numeric(myCount$Period[1]), 2),
                      round(num_Period, 2))
})
