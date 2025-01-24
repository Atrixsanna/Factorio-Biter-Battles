# syntax=docker/dockerfile:1
FROM --platform=linux/amd64 ubuntu:latest

RUN apt-get update -y -qq &&  \
    apt-get install -y -qq wget xz-utils && \
    wget https://factorio.com/get-download/stable/headless/linux64 -q -O factorio_headless.tar.xz && \
    tar xvf factorio_headless.tar.xz -C / && \
    rm factorio_headless.tar.xz && \
    apt-get remove -y -qq --purge wget xz-utils

WORKDIR /factorio

COPY mod-list.json /factorio/mods/mod-list.json
COPY . /factorio/scenarios/Factorio-Biter-Battles

CMD ["bin/x64/factorio", "--start-server-load-scenario", "Factorio-Biter-Battles"]
EXPOSE 34197/udp
