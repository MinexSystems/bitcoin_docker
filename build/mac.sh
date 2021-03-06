#!/usr/bin/env bash
docker build -t bit_coin_mac bitcoin_docker/.docker/mac/

docker run --user $(id -u) -v $(pwd)/bitcoin/:/home/project/ bit_coin_mac /endpoint.sh

mkdir $(pwd)/bitcoin_docker/out/bit_coin_mac

cp -v bitcoin/MinexWallet.dmg $(pwd)/bitcoin_docker/out/bit_coin_mac/
cp -v bitcoin/installed/bitcoin-x86_64-apple-darwin11.tar.gz $(pwd)/bitcoin_docker/out/bit_coin_mac/