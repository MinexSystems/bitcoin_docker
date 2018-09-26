#!/usr/bin/env bash

docker build -t minex_coin_win64 bitcoin_docker/.docker/win64/

docker run --user $(id -u) -v $(pwd)/bitcoin/:/home/project/ minex_coin_win64

mkdir -p $(pwd)/bitcoin_docker/out/minex_coin_win64

cp -v bitcoin/installed/x86_64-w64-mingw32/x86_64-w64-mingw32.zip $(pwd)/bitcoin_docker/out/minex_coin_win64/
cp -v bitcoin/installed/bitcoin-1.3.1-win64-setup-unsigned.exe $(pwd)/bitcoin_docker/out/minex_coin_win64/