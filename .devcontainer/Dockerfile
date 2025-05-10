FROM blacksnowflake/r-base-dev:4.5.0@sha256:60a57d638a49c07763ed9e5b1f7f196b87cd67747d800ff777485985842b4b58 as builder

RUN wget https://github.com/gnames/gnparser/releases/download/v1.11.6/gnparser-v1.11.6-linux-x86.tar.gz \
    && tar xvf gnparser-v1.11.6-linux-x86.tar.gz

FROM blacksnowflake/r-base-dev:4.5.0@sha256:60a57d638a49c07763ed9e5b1f7f196b87cd67747d800ff777485985842b4b58

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
