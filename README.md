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
devtools::install_github("quanteda/quanteda") 
```

## Formats

### Current

  - quanteda

### Planned

  - `as.yaml()`  
  - `as.list()`  
  - `c.dictionary()`
  - something to convert to the **tidytext** dictionary
    format

## Future development plans

### Adding more dictionaries

  - [AFINN](http://www2.imm.dtu.dk/pubdb/views/publication_details.php?id=6010)

  - [NRC Word-Emotion Association Lexicon, also called
    EmoLex](http://saifmohammad.com/WebPages/lexicons.html)

  - [Affective Norms for English Words
    (ANEW)](http://csea.phhp.ufl.edu/media/anewmessage.html)

  - [vaderSentiment](https://github.com/cjhutto/vaderSentiment)

  - [Bing and
    Liu](https://www.cs.uic.edu/~liub/FBS/sentiment-analysis.html)

  - [Other dictionaries at the Provalis
    page](https://provalisresearch.com/products/content-analysis-software/wordstat-dictionary/)

  - [Moral Foundations
    Dictionary](http://www.moralfoundations.org/othermaterials)

  - [Regressive Imagery
    Dictionary](http://www.kovcomp.co.uk/wordstat/RID.html)

  - [Loughran and McDonald Financial
    Sentiment](http://www3.nd.edu/~mcdonald/Word_Lists.html) See also
    [here](http://sraf.nd.edu/textual-analysis/resources/).

  - [Harvard IV-4
    dictionaries](http://www.wjh.harvard.edu/~inquirer/homecat.htm)

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
