quanteda.dictionaries
================

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/quanteda.dictionaries)](https://CRAN.R-project.org/package=quanteda.dictionaries)
[![Coverage
Status](https://img.shields.io/codecov/c/github/kbenoit/quanteda.dictionaries/master.svg)](https://codecov.io/github/kbenoit/quanteda.dictionaries?branch=master)
[![R-CMD-check](https://github.com/kbenoit/quanteda.dictionaries/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/kbenoit/quanteda.dictionaries/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

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
package, you can easily analyse text corpora using existing or custom
dictionaries. Here we show how to apply the Moral Foundations Dictionary
to the US Presidential Inaugural speech corpus distributed with
[**quanteda**](https://github.com/quanteda/quanteda).

``` r
library("quanteda")
library("quanteda.dictionaries")

output_lsd <- liwcalike(data_corpus_inaugural, dictionary = data_dictionary_MFD)

head(output_lsd)
```

    ##           docname Segment      WPS   WC Sixltr  Dic care.virtue care.vice
    ## 1 1789-Washington       1 66.91304 1539  24.37 4.42        0.58      0.06
    ## 2 1793-Washington       2 36.75000  147  25.17 5.44        0.00      0.00
    ## 3      1797-Adams       3 69.81081 2583  24.62 5.23        0.39      0.15
    ## 4  1801-Jefferson       4 47.09756 1931  20.40 4.40        0.62      0.26
    ## 5  1805-Jefferson       5 52.88889 2380  22.98 3.95        0.25      0.17
    ## 6    1809-Madison       6 60.23810 1265  24.82 4.90        0.32      0.16
    ##   fairness.virtue fairness.vice loyalty.virtue loyalty.vice authority.virtue
    ## 1            0.39          0.19           1.23         0.00             1.04
    ## 2            0.00          0.00           2.04         0.00             3.40
    ## 3            0.81          0.08           1.47         0.12             1.32
    ## 4            1.04          0.05           0.93         0.00             0.73
    ## 5            0.84          0.08           1.01         0.04             1.13
    ## 6            0.95          0.08           1.50         0.00             1.19
    ##   authority.vice sanctity.virtue sanctity.vice AllPunc Period Comma Colon SemiC
    ## 1           0.00            0.84          0.06    7.02   1.49  4.55  0.06  0.52
    ## 2           0.00            0.00          0.00    8.16   2.72  3.40  0.68  0.00
    ## 3           0.08            0.66          0.15   10.18   1.28  7.78  0.00  0.70
    ## 4           0.00            0.78          0.00   10.51   1.92  6.63  0.05  1.19
    ## 5           0.00            0.42          0.00    9.08   1.72  5.97  0.00  1.09
    ## 6           0.00            0.55          0.16    6.96   1.66  3.72  0.00  1.26
    ##   QMark Exclam Dash Quote Apostro Parenth OtherP
    ## 1  0.00      0 0.13  0.13    0.00    0.06   6.76
    ## 2  0.00      0 0.00  0.00    0.00    0.68   6.80
    ## 3  0.15      0 0.15  0.04    0.04    0.04   9.95
    ## 4  0.21      0 0.41  0.10    0.10    0.00  10.10
    ## 5  0.17      0 0.04  0.08    0.08    0.00   9.03
    ## 6  0.00      0 0.32  0.00    0.00    0.00   6.64

## More dictionaries

More dictionaries are supplied with the
[**quanteda.sentiment**](https://github.com/quanteda/quanteda.sentiment)
package.

## Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](https://github.com/kbenoit/quanteda.dictionaries/blob/master/CONDUCT.md).
By participating in this project you agree to abide by its terms.
