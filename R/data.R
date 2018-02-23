#' English UK-US spelling conversion dictionary
#'
#' \pkg{quanteda} \link[quanteda]{dictionary} format objects mapping UK to US
#' spellings and vice-versa.
#'
#' @details
#' These dictionaries provide the ability to homogenize (or homogenise!) the
#' spellings of English by converting the spelling variants of one language to
#' the other. To make all English spellings British, for instance, apply the
#' \code{data_dictionary_us2uk} dictionary. To make all English spellings
#' American, apply \code{data_dictionary_uk2us}.
#'
#' @format
#' A \link[quanteda]{dictionary} where the key is the English variant to which conversion is
#' desired, and the values are spelling variants in English variant from which conversion is desired.
#' @source
#'   \url{http://www.tysto.com/uk-us-spelling-list.html}
#' @keywords data dictionary
#' @examples
#' txt <- c(uk = "endeavour to prioritise honour over esthetics",
#'          us = "endeavor to prioritize honor over aesthetics")
#' toks <- quanteda::tokens(txt)
#'
#' quanteda::tokens_replace(toks, data_dictionary_uk2us)
#' quanteda::tokens_replace(toks, data_dictionary_uk2us)
"data_dictionary_uk2us"

#' @rdname data_dictionary_uk2us
"data_dictionary_us2uk"
