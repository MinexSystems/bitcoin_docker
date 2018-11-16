#!/usr/bin/env bash
docker build -t bit_coin_linux32 bitcoin_docker/.docker/linux32/

docker run --user $(id -u) -v $(pwd)/bitcoin/:/home/project/ bit_coin_linux32

mkdir -p $(pwd)/bitcoin_docker/out/bit_coin_linux32

cp -v bitcoin/installed/bitcoin-i686-pc-linux-gnu.tar.gz $(pwd)/bitcoin_docker/out/bit_coin_linux32/