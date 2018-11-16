#!/usr/bin/env bash
docker build -t bit_coin_arm32 bitcoin_docker/.docker/arm32/

docker run --user $(id -u) -v $(pwd)/bitcoin/:/home/project/ bit_coin_arm32 /endpoint.sh

mkdir $(pwd)/bitcoin_docker/out/bit_coin_arm32

cp  -v bitcoin/installed/bitcoin-arm-linux-gnueabihf.tar.gz $(pwd)/bitcoin_docker/out/bit_coin_arm32/