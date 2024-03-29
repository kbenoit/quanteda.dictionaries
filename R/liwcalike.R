#' Analyse text in a LIWC-alike fashion
#'
#' Analyse a set of texts to produce a dataset of percentages and other
#' quantities describing the text, similar to the functionality supplied by the
#' Linguistic Inquiry and Word Count standalone software distributed at
#' \url{https://www.liwc.app}.
#' @param x input object, a \pkg{quanteda} \link[quanteda]{corpus} or character
#'   vector for analysis
#' @param dictionary a \pkg{quanteda} \link[quanteda]{dictionary} object
#'   supplied for analysis
#' @param tolower convert to common (lower) case before tokenizing
#' @param verbose if \code{TRUE} print status messages during processing
#' @param digits how many significant digits to print for percentage quantities
#' @param ... options passed to \code{\link[quanteda]{tokens}} offering
#'   finer-grained control over how "words" are defined
#' @return a data.frame object containing the analytic results, one row per
#'   document supplied
#' @section Segmentation: The LIWC standalone software has many options for
#'   segmenting the text.  While this function does not supply segmentation
#'   options, you can easily achieve the same effect by converting the input
#'   object into a corpus (if it is not already a corpus) and using
#'   \code{\link[quanteda]{corpus_reshape}} or \code{\link[quanteda]{corpus_segment}}
#'   to split the input texts into smaller units based on user-supplied tags,
#'   sentence, or paragraph boundaries.
#' @examples
#' liwcalike(data_char_testphrases)
#'
#' # examples for comparison
#' txt <- c("The red-shirted lawyer gave her yellow-haired, red nose ex-boyfriend $300
#'             out of pity:(.")
#' dict <- quanteda::dictionary(list(people = c("lawyer", "boyfriend"),
#'                                   color_fixed = "red",
#'                                   color_glob = c("red*", "yellow*", "green*"),
#'                                   mwe = "out of"))
#' liwcalike(txt, dict, what = "word")
#' liwcalike(txt, dict, what = "fasterword")
#' (toks <- quanteda::tokens(txt, what = "fasterword", split_hyphens = TRUE))
#' length(toks[[1]])
#' # LIWC says 12 words
#'
#' \dontrun{# works with LIWC 2015 dictionary too
#' dict_liwc_2015 <-
#'   dictionary(file = "~/Dropbox/QUANTESS/dictionaries/LIWC/LIWC2015_English_Flat.dic",
#'              format = "LIWC")
#' dat_liwc_analysis <- liwcalike(data_corpus_inaugural, dict_liwc_2015)
#' dat_liwc_analysis[1:6, 1:10]
#' ##           docname Segment   WC      WPS Sixltr   Dic function article relativ motion
#' ## 1 1789-Washington       1 1540 62.21739  24.35 253.1   52.403  9.0909 101.361 0.3483
#' ## 2 1793-Washington       2  147 33.75000  25.17 250.3    5.065  0.9091  10.884 0.0387
#' ## 3      1797-Adams       3 2584 62.72973  24.61 237.5   82.403 15.0649 163.946 0.3096
#' ## 4  1801-Jefferson       4 1935 42.19512  20.36 253.2   62.143 10.0000 105.442 0.7353
#' ## 5  1805-Jefferson       5 2381 48.13333  22.97 255.8   79.221 10.9091 151.701 0.6966
#' ## 6    1809-Madison       6 1267 56.04762  24.78 258.2   42.987  8.3117  83.673 0.3870
#' }
#' @export
#' @import quanteda
liwcalike <- function(x, ...) {
    UseMethod("liwcalike")
}

#' @rdname liwcalike
#' @export
liwcalike.character <- function(x, dictionary = NULL, tolower = TRUE, verbose = TRUE, digits = 2, ...) {

    # initialize results data.frame: similar to "Filename" and "Segment"
    result <-
        data.frame(docname = if (is.null(names(x))) paste0("text", 1:length(x)) else names(x),
                   Segment = 1:length(x), row.names = NULL, stringsAsFactors = FALSE)

    # tokenize
    toks <- quanteda::tokens(x, split_hyphens = TRUE, ...)

    # WPS (mean words per sentence) - count sentences before lowercasing
    result[["WPS"]] <- quanteda::ntoken(toks) / quanteda::nsentence(x)

    # WC (word count)
    result[["WC"]] <- quanteda::ntoken(toks)

    # lower case the texts if required
    if (tolower)
        toks <- quanteda::tokens_tolower(toks)

    # Sixltr
    result[["Sixltr"]] <-
      sapply(toks, function(y) sum(stringi::stri_length(y) > 6)) / result[["WC"]] * 100

    # apply the dictionary, if supplied
    if (!is.null(dictionary)) toks <- tokens_lookup(toks, dictionary)

    # no implementation for: Analytic	Clout	Authentic	Tone

    # Dic (percentage of words in the dictionary)
    result[["Dic"]] <- if (!is.null(dictionary)) {
        ntoken(toks) / result[["WC"]] * 100
    } else {
        as.numeric(NA)
    }

    ## add the dictionary counts, transformed to percentages of total words
    # form the dfm
    if (!is.null(dictionary)) {
        dfmdict <- quanteda::dfm(toks, verbose = FALSE)
        result <- cbind(result,
                        as.data.frame(as.matrix(dfmdict) / matrix(rep(result[["WC"]], each = nfeat(dfmdict)),
                                                                  ncol = nfeat(dfmdict), byrow = TRUE),
                                      row.names = seq_len(nrow(result))) * 100)
    }

    # --- punctuation counts
    # AllPunc
    result[["AllPunc"]] <- stringi::stri_count_charclass(x, "\\p{P}") /
        result[["WC"]] * 100

    # Period
    result[["Period"]] <- stringi::stri_count_fixed(x, ".") / result[["WC"]] * 100

    # Comma
    result[["Comma"]] <- stringi::stri_count_fixed(x, ",") / result[["WC"]] * 100

    # Colon
    result[["Colon"]] <- stringi::stri_count_fixed(x, ":") / result[["WC"]] * 100

    # SemiC
    result[["SemiC"]] <- stringi::stri_count_fixed(x, ";") / result[["WC"]] * 100

    # QMark
    result[["QMark"]] <- stringi::stri_count_fixed(x, "?") / result[["WC"]] * 100

    # Exclam
    result[["Exclam"]] <-
        stringi::stri_count_fixed(x, "!") / result[["WC"]] * 100

    # Dash
    result[["Dash"]] <-
        stringi::stri_count_charclass(x, "\\p{Pd}") / result[["WC"]] * 100

    # Quote
    result[["Quote"]] <-
        stringi::stri_count_charclass(x, "[:QUOTATION_MARK:]") /
        result[["WC"]] * 100

    # Apostro
    result[["Apostro"]] <-
        stringi::stri_count_charclass(x, "['\\u2019]") / result[["WC"]] * 100

    # Parenth -- note this is specified as "pairs of parentheses"
    result[["Parenth"]] <-
        pmin(stringi::stri_count_fixed(x, "("),
             stringi::stri_count_fixed(x, ")")) / result[["WC"]] * 100

    # OtherP
    result[["OtherP"]] <-
        stringi::stri_count_charclass(x, "\\p{Po}") / result[["WC"]] * 100

    # convert any NaN to zeros
    result[, -1][is.nan(as.matrix(result[, -1])) | is.infinite(as.matrix(result[, -1]))] <- 0

    # format the result
    round_index <- which(names(result) == "Sixltr") : ncol(result)
    if (is.null(dictionary))
        round_index <- setdiff(round_index, which(names(result) == "Dic"))
    result[, round_index] <- round(result[, round_index], digits = digits)

    result
}
