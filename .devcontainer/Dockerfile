FROM blacksnowflake/r-base-dev:4.4.2@sha256:cfc683060a3de236d742df688e373d96d415ebb3a7bb756039734ba7b1f27295

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