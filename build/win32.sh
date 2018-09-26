#!/usr/bin/env bash
docker build -t minex_coin_win32 bitcoin_docker/.docker/win32/

docker run --user $(id -u) -v $(pwd)/bitcoin/:/home/project/ minex_coin_win32 /endpoint.sh

mkdir -p $(pwd)/bitcoin_docker/out/minex_coin_win32

cp -v bitcoin/installed/i686-w64-mingw32/i686-w64-mingw32.zip $(pwd)/bitcoin_docker/out/minex_coin_win32/
cp -v bitcoin/installed/bitcoin-1.3.1-win32-setup-unsigned.exe $(pwd)/bitcoin_docker/out/minex_coin_win32/
