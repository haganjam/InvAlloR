# InvAlloR
Pipeline to assign body length-dry biomass allometry equations and other functional traits to a taxonomic name based on taxonomic hierarchy in freshwater invertebrates. 

> [!WARNING]
> 
> WIP

## Installation

You can try to install it from GitHub, but as it's a WIP, it 
[may or may not work](https://github.com/haganjam/InvAlloR/issues/27)
depending on the tides, temperature, the color of your socks and what
you had for dinner the day before yesterday.

To date, we transitively depend on [terra](https://github.com/rspatial/terra),
which may require additional installation steps (GDAL) on your OS. Please see the corresponding
install section of their README first.

Now, if you feel lucky, try:

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
