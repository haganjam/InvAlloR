FROM blacksnowflake/r-base-dev:4.4.3@sha256:d86743616c9c39d723906f808bfab6f4f3ba09e28a37d91a06db55ac42716e12 as builder

RUN wget https://github.com/gnames/gnparser/releases/download/v1.11.6/gnparser-v1.11.6-linux-x86.tar.gz \
    && tar xvf gnparser-v1.11.6-linux-x86.tar.gz \
    && mv gnparser /usr/local/bin/

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

COPY --from=builder gnparser /usr/local/bin/

WORKDIR /invallor

COPY . .
