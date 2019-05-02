#' Create a dictionary from a LIWC dictionary poster pdf
#'
#' Creates a \pkg{quanteda} dictionary from a LIWC dictionary output from the
#' LIWC software as a "dictionary poster" pdf.  Currently tested with LIWC 2015
#' v1.5.0, available for purchase from \url{http://liwc.wpengine.com/}.
#' The poster files can be output using Dictionary -> Export Internal
#' Dictionaries from the LIWC2015 application menu.
#'
#' Currently only works with the \code{LIWC2015 dictionary poster.pdf} file.
#'
#' This function requires that you have the xpdf utilities (which includes pdftotext) installed on your system.  These are available from
#' \url{https://www.xpdfreader.com/download.html}.  They can be installed for macOS using:
#'
#' \code{brew install xpdf}
#'
#' or for Linux using
#'
#' \code{sudo apt-get install xpdf}
#'
#' TO DO:
#' \itemize{
#' \item{either hard-wire the columns for the other three pdf files, or (better)
#' detect them from the category list's proximity to the columns}
#' }
#' @param file the filename of the LIWC dictionary poster pdf to be read
#' @return a \pkg{quanteda} \link[quanteda]{dictionary}
#' @export
#' @examples
#' \dontrun{
#' data_dictionary_liwc2015eng <- readliwc("~/Desktop/LIWC2015 dictionary poster.pdf")
#' names(data_dictionary_liwc2015eng)
#' data_dictionary_liwc2015eng["Assent"]
#' data_dictionary_liwc2015eng["Netspeak"]
#' }
readliwc <- function(file) {
    if (Sys.info()[["sysname"]] == "Darwin") {
        file <- stringi::stri_replace_all_fixed(file, " ", "\\ ")
    }
    if (Sys.info()[["sysname"]] == "Windows") {
        file <- shQuote(file)
    }
  
    # dict <- system2("pdftotext", args = c("-layout", "-r 600", "-nopgbrk", file, "-"), stdout = TRUE)
    check_for_pdftotext()
    dict <- system2("pdftotext", args = c("-table", "-nopgbrk", file, "-"), stdout = TRUE)
    # get category names
    cats <- as.character(tokens(dict[7]))

    # remove first eight lines
    dict <- dict[-c(1:7)]
    # remove blank lines
    dict <- dict[dict != ""]

    # get fixed column locations
    columns <- as.data.frame(stringi::stri_locate_all_regex(dict, "\\s{2}[\\w\\p{P}]")[[1]])
    colwidths <- c(columns$end, max(nchar(dict)) + 1) - c(1, columns$end)
    dicttable <- utils::read.fwf(textConnection(dict), widths = colwidths, stringsAsFactors = FALSE)

    colwidths <- c(4, rep(1, 14), 7, 5, 3, rep(1, 3), 10, rep(5, 2), 1, 2, 1, 5, rep(1, 4), 6,
                   2, rep(1, 2), 2, rep(1, 2), 3, rep(1, 3), 5, rep(2, 2), 1, 2, 8, rep(2, 2), 4, rep(1, 2),
                   rep(3, 2), 1, 7, 3, 3, 2, 3, 2, 1, 2, 2, 1, 3, 1, 2, rep(1, 3))

    liwclist <- wrapcols(dicttable, cats, colwidths)
    # remove spaces in words
    liwclist <- lapply(liwclist, stringi::stri_replace_all_fixed, " ", "")

    quanteda::dictionary(liwclist)
}

wrapcols <- function(input, keynames, colwidths) {
    stopifnot(length(keynames) == length(colwidths))
    tmp <- as.vector(as.matrix(input))
    tmp <- stringi::stri_trim_both(tmp)
    output <- split(tmp, rep(keynames, colwidths * nrow(input)))
    output <- lapply(output, function(x) x[x != "" & !is.na(x)])
    output
}

check_for_pdftotext <- function() {
    ver <- try(
        suppressWarnings(system2("pdftotext", args = "-v", stdout = TRUE, stderr = TRUE)),
        silent = TRUE
    )

    instructions <- switch(Sys.info()[["sysname"]],
                           Darwin = "brew install xpdf",
                           Windows = "https://www.xpdfreader.com/download.html",
                           Linux = "sudo apt-get install xpdf")

    pdftotext_msg <- attr(ver, "condition")$message
    if (!is.null(pdftotext_msg) && (pdftotext_msg == "error in running command" ||
                                    stri_detect_fixed(pdftotext_msg, "not found"))) {
        stop("pdftotext not installed; try: ", instructions)
    }

    versnumber <- as.numeric_version(unlist(strsplit(ver[1], " "))[3])
    if (versnumber < 4) {
        stop("pdftotext should be v4 or above (found ", versnumber, "); ", instructions)
    }
}
