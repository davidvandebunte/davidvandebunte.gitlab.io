#/usr/bin/env Rscript

# Setup up CRAN mirror io install packages.
options(repos = list(CRAN="http://cran.rstudio.com/"))
install.packages(
    c('ape', 'cmdstanr', 'coda', 'dagitty', 'devtools', 'ellipse', 'loo', 'mvtnorm', 'shape', 'styler'),
    repos = c("https://mc-stan.org/r-packages/", getOption("repos"))
)
