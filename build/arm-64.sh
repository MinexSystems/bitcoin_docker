#!/usr/bin/env bash
docker build -t minex_coin_arm64 bitcoin_docker/.docker/arm64/

docker run --user $(id -u) -v $(pwd)/bitcoin/:/home/project/ minex_coin_arm64 /endpoint.sh

mkdir $(pwd)/bitcoin_docker/out/minex_coin_arm64

cp  -v bitcoin/installed/bitcoin-aarch64-linux-gnu.tar.gz $(pwd)/bitcoin_docker/out/minex_coin_arm64/
