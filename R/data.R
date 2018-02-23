#' English UK-US spelling conversion dictionary
#'
#' \pkg{quanteda} \link[quanteda]{dictionary} format objects mapping UK to US
#' spellings and vice-versa.
#'
#' @details
#' These dictionaries provide the ability to homogenize (or homogenise!) the
#' spellings of English by converting the spelling variants of one language to
#' the other.  To make all English spellings British, for instance, apply the
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

#' NRC Word-Emotion Association Lexicon
#'
#' A \pkg{quanteda} \link[quanteda]{dictionary} object containing Mohammad and
#' Charron's (2010, 2013)  NRC Word-Emotion Association Lexicon (aka NRC Emotion
#' Lexicon aka EmoLex): association of words with eight emotions (anger, fear,
#' anticipation, trust, surprise, sadness, joy, and disgust) and two sentiments
#' (negative and positive) manually annotated on Amazon's Mechanical Turk.
#' Available in 40 different languages.
#' @references
#'   Saif Mohammad and Peter Turney (2013). "Crowdsourcing a
#'   Word-Emotion Association Lexicon."  \emph{Computational Intelligence} 29
#'   (3), 436-465.
#'
#'   Saif Mohammad and Peter Turney (2010). "Emotions Evoked by Common Words and
#'   Phrases: Using Mechanical Turk to Create an Emotion Lexicon." In
#'   \emph{Proceedings of the NAACL-HLT 2010 Workshop on Computational
#'   Approaches to Analysis and Generation of Emotion in Text}, June 2010, LA,
#'   California.
#'
#'   NRC webpage: \url{http://saifmohammad.com/WebPages/AccessResource.htm}
#' @keywords data
"data_dictionary_NRC"

#' positive and negative words from Hu and Liu (2004)
#'
#' A \pkg{quanteda} \link[quanteda]{dictionary} object containing the positive
#' and negative words from Hu and Liu (2004, 2005).
#' @references Minqing Hu and Bing Liu. "Mining and Summarizing Customer
#'   Reviews." Proceedings of the ACM SIGKDD International Conference on
#'   Knowledge Discovery and Data Mining (KDD-2004), Aug 22-25, 2004, Seattle,
#'   Washington, USA,
#'
#'   Bing Liu, Minqing Hu and Junsheng Cheng. "Opinion Observer: Analyzing and
#'   Comparing Opinions on the Web." Proceedings of the 14th International World
#'   Wide Web conference (WWW-2005), May 10-14, 2005, Chiba, Japan. Young, L.
#'   and Soroka, S. 2012. \emph{Lexicoder Sentiment Dictionary}. Available at
#'   \url{http://lexicoder.com}.
#' @source \url{http://www.cs.uic.edu/~liub/FBS/sentiment-analysis.html}
#' @keywords data
"data_dictionary_HuLiu"

#' augmented General Inquirer \emph{Positiv} and \emph{Negativ} dictionary
#'
#' A \pkg{quanteda} \link[quanteda]{dictionary} object containing the
#' \emph{Positiv} and \emph{Negativ} dictionary entries from the augmented
#' General Inquirer.  These are new valence categories described at
#' \url{http://www.wjh.harvard.edu/~inquirer/homecat.htm} but also including the
#' terms from the \href{http://www.wjh.harvard.edu/~inquirer/Yes.html}{yes} and
#' \href{http://www.wjh.harvard.edu/~inquirer/No.html}{no} dictionary entries.
#' @references Stone, Philip J., Dexter C. Dunphy, and Marshall S. Smith. 1966.
#'   "The general inquirer: A computer approach to content analysis." Cambridge,
#'   MA: MIT Press.
#' @source \url{http://www.wjh.harvard.edu/~inquirer/spreadsheet_guide.htm}
#' @keywords data
"data_dictionary_geninqposneg"

#' Martindale's Regressive Imagery Dictionary (RID)
#'
#' The English Regressive Imagery Dictionary (RID) consists of about 3,150 words
#' and roots assigned to 29 categories of primary process cognition, 7
#' categories of secondary process cognition, and 7 categories of emotions,
#' designed by Martindale (1975,1990) to measure primordial vs. conceptual
#' thinking.
#'
#' @format The dictionary has three levels of nesting, and forms 43 keys in
#'   total and a total of 3,150 values.
#' @references Martindale, C. (1975). \emph{Romantic progression: The psychology
#' of literary history.} Washington, D.C.: Hemisphere.
#'
#' Martindale, C. (1990). \emph{The clockwork muse: The predictability of
#' artistic change.} New York: Basic Books.
#' @keywords data
"data_dictionary_RID"

