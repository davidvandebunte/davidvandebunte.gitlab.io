#/usr/bin/env Rscript

# TODO: Pin R python versions. Because you're getting the latest versions of all packages but also
# pinning the version of the base datascience-notebook docker image, you're running into dependency
# issues. One possible approach:
# - https://ihrke.github.io/post/2015/09/24/conda/

# Setup up CRAN mirror io install packages.
options(repos = list(CRAN="http://cran.rstudio.com/"))
install.packages(
    c('ape', 'cmdstanr', 'coda', 'dagitty', 'devtools', 'ellipse', 'loo', 'mvtnorm', 'shape', 'styler'),
    repos = c("https://mc-stan.org/r-packages/", getOption("repos"))
)
