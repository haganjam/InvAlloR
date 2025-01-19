#!/bin/sh
set -euo pipefail

R -q -e 'install.packages("languageserver", repos="https://cran.r-project.org/")'
R -q -e 'install.packages("devtools")'
R -q -e 'renv::restore()'
