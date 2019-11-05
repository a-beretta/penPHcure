# Resubmission

## Solved issues

* Title reduced to less than 65 characters;

* Added methodological references to the description field of the DESCRIPTION file;

* Added 'Copyright' field in the DESCRIPTION file. It is now clear and unambiguous that the copyright owner is University of Liège (Belgium);

* Removed `\dontrun{...}` from all examples. In the penPHcure() function, the examples have been wrapped inside `\donttest{...}` as they run in more than 100s. Despite that, most functions are now checked in other examples that run in under 5 seconds (see the `summary.PHcure` and `summary.penPHcure` methods).

## Test environments 

* local: macOS (x86_64-apple-darwin15.6.0), R 3.5.3, Apple LLVM 10.0.0

* r-hub: Linux Ubuntu 16.04 LTS (x86_64-pc-linux-gnu), R 3.6.1, GCC

* win-builder: Windows (x86_64-w64-mingw32), R 3.6.1

* r-hub: Linux Ubuntu 16.04 LTS (x86_64-pc-linux-gnu), R-devel (2019-11-03 r77361), GCC

* win-builder: Windows (x86_64-w64-mingw32), R-devel

## R CMD check results

In all environments: 0 errors | 0 warnings. 

Only in the following environments, few notes were produced:

* r-hub: Linux Ubuntu 16.04 LTS (x86_64-pc-linux-gnu), R 3.6.1, GCC

```
    * checking CRAN incoming feasibility ... NOTE
    Maintainer: 'Alessandro Beretta <a.beretta@uliege.be>'
   
    New submission
    
    Possibly mis-spelled words in DESCRIPTION:
      Hendry (16:498)
      Heuchenne (16:266)
      Sy (16:81)
    
    * checking installed package size ... NOTE
      installed size is  9.0Mb
      sub-directories of 1Mb or more:
        libs   8.8Mb
```

* win-builder: Windows (x86_64-w64-mingw32), R 3.6.1

```
    * checking CRAN incoming feasibility ... NOTE
    Maintainer: 'Alessandro Beretta <a.beretta@uliege.be>'
   
    New submission
    
    Possibly mis-spelled words in DESCRIPTION:
      Hendry (16:498)
      Heuchenne (16:266)
      Sy (16:81)
```

* r-hub: Linux Ubuntu 16.04 LTS (x86_64-pc-linux-gnu), R-devel (2019-11-03 r77361), GCC
```
    * checking CRAN incoming feasibility ... NOTE
    Maintainer: 'Alessandro Beretta <a.beretta@uliege.be>'
   
    New submission
    
    Possibly mis-spelled words in DESCRIPTION:
      Hendry (16:498)
      Heuchenne (16:266)
      Sy (16:81)
```

* win-builder: Windows (x86_64-w64-mingw32), R-devel

```
    * checking CRAN incoming feasibility ... NOTE
    Maintainer: 'Alessandro Beretta <a.beretta@uliege.be>'
    
    New submission
    
    Possibly mis-spelled words in DESCRIPTION:
      Hendry (16:498)
      Heuchenne (16:266)
      Sy (16:81)
```

The possibly mis-spelled words are correct.

## Downstream dependencies

There are no downstream dependencies to be checked. 