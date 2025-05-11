#FROM blacksnowflake/r-base-dev:4.5.0@sha256:60a57d638a49c07763ed9e5b1f7f196b87cd67747d800ff777485985842b4b58 as builder
FROM rocker/r-ver:4.5.0@sha256:abc186e22ef825ca8dd24dca60b50bff06ffc9578908f2963558f0a8562bf451 as builder

RUN apt update \
    && apt install -y --no-install-recommends \
        wget \
    && :

RUN wget https://github.com/gnames/gnparser/releases/download/v1.11.6/gnparser-v1.11.6-linux-x86.tar.gz \
    && tar xvf gnparser-v1.11.6-linux-x86.tar.gz

#FROM blacksnowflake/r-base-dev:4.5.0@sha256:60a57d638a49c07763ed9e5b1f7f196b87cd67747d800ff777485985842b4b58
FROM rocker/r-ver:4.5.0@sha256:abc186e22ef825ca8dd24dca60b50bff06ffc9578908f2963558f0a8562bf451

# gdal required for terra (raster)
# libudunits2-dev for bdc (units)
# libuv1-dev for httpuv
RUN apt update \
    && apt install -y --no-install-recommends \
        libgdal-dev \
        gdal-bin \
        libudunits2-dev \
        cmake \
        pandoc \
        libuv1-dev \
        git \
        xz-utils \
        r-base \
        libfontconfig1-dev \
        libharfbuzz-dev \
        libfribidi-dev \
        libfreetype6-dev \
    && :

COPY --from=builder gnparser /usr/local/bin/

WORKDIR /invallor

COPY . .
