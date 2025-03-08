FROM blacksnowflake/r-base-dev:4.4.3@sha256:d86743616c9c39d723906f808bfab6f4f3ba09e28a37d91a06db55ac42716e12

# gdal required for terra (raster)
# libudunits2-dev for bdc (units)
RUN apt update \
    && apt install -y --no-install-recommends \
        libgdal-dev \
        libudunits2-dev \
        cmake \
        pandoc \
    && :

WORKDIR /invertr

COPY . .