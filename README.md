quanteda.dictionaries
================

[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/quanteda.dictionaries)](https://cran.r-project.org/package=quanteda.dictionaries) [![Travis-CI Build Status](https://travis-ci.org/kbenoit/quanteda.dictionaries.svg?branch=master)](https://travis-ci.org/kbenoit/quanteda.dictionaries) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/kbenoit/quanteda.dictionaries?branch=master&svg=true)](https://ci.appveyor.com/project/kbenoit/quanteda.dictionaries) [![Coverage Status](https://img.shields.io/codecov/c/github/kbenoit/quanteda.dictionaries/master.svg)](https://codecov.io/github/kbenoit/quanteda.dictionaries?branch=master)

An R package consisting of dictionaries for text analysis and associated utilities. Designed to be used with [**quanteda**](http://quanteda.io) but can be used more generally with any text analytic package (e.g. **tidytext**, **tm**, etc.).

Installing
----------

``` r
# the devtools package needs to be installed for this to work
devtools::install_github("kbenoit/quanteda.dictionaries") 
```

Demonstration
-------------

### 1. Apply Dictionaries to a Corpus

With the `liwcalike()` function from the **quanteda.dictionaries** package, you can easily analyze text corpora using exising or custom dictionaries. Here we show how to apply the Lexicoder Sentiment Dictionary (Young and Soroka 2012) to a corpus consting of 2000 movie reviews (from the **quanteda.corpora** package).

``` r
library(quanteda)
```

    ## Package version: 1.0.7

    ## Parallel computing: 3 of 4 threads used.

    ## See https://quanteda.io for tutorials and examples.

    ## 
    ## Attaching package: 'quanteda'

    ## The following object is masked from 'package:utils':
    ## 
    ##     View

``` r
library(quanteda.dictionaries)
library(quanteda.corpora)

output_lsd <- liwcalike(quanteda.corpora::data_corpus_movies, data_dictionary_LSD2015)
```

    ## Warning in nsentence.character(x): nsentence() does not correctly count
    ## sentences in all lower-cased text

``` r
head(output_lsd)
```

    ##           docname Segment  WC    WPS.document WPS.meanSentenceLength
    ## 1 neg_cv000_29416       1 847 neg_cv000_29416               78.88889
    ## 2 neg_cv001_19502       2 278 neg_cv001_19502              240.00000
    ## 3 neg_cv002_17424       3 559 neg_cv002_17424              162.66667
    ## 4 neg_cv003_12683       4 594 neg_cv003_12683              239.50000
    ## 5 neg_cv004_12641       5 872 neg_cv004_12641              366.50000
    ## 6 neg_cv005_29357       6 753 neg_cv005_29357              671.00000
    ##   Sixltr    Dic negative positive neg_positive neg_negative AllPunc Period
    ## 1 13.105  6.974   4.3684    2.597      0.00000      0.00000  18.064  4.014
    ## 2 10.791  7.194   4.6763    2.518      0.00000      0.00000  18.345  5.036
    ## 3 16.458  6.452   3.2200    3.220      0.17889      0.00000  14.669  3.936
    ## 4 16.667 10.606   6.5657    4.040      0.00000      0.00000  22.896  3.367
    ## 5 19.037  7.003   3.7844    3.211      0.11468      0.00000  17.661  4.243
    ## 6 18.327 12.085   8.8977    3.187      0.00000      0.00000  11.023  4.648
    ##    Comma   Colon   SemiC   QMark  Exclam   Dash  Quote Apostro Parenth
    ## 1 5.1948 0.35419 0.00000 0.70838 0.35419 1.1806 3.0697  1.8890       0
    ## 2 6.4748 0.00000 0.00000 0.00000 0.00000 0.0000 5.3957  4.6763       0
    ## 3 5.5456 0.00000 0.00000 0.53667 0.00000 0.5367 2.6834  2.6834       0
    ## 4 4.3771 0.00000 0.00000 0.50505 0.00000 4.7138 7.5758  4.2088       0
    ## 5 6.1927 0.68807 0.22936 0.11468 0.00000 1.9495 2.1789  1.7202       0
    ## 6 3.9841 0.13280 0.00000 0.00000 0.00000 0.5312 0.9296  0.3984       0
    ##   OtherP
    ## 1 14.758
    ## 2 16.906
    ## 3 12.701
    ## 4 15.825
    ## 5 13.647
    ## 6  9.695

### 2. Homogeni\[zs\]e British and US English

``` r
library("quanteda.dictionaries")

txt <- c(uk = "endeavour to prioritise honour over esthetics",
         us = "endeavor to prioritize honor over aesthetics")
toks <- quanteda::tokens(txt)

# homogenize to US English
quanteda::tokens_replace(toks, data_dictionary_uk2us)
```

    ## tokens from 2 documents.
    ## uk :
    ## [1] "endeavor"   "to"         "prioritize" "honor"      "over"      
    ## [6] "esthetics" 
    ## 
    ## us :
    ## [1] "endeavor"   "to"         "prioritize" "honor"      "over"      
    ## [6] "esthetics"

``` r
# homogenise to British English
quanteda::tokens_replace(toks, data_dictionary_us2uk)
```

    ## tokens from 2 documents.
    ## uk :
    ## [1] "endeavour"  "to"         "prioritise" "honour"     "over"      
    ## [6] "aesthetics"
    ## 
    ## us :
    ## [1] "endeavour"  "to"         "prioritise" "honour"     "over"      
    ## [6] "aesthetics"

We can see the difference that this makes when converting the texts to a document-feature matrix:

``` r
# original dfm
quanteda::dfm(toks)
```

    ## Document-feature matrix of: 2 documents, 10 features (40% sparse).
    ## 2 x 10 sparse Matrix of class "dfm"
    ##     features
    ## docs endeavour to prioritise honour over esthetics endeavor prioritize
    ##   uk         1  1          1      1    1         1        0          0
    ##   us         0  1          0      0    1         0        1          1
    ##     features
    ## docs honor aesthetics
    ##   uk     0          0
    ##   us     1          1

``` r
# homogeni[zs]ed dfm
quanteda::dfm(quanteda::tokens_replace(toks, data_dictionary_uk2us))
```

    ## Document-feature matrix of: 2 documents, 6 features (0% sparse).
    ## 2 x 6 sparse Matrix of class "dfm"
    ##     features
    ## docs endeavor to prioritize honor over esthetics
    ##   uk        1  1          1     1    1         1
    ##   us        1  1          1     1    1         1

Formats
-------

### Current

-   quanteda

### Planned

-   `as.yaml()`
-   `as.list()`
-   `c.dictionary()`
-   `data.frame` in long format with `word` and `sentiment` columns to use dictionaries in **tidytext**

Future development plans
------------------------

### Adding more dictionaries

-   [AFINN](http://www2.imm.dtu.dk/pubdb/views/publication_details.php?id=6010)

-   [Affective Norms for English Words (ANEW)](http://csea.phhp.ufl.edu/media/anewmessage.html)

-   [vaderSentiment](https://github.com/cjhutto/vaderSentiment)

-   [Other dictionaries at the Provalis page](https://provalisresearch.com/products/content-analysis-software/wordstat-dictionary/)

-   [Moral Foundations Dictionary](http://www.moralfoundations.org/othermaterials)

-   [Loughran and McDonald Financial Sentiment](http://www3.nd.edu/~mcdonald/Word_Lists.html) See also [here](http://sraf.nd.edu/textual-analysis/resources/).

-   [SentiWS Sentiment Dictionary (German)](http://wortschatz.uni-leipzig.de/en/download/)

### Copyright information

Probably need to list the (c) from each dictionary here.

### Multi-lingual support

Some dictionaries are available in multiple languages - the package should have a way to retrieve that. Maybe a `summary()` method for the dictionaries that indicates the languages available?

Code of Conduct
---------------

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
