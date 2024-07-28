FROM debian:latest

RUN apt-get -y update
RUN apt-get -y install curl libx11-6 libice6 libsm6 libfontconfig1

ARG TARGETPLATFORM
RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then ARCHITECTURE=x64; elif [ "$TARGETPLATFORM" = "linux/arm/v7" ]; then ARCHITECTURE=arm; elif [ "$TARGETPLATFORM" = "linux/arm64" ]; then ARCHITECTURE=arm64; else ARCHITECTURE=x64; fi \
    && curl -sS -L -O --output-dir /tmp/ "https://www.sparksdr.com/download/SparkSDR.2.0.33.linux-${ARCHITECTURE}.deb" \
    && apt-get -y install "/tmp/SparkSDR.2.0.33.linux-${ARCHITECTURE}.deb" 

#https://www.sparksdr.com/download/SparkSDR.2.0.33.linux-x64.deb

#/usr/local/bin/SparkSDR 
