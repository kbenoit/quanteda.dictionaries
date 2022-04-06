context("test liwcalike.R")

test_that("test dictionary count etc.", {
    txt <- c("The red-shirted lawyer gave her ex-boyfriend $300 out of pity :(.",
             "The green-shirted lawyer gave her $300 out of pity :(.")
    myDict <- quanteda::dictionary(list(people = c("lawyer", "boyfriend"),
                              colorFixed = "red",
                              colorGlob = "red*",
                              mwe = "out of"))
    myCount <- liwcalike(txt, myDict, what = "word")

    toks <- quanteda::tokens(txt[1], split_hyphens = TRUE)
    num_words_txt1 <- quanteda::ntoken(toks)

    # dictionary count
    num_people <- sum(toks[["text1"]] == "lawyer") + sum(toks[["text1"]] == "boyfriend")
    expect_equivalent(round(as.numeric(myCount$people[1]), 2),
                      round(100 * num_people / num_words_txt1, 2))

    # period count
    num_Period <- stringi::stri_count_fixed(txt[1], ".") / num_words_txt1 * 100
    expect_equivalent(round(as.numeric(myCount$Period[1]), 2),
                      round(num_Period, 2))
})

test_that("object class types are data.frame", {
    txt <- c("The red-shirted lawyer gave her ex-boyfriend $300 out of pity :(.",
             "The green-shirted lawyer gave her $300 out of pity :(.")
    dict <- quanteda::dictionary(list(people = c("lawyer", "boyfriend"),
                                        stopwords = c("out", "of", "the")))
    liwcout <- liwcalike(txt, dictionary = dict)
    expect_true(
        all(apply(liwcout[, which(names(liwcout) == "WC") : ncol(liwcout)], 2, is.numeric))
    )
    liwcout <- liwcalike(txt, dictionary = NULL)
    expect_true(all(is.na(liwcout$Dic)))

    expect_true(all(is.integer(liwcout$Segment)))
    expect_true(all(is.integer(liwcout$WC)))
})

test_that("Arguments passed to quanteda::tokens(x, ...) work (#17)", {
    expect_true(liwcalike("A.", remove_punct = TRUE)$WC !=
                    liwcalike("A.", remove_punct = FALSE)$WC)
    expect_equal(liwcalike("A.", remove_punct = TRUE)$WC, 1)
    expect_equal(liwcalike("A.", remove_punct = FALSE)$WC, 2)
    expect_equal(liwcalike("A.", remove_punct = FALSE)$Period, 50)
})

test_that("sixltr works (#16)", {
    txt <- c("This sentence contains two six letter words.")
    dict <- quanteda::dictionary(list(numbers = c("two", "three")))
    liwcout <- liwcalike(txt, dictionary = dict, remove_punct = TRUE)
    expect_equal(
        liwcalike(txt, dictionary = dict, remove_punct = TRUE)$Sixltr,
        2/7 * 100,
        tol = .01
    )
    expect_equal(
        liwcalike(txt, dictionary = dict, remove_punct = FALSE)$Sixltr,
        2/8 * 100,
        tol = .01
    )
})

test_that("works on all-punctuation documents (#26)", {
    txt <- c("This is one sentence.", "...", ":-)")
    dict <- quanteda::dictionary(list(numbers = c("one", "three")))

    expect_equal(
        liwcalike(txt, dictionary = dict, remove_punct = TRUE)[, 1:5],
        data.frame(
            docname = paste0("text", 1:3),
            Segment = 1:3,
            WPS = c(4, 0, 0),
            WC = c(4, 0, 0),
            Sixltr = c(25, 0, 0),
            stringsAsFactors = FALSE
        )
    )

    expect_equal(
        liwcalike(txt, dictionary = dict, remove_punct = FALSE)[, c(1:5, 9)],
        data.frame(
            docname = paste0("text", 1:3),
            Segment = 1:3,
            WPS = c(5, 3, 3),
            WC = c(5, 3, 3),
            Sixltr = c(20, 0, 0),
            Period = c(20, 100, 0),
            stringsAsFactors = FALSE
        )
    )
})

test_that("the number of parentheses is correctly counted (#36)", {
    txt1 <- c("This is a (test)", "Second (time) test")
    res1 <- liwcalike(txt1)
    expect_equal(res1$Parenth, c(16.67, 20.00))
    txt2 <- c("This is a test", "Second (time) test")
    res2 <- liwcalike(txt2)
    expect_equal(res2$Parenth, c(0, 20))

    txt3 <- c("This is a (test", "Second (time) test")
    res3 <- liwcalike(txt3)
    expect_equal(res3$Parenth, c(0, 20))
})
