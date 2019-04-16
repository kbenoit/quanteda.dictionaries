test_that("test dictionary conversion works with quanteda tokens_replace", {
    txt <- c(uk = "endeavour to prioritise honour over esthetics",
             us = "endeavor to prioritize honor over aesthetics")
    toks <- quanteda::tokens(txt)

    expect_equal(
        as.character(quanteda::tokens_lookup(toks, data_dictionary_uk2us,
                        exclusive = FALSE, capkeys = FALSE)),
        rep(c("endeavor", "to", "prioritize", "honor", "over", "esthetics"), 2)
    )
    expect_equal(
        as.character(quanteda::tokens_lookup(toks, data_dictionary_us2uk,
                        exclusive = FALSE, capkeys = FALSE)),
        rep(c("endeavour", "to", "prioritise", "honour", "over", "aesthetics"), 2)
    )
})
