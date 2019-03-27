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

#' NRC Word-Emotion Association Lexicon
#'
#' A \pkg{quanteda} \link[quanteda]{dictionary} object containing Mohammad and
#' Charron's (2010, 2013) English version of the NRC Word-Emotion Association
#' Lexicon (aka NRC Emotion Lexicon aka EmoLex): association of words with eight
#' emotions (anger, fear, anticipation, trust, surprise, sadness, joy, and disgust)
#' and two sentiments (negative and positive) manually annotated on Amazon's Mechanical Turk.
#' Available in 40 different languages.
#' @references
#'   Saif Mohammad and Peter Turney (2013). "Crowdsourcing a
#'   Word-Emotion Association Lexicon." \emph{Computational Intelligence} 29(3), 436-465.
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

#' Positive and negative words from Hu and Liu (2004)
#'
#' A \pkg{quanteda} \link[quanteda]{dictionary} object containing 2,006 positive
#' and 4,783 negative words from Hu and Liu (2004, 2005).
#' @references
#'   Minqing Hu and Bing Liu. "\href{https://www.cs.uic.edu/~liub/publications/kdd04-revSummary.pdf}{Mining
#'   and Summarizing Customer Reviews.}" In \emph{Proceedings of the ACM
#'   SIGKDD International Conference on Knowledge Discovery and Data Mining (KDD-2004),
#'   Aug 22-25, 2004, Seattle, Washington, USA}.
#'
#'   Bing Liu, Minqing Hu and Junsheng Cheng. "\href{https://www.cs.uic.edu/~liub/publications/www05-p536.pdf}{Opinion
#'   Observer: Analyzing and Comparing Opinions on the Web.}" In \emph{Proceedings of
#'   the 14th International World Wide Web conference (WWW-2005), May 10-14, 2005, Chiba, Japan}.
#' @source \url{http://www.cs.uic.edu/~liub/FBS/sentiment-analysis.html}
#' @keywords data
"data_dictionary_HuLiu"

#' Augmented General Inquirer \emph{Positiv} and \emph{Negativ} dictionary
#'
#' A \pkg{quanteda} \link[quanteda]{dictionary} object containing the
#' \emph{Positiv} and \emph{Negativ} dictionary entries from the augmented
#' General Inquirer. These are new valence categories described at
#' \url{http://www.wjh.harvard.edu/~inquirer/homecat.htm} but also including the
#' terms from the \href{http://www.wjh.harvard.edu/~inquirer/Yes.html}{yes} and
#' \href{http://www.wjh.harvard.edu/~inquirer/No.html}{no} dictionary entries.
#' @references Stone, Philip J., Dexter C. Dunphy, and Marshall S. Smith. 1966.
#'   \emph{The General Inquirer: A Computer Approach to Content Analysis.}
#'   Cambridge, MA: MIT Press.
#' @source \url{http://www.wjh.harvard.edu/~inquirer/spreadsheet_guide.htm}
#' @keywords data
"data_dictionary_geninqposneg"

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

#' SentimentWortschatz (SentiWS)
#'
#' A \pkg{quanteda} \link[quanteda]{dictionary} object containing
#' SentimentWortschatz (SentiWS), a publicly available German-language resource
#' for sentiment analysis. The current version of SentiWS contains 1,650
#' positive and 1,818 negative words, which sum up to 15,649 positive and 15,632
#' negative word forms including their inflections. It not only contains
#' adjectives and adverbs explicitly expressing a sentiment, but also nouns and
#' verbs implicitly containing one. The original dictionary weights within the
#' interval of -1 to 1. Note that the version implemented in
#' \pkg{quanteda.dictionaries} uses a binary classification into positive
#' (weight > 0) and negative (weight < 0) features.
#' @source \url{http://wortschatz.uni-leipzig.de/en/download/}
#' @references
#'   Remus, R., Quasthoff U., and Heyer, G. (2010).
#'   "\href{http://www.lrec-conf.org/proceedings/lrec2010/pdf/490_Paper.pdf}{SentiWS
#'   - a Publicly Available German-language Resource for Sentiment Analysis}."
#'   In \emph{Proceedings of the 7th International Language Ressources and
#'   Evaluation (LREC'10)}: 1168-1171.
#'
#' @keywords data
"data_dictionary_sentiws"

#' Affective Norms for English Words (AFINN)
#'
#' A \pkg{quanteda} \link[quanteda]{dictionary} object containing
#' the Affective Norms for English Words (AFINN), a publicly available list of
#' English words rated for valence with values between -5 (negative) and
#' +5 (positive). AFINN-111, the latest version, contains 2,477 words and phrases.
#' Note that the version implemented in \pkg{quanteda.dictionaries} uses a binary
#' classification into 878 positive (valence > 0) and 1,599 negative (valence < 0)
#' features.
#' @source \url{http://www2.imm.dtu.dk/pubdb/views/publication_details.php?id=6010}
#'
#' @references
#'   Nielsen, Finn Å. (2011). "\href{https://arxiv.org/abs/1103.2903}{A new ANEW:
#'   Evaluation of a Word List for Sentiment Analysis in Microblogs.}"
#'   In \emph{Proceedings of the ESWC2011 Workshop on 'Making Sense of Microposts':
#'   Big Things Come in Small Packages}: 93-98.
#'
#' @keywords data
"data_dictionary_AFINN"

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
#'   Frimer, Jeffrey et. al. (2017).  "Moral Foundations Dictionaries for
#'   Linguistic Analyses, 2.0."  University of Winnipeg manuscript.
#'   \url{http://www.jeremyfrimer.com/uploads/2/1/2/7/21278832/summary.pdf}.
#'
#'   Haidt, J., Graham, J., and Nosek, B.A. (2009). "Liberals and Conservatives
#'   Rely on Different Sets of Moral Foundations. \emph{Journal of Personality and Social
#'   Inquiry} 20(2-3): 110-119.
#'
#'   Graham, J., and Haidt, J. (2016). \href{http://moralfoundations.org/othermaterials}{Moral
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
#'   Laver. M., and Garry, J. (2000). "Estimating Policy Positions from Political Texts."
#'   \emph{American Journal of Political Science} 44(3): 619-634.
#' @keywords data
"data_dictionary_LaverGarry"

#' Rauh's German Political Sentiment Dictionary
#'
#' A \pkg{quanteda} \link[quanteda]{dictionary} object containing the
#' dictionaries provided in Rauh (forthcoming). Rauh assesses its performance
#' against human intuition of sentiment in German political language
#' (parliamentary speeches, party manifestos, and media coverage). The resource
#' builds on, harmonizes and extends the SentiWS (Remus et al. 2010) and
#' GermanPolarityClues (Waltinger 2010) dictionaries. In order to use the
#' negation correction provided by the dictionary, currently a combination of
#' \link[quanteda]{tokens_replace} and \link[quanteda]{tokens_compound} is
#' required to harmonize the five covered bi-gram patterns prior to scoring. The
#' example below shows how to conduct this transformation. Note that the process
#' changes the terms "nicht|nichts|kein|keine|keinen" to a joint term altering
#' some of the features of the original corpus.
#' @format The dictionary has four keys.
#' \describe{
#' \item{\code{negative}}{19,750 terms indicating negative sentiment}
#' \item{\code{positive}}{17,330 terms indicating positive sentiment}
#' \item{\code{neg_positive}}{17,330 terms indicating a positive word preceded
#' by a negation (used to convey negative sentiment)}
#' \item{\code{neg_negative}}{19,750 terms indicating a negative word preceded
#' by a negation (used to convey positive sentiment)}
#' }
#' @source \url{https://doi.org/10.7910/DVN/BKBXWD}
#' @references
#'   Rauh, C. (Forthcoming). "Validating a Sentiment Dictionary for German
#'   Political Language: A Workbench Note." \emph{Journal of Information
#'   Technology & Politics}.
#'
#'   Remus, R., Quasthoff U., and Heyer, G. (2010).
#'   "\href{http://www.lrec-conf.org/proceedings/lrec2010/pdf/490_Paper.pdf}{SentiWS
#'   - a Publicly Available German-language Resource for Sentiment Analysis.}"
#'   In \emph{Proceedings of the 7th International Language Ressources and
#'   Evaluation (LREC'10)}: 1168-1171.
#'
#'   Waltinger, U. (2010)
#'   "\href{http://www.ulliwaltinger.de/pdf/91_Paper.pdf}{GermanPolarityClues: A
#'   Lexical Resource for German Sentiment Analysis}." In \emph{International
#'   Conference on Language Resources and Evaluation}, 17-23 May 2010 LREC'10.
#' @examples
#' # tokenize example text
#' toks <- quanteda::tokens("nicht schlecht dieses wunderschöne Wörterbuch")
#' # replace negation markers with "not"
#' toks1 <- quanteda::tokens_replace(toks, pattern = c("nicht", "nichts", "kein",
#'                                                     "keine", "keinen"),
#'                                   replacement = rep("not", 5))
#' # compound bi-gram negation patterns
#' toks2 <- quanteda::tokens_compound(toks1, data_dictionary_Rauh, concatenator = " ")
#'
#' # apply dictionary
#' quanteda::dfm(toks2, dictionary = data_dictionary_Rauh)
#' @keywords data
"data_dictionary_Rauh"

#' Loughran and McDonald Sentiment Word Lists
#'
#' A \pkg{quanteda} \link[quanteda]{dictionary} object containing
#' the 2014 version of the Loughran and McDonald Sentiment Word Lists. The
#' categories are "negative" (2355 features), "positive" (354), "uncertainty" (297), "litigious" (903),
#' "constraining" (184), "superfluous" (56), "interesting" (68), "modal words strong" (68)
#' and "modal words weak" (0).
#' @source \url{http://sraf.nd.edu/textual-analysis/resources/}
#' @references
#'   Loughran, T., and McDonald, B. (2011). "When is a
#'   Liability not a Liability? Textual Analysis, Dictionaries, and 10-Ks."
#'   \emph{Journal of Finance} 66(1): 35-65.
#' @keywords data
"data_dictionary_LoughranMcDonald"

#' Sample short documents for testing
#'
#' Some sample short documents in plain text format for testing
#'   with \code{\link{liwcalike}}.
#' @examples
#' liwcalike(data_char_testphrases)
"data_char_testphrases"

# save(testphrases, file = "data/testphrases.RData")
# writeLines(testphrases, "inst/extdata/testphrases.txt")
