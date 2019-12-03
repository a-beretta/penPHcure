# Submission (v1.0.2)

## Solved issues

* Fixed array overrun in the compute_survival_cpp(...) function in src/cure.std.fit.cpp

* Fixed minor issue in R/penPHcure.initialize.R regarding the formula objects cureform and survform.

## Test environments 

* local: macOS (x86_64-apple-darwin19.0.0), 3.6.1 (2019-07-05)

* local: Linux Mint 19.2 (x86_64-pc-linux-gnu), R 3.6.1 (2019-07-05)

* win-builder: Windows (x86_64-w64-mingw32), 3.6.1 (2019-07-05)

* win-builder: Windows (x86_64-w64-mingw32), R-devel (2019-12-02 r77499)

## R CMD check results

In all environments: 0 errors | 0 warnings. 

Only in the following environments, few notes were produced:

* local: Linux Mint 19.2 (x86_64-pc-linux-gnu), R 3.6.1 (2019-07-05)

```
    * checking installed package size ... NOTE
      installed size is  9.2Mb
      sub-directories of 1Mb or more:
        libs   8.9Mb
```

* win-builder: Windows (x86_64-w64-mingw32), 3.6.1 (2019-07-05)

```
    * checking CRAN incoming feasibility ... NOTE
    Maintainer: 'Alessandro Beretta <a.beretta@uliege.be>'
```

* win-builder: Windows (x86_64-w64-mingw32), R-devel (2019-12-02 r77499)
```
    * checking CRAN incoming feasibility ... NOTE
    Maintainer: 'Alessandro Beretta <a.beretta@uliege.be>'
```

## Downstream dependencies

There are no downstream dependencies to be checked. 