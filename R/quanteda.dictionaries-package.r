#' An R package consisting of dictionaries for text analysis and associated utilities
#'
#' Provides text analysis dictionaries and additional functionality for their
#' use in text analysis frameworks, especially \pkg{quanteda}. 
#' 
#' The package contains several dictionaries that capture positive and negative sentiment, and 
#' other types of emotions. Moreover, the package contains word lists of words spelled differently in 
#' British and American English. These lists can be used to adjust text corpora and avoid 
#' double-counting the same word with different spellings in the same corpus. 
#' 
#' The second main purpose of \pkg{quanteda.dictionaries} is the function \link{liwcalike}. It allows 
#' analyzing text corpora in a LIWC-alike fashion. LIWC (Linguistic Inquiry and Word Count) is a 
#' standalone software distributed at http://liwc.wpengine.com. \link{liwcalike} takes a \pkg{quanteda} 
#' \link[quanteda]{corpus} as an input and allows to easily apply dictionaries to the text corpus. 
#' The output returns a data.frame consisting of percentages and other quantities, as well as the count 
#' of all dictionary categories in each document.
#' 
#' @section Source code and additional information:
#' 
#' \url{http://github.com/kbenoit/quanteda.dictionaries}
#' @name quanteda.dictionaries
#' @docType package
NULL
