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
#' quanteda::tokens_lookup(toks, data_dictionary_uk2us, exclusive = FALSE,
#'                         capkeys = FALSE)
#' quanteda::tokens_lookup(toks, data_dictionary_us2uk, exclusive = FALSE,
#'                         capkeys = FALSE)
"data_dictionary_uk2us"

#' @rdname data_dictionary_uk2us
"data_dictionary_us2uk"

#' Martindale's Regressive Imagery Dictionary (RID)
#'
#' The English Regressive Imagery Dictionary (RID) consists of about 3,150 words
#' and roots assigned to 29 categories of primary process cognition, 7
#' categories of secondary process cognition, and 7 categories of emotions,
#' designed by Martindale (1975, 1990) to measure primordial vs. conceptual
#' thinking.
#' @format The dictionary has three levels of nesting, and forms 43 keys in
#'   total and a total of 3,150 values.
#' @references Martindale, C. (1975). \emph{Romantic Progression: The Psychology
#' of Literary History.} Washington, D.C.: Hemisphere.
#'
#' Martindale, C. (1990). \emph{The Clockwork Muse: The Predictability of
#' Artistic Change.} New York: Basic Books.
#' @keywords data
"data_dictionary_RID"

#' Moral Foundations Dictionary
#'
#' @description A \pkg{quanteda} \link[quanteda]{dictionary} object containing
#' the Moral Foundations Dictionary, a publicly available dictionaries with
#' information on the proportions of virtue and vice words for each foundation.
#' The categories are harm (vice/virtue), fairness (vice/virtue), ingroup (vice/virtue),
#' authority (vice/virtue), purity (vice/virtue) and morality (general).
#'
#' @description This version is 2.0 version of the dictionary,
#'   \href{http://www.jeremyfrimer.com/uploads/2/1/2/7/21278832/summary.pdf}{recommended}
#'   over the first version of the MDF by its authors.
#' @source http://www.jeremyfrimer.com/research-downloads.html; a previous
#'   version is available at \url{http://moralfoundations.org/othermaterials}
#' @references
#'   Frimer, J. et. al. (2017).  Moral Foundations Dictionaries for
#'   Linguistic Analyses, 2.0. University of Winnipeg Manuscript.
#'   \url{http://www.jeremyfrimer.com/uploads/2/1/2/7/21278832/summary.pdf}.
#'
#'   Haidt, J., Graham, J., & Nosek, B.A. (2009). \href{http://dx.doi.org/10.1037/a0015141}{Liberals
#'   and Conservatives Rely on Different Sets of Moral Foundations}.
#'   \emph{Journal of Personality and Social Inquiry}, 20(2--3), 110--119.
#'
#'   Graham, J., & Haidt, J. (2016). \href{http://moralfoundations.org/othermaterials}{Moral
#'   Foundations Dictionary.}: \url{http://moralfoundations.org/othermaterials}.
#' @keywords data
"data_dictionary_MFD"

#' Laver and Garry Dictionary of Policy Positions
#'
#' A \pkg{quanteda} \link[quanteda]{dictionary} object containing the Laver and Garry
#' dictionary which been developed to estimates the policy positions of political actors
#' in the United Kingdom by comparing their speeches and written documents to key words
#' found in the British Conservative and Labour manifestos of 1992. Note: Please remember
#' that this dictionary was customized to reflect the policy positions of UK political parties.
#' @format The dictionary has two levels of nesting with 7 main policy areas (level 1) divided up into 19
#' sub-categories (level 2).
#' @source \url{https://provalisresearch.com/products/content-analysis-software/wordstat-dictionary/laver-garry-dictionary-of-policy-position/}
#' @references
#'   Laver. M. & Garry, J. (2000). \href{https://doi.org/10.2307/2669268}{Estimating Policy Positions
#'   from Political Texts}. \emph{American Journal of Political Science}, 44(3), 619--634.
#' @keywords data
"data_dictionary_LaverGarry"

#' Sample short documents for testing
#'
#' Some sample short documents in plain text format for testing
#'   with \code{\link{liwcalike}}.
#' @examples
#' liwcalike(data_char_testphrases)
"data_char_testphrases"

# save(testphrases, file = "data/testphrases.RData")
# writeLines(testphrases, "inst/extdata/testphrases.txt")
