#!/usr/bin/env bash
docker build -t bit_coin_linux64 bitcoin_docker/.docker/linux64/

docker run  --user $(id -u) -v $(pwd)/bitcoin/:/home/project/ bit_coin_linux64

mkdir -p $(pwd)/bitcoin_docker/out/bit_coin_linux64

cp -v bitcoin/installed/bitcoin-x86_64-linux-gnu.tar.gz $(pwd)/bitcoin_docker/out/bit_coin_linux64/
