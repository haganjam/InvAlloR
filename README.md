# InvAlloR

Pipeline to assign body length-dry biomass allometry equations to a taxonomic name based
on taxonomic hierarchy in freshwater invertebrates. 

> [!WARNING]
> 
> WIP

## Installation

You can install InvAlloR from GitHub.

To date, we transitively depend on [terra](https://github.com/rspatial/terra),
which may require additional installation steps (GDAL) on your OS. Please see the corresponding
install section of their README first.

You may also need [GNparser](https://github.com/gnames/gnparser), which is a transitive dependency of
[bdc](https://brunobrr.github.io/bdc/).

You should follow the installation instructions [here](https://rdrr.io/github/brunobrr/bdc/f/vignettes/help/installing_gnparser.Rmd).

> We used GNparser [v1.11.6](https://github.com/gnames/gnparser/releases/tag/v1.11.6).

```shell
wget https://github.com/gnames/gnparser/releases/download/v1.11.6/gnparser-v1.11.6-linux-x86.tar.gz
tar xvf gnparser-v1.11.6-linux-x86.tar.gz
mv gnparser /usr/local/bin/
```

Now that you've installed `terra` and `GNparser` and if you feel lucky, try:

```r
install_github("haganjam/InvAlloR")
```

## Development

There's a [devcontainer](https://containers.dev/) setup included. If you use
VSC you should be prompted to open the project in a container automatically.

`devtools` are bundled with the devcontainer. Load `library(devtools)` and you
have `load_all()`, `test()` and `check()` ready at hand.

We use `renv` to provide reproducibility as far as it gets with R.
Use `renv::snapshot()` after changing dependencies, `renv::restore()` to install declared versions
of the dependencies and `renv::update()` to update to latest CRAN versions (before pushing to CRAN).
