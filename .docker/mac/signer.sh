#!/usr/bin/env bash

BUILD_DIR="/home/project"
HOSTS="x86_64-apple-darwin11"
WRAP_DIR=${BUILD_DIR}/wrapped
INSTALL_PATH=${BUILD_DIR}/install/${HOSTS}

export PATH=`pwd`:$PATH
FAKETIME_PROGS="dmg genisoimage"

# Create global faketime wrappers
for prog in ${FAKETIME_PROGS}; do
    echo '#!/bin/bash' > ${WRAP_DIR}/${prog}
    echo "REAL=\`which -a ${prog} | grep -v ${WRAP_DIR}/${prog} | head -1\`" >> ${WRAP_DIR}/${prog}
    echo 'export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/faketime/libfaketime.so.1' >> ${WRAP_DIR}/${prog}
    echo "export FAKETIME=\"${REFERENCE_DATETIME}\"" >> ${WRAP_DIR}/${prog}
    echo "\$REAL \$@" >> $WRAP_DIR/${prog}
    chmod +x ${WRAP_DIR}/${prog}
done

UNSIGNED=bitcoin-osx-unsigned.tar.gz
SIGNED=bitcoin-osx-signed.dmg

tar -xf ${UNSIGNED}
OSX_VOLNAME="$(cat osx_volname)"
./detached-sig-apply.sh ${UNSIGNED} signature/osx
${WRAP_DIR}/genisoimage -no-cache-inodes -D -l -probe -V "${OSX_VOLNAME}" -no-pad -r -dir-mode 0755 -apple -o uncompressed.dmg signed-app
${WRAP_DIR}/dmg dmg uncompressed.dmg ${OUTDIR}/${SIGNED}