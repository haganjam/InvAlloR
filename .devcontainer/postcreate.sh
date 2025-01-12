#!/bin/sh
set -euo pipefail

R -q -e 'install.packages("devtools")'
R -q -e 'renv::restore()'
