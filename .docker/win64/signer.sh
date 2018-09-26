#!/usr/bin/env bash
BUILD_DIR=`pwd`
SIGDIR=${BUILD_DIR}/signature/win
UNSIGNED_DIR=${BUILD_DIR}/unsigned

echo "f9a8cdb38b9c309326764ebc937cba1523a3a751a7ab05df3ecc99d18ae466c9  osslsigncode-1.7.1.tar.gz" | sha256sum -c
echo "a8c4e9cafba922f89de0df1f2152e7be286aba73f78505169bc351a7938dd911  osslsigncode-Backports-to-1.7.1.patch" | sha256sum -c

mkdir -p ${UNSIGNED_DIR}
tar -C ${UNSIGNED_DIR} -xf bitcoin-win-unsigned.tar.gz

tar xf osslsigncode-1.7.1.tar.gz
cd osslsigncode-1.7.1
patch -p1 < ${BUILD_DIR}/osslsigncode-Backports-to-1.7.1.patch

./configure --without-gsf --without-curl --disable-dependency-tracking
make
find ${UNSIGNED_DIR} -name "*-unsigned.exe" | while read i; do
    INFILE="`basename "${i}"`"
    OUTFILE="`echo "${INFILE}" | sed s/-unsigned//`"
    ./osslsigncode attach-signature -in "${i}" -out "${OUTDIR}/${OUTFILE}" -sigin "${SIGDIR}/${INFILE}.pem"
done
