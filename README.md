quanteda.dictionaries
================

[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/quanteda.dictionaries)](https://cran.r-project.org/package=quanteda.dictionaries)
[![](https://img.shields.io/badge/devel%20version-0.22-royalblue.svg)](https://github.com/kbenoit/quanteda.dictionaries)
[![Travis-CI Build
Status](https://travis-ci.org/kbenoit/quanteda.dictionaries.svg?branch=master)](https://travis-ci.org/kbenoit/quanteda.dictionaries)
[![AppVeyor Build
status](https://ci.appveyor.com/api/projects/status/3uvg00bo4p7mr98s/branch/master?svg=true)](https://ci.appveyor.com/project/kbenoit/quanteda-dictionaries/branch/master)
[![Coverage
Status](https://img.shields.io/codecov/c/github/kbenoit/quanteda.dictionaries/master.svg)](https://codecov.io/github/kbenoit/quanteda.dictionaries?branch=master)

An R package consisting of dictionaries for text analysis and associated
utilities. Designed to be used with [**quanteda**](http://quanteda.io)
but can be used more generally with any text analytic package
(e.g. **tidytext**, **tm**, etc.).

## Installing

``` r
# the devtools package needs to be installed for this to work
devtools::install_github("kbenoit/quanteda.dictionaries") 
```

## Demonstration

With the `liwcalike()` function from the **quanteda.dictionaries**
package, you can easily analyze text corpora using exising or custom
dictionaries. Here we show how to apply the Lexicoder Sentiment
Dictionary (Young and Soroka 2012) to a corpus consting of 2000 movie
reviews (from the
[**quanteda.corpora**](https://github.com/quanteda/quanteda.corpora)
package).

``` r
library("quanteda.dictionaries")

# requires GitHub version of quanteda.textmodels
output_lsd <- liwcalike(quanteda.textmodels::data_corpus_moviereviews,
                        dictionary = data_dictionary_NRC)

head(output_lsd)
```

    ##           docname Segment       WPS  WC Sixltr   Dic anger anticipation disgust
    ## 1 cv000_29416.txt       1  94.11111 847  13.11 19.36  0.71         2.95    0.83
    ## 2 cv001_19502.txt       2 278.00000 278  10.79 24.46  3.24         3.24    2.16
    ## 3 cv002_17424.txt       3 186.33333 559  16.46 21.29  1.07         2.86    0.72
    ## 4 cv003_12683.txt       4 294.00000 588  16.84 22.96  1.36         3.06    1.19
    ## 5 cv004_12641.txt       5 435.50000 871  19.06 19.40  1.26         1.49    0.69
    ## 6 cv005_29357.txt       6 753.00000 753  18.33 27.49  3.32         1.59    2.39
    ##   fear  joy negative positive sadness surprise trust AllPunc Period Comma Colon
    ## 1 1.42 2.36     2.24     4.01    1.42     1.30  2.13   18.06   4.01  5.19  0.35
    ## 2 1.80 1.44     4.32     2.88    1.44     1.08  2.88   18.35   5.04  6.47  0.00
    ## 3 2.68 1.43     3.40     4.11    1.79     0.54  2.68   14.67   3.94  5.55  0.00
    ## 4 1.87 1.53     4.25     5.10    1.87     1.19  1.53   22.11   3.40  4.42  0.00
    ## 5 2.07 1.49     3.90     3.33    1.72     1.38  2.07   17.57   4.25  6.20  0.69
    ## 6 4.25 0.80     5.98     3.45    1.99     1.86  1.86   11.02   4.65  3.98  0.13
    ##   SemiC QMark Exclam Dash Quote Apostro Parenth OtherP
    ## 1  0.00  0.71   0.35 1.18  3.07    1.89       0  14.76
    ## 2  0.00  0.00   0.00 0.00  5.40    4.68       0  16.91
    ## 3  0.00  0.54   0.00 0.54  2.68    2.68       0  12.70
    ## 4  0.00  0.51   0.00 3.74  7.65    4.25       0  15.99
    ## 5  0.23  0.11   0.00 1.84  2.18    1.72       0  13.66
    ## 6  0.00  0.00   0.00 0.53  0.93    0.40       0   9.69

## Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.
