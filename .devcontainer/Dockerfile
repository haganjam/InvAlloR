FROM blacksnowflake/r-base-dev:4.4.2@sha256:2c23ca1ebe251fdf3f53c1437539fa39b14665bc65a8656ce5ae746e499e2958

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