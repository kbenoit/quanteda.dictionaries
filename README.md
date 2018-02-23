quanteda.dictionaries
================

[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/quanteda.dictionaries)](https://cran.r-project.org/package=quanteda.dictionaries)
[![Travis-CI Build
Status](https://travis-ci.org/kbenoit/quanteda.dictionaries.svg?branch=master)](https://travis-ci.org/kbenoit/quanteda.dictionaries)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/kbenoit/quanteda.dictionaries?branch=master&svg=true)](https://ci.appveyor.com/project/kbenoit/quanteda.dictionaries)
[![Coverage
Status](https://img.shields.io/codecov/c/github/kbenoit/quanteda.dictionaries/master.svg)](https://codecov.io/github/kbenoit/quanteda.dictionaries?branch=master)

An R package consisting of dictionaries for text analysis and associated
utilities. Designed to be used with [**quanteda**](http://quanteda.io)
but can be used more generally with any text analytic package (e.g.
**tidytext**, **tm**, etc.).

## Installing

``` r
# the devtools package needs to be installed for this to work
devtools::install_github("kbenoit/quanteda.dictionaries") 
```

## Demonstration

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

We can see the difference that this makes when converting the texts to a
document-feature matrix:

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

## Formats

### Current

  - quanteda

### Planned

  - `as.yaml()`  
  - `as.list()`  
  - `c.dictionary()`
  - `data.frame` in long format with `word` and `sentiment` columns to
    use dictionaries in
    **tidytext**

## Future development plans

### Adding more dictionaries

  - [AFINN](http://www2.imm.dtu.dk/pubdb/views/publication_details.php?id=6010)

  - [Affective Norms for English Words
    (ANEW)](http://csea.phhp.ufl.edu/media/anewmessage.html)

  - [vaderSentiment](https://github.com/cjhutto/vaderSentiment)

  - [Other dictionaries at the Provalis
    page](https://provalisresearch.com/products/content-analysis-software/wordstat-dictionary/)

  - [Moral Foundations
    Dictionary](http://www.moralfoundations.org/othermaterials)

  - [Loughran and McDonald Financial
    Sentiment](http://www3.nd.edu/~mcdonald/Word_Lists.html) See also
    [here](http://sraf.nd.edu/textual-analysis/resources/).

  - [SentiWS Sentiment Dictionary
    (German)](http://wortschatz.uni-leipzig.de/en/download/)

### Copyright information

Probably need to list the (c) from each dictionary here.

### Multi-lingual support

Some dictionaries are available in multiple languages - the package
should have a way to retrieve that. Maybe a `summary()` method for the
dictionaries that indicates the languages available?

## Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.
