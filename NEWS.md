# quanteda.dictionaries 0.3.1

* Fixed a bug causing the number of parentheses to be incorrectly counted, when not all texts contained parentheses. (#36)

# quanteda.dictionaries 0.3

* Updated the dictionary objects for quanteda v3.
* Moved the sentiment-related dictionaries to **quanteda.sentiment**.
* Added `dictionary_edit()`, formerly in **quanteda** (but removed in v3).
* Fixed some tests that were breaking after the quanteda v3 release.

# quanteda.dictionaries 0.2

* Added a `NEWS.md` file to track changes to the package.  
* Fixed bug #14: word count failing when dictionaries are used.  
* Fixed bug #16: `liwcalike(x, ...)` not passing arguments to `tokens()`.  
* (v0.21) Updated the Moral Foundations Dictionary to 2.0.
* (v0.22) Fixed a problem caused by punctuation-only "texts" (#26)
