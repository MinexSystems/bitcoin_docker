#!/usr/bin/env bash
cd /home/project/
MAKEOPTS="-j `nproc --all`"
HOSTS="i686-pc-linux-gnu"
INSTALLPATH=`pwd`/installed/${HOSTS}


set +e
make HOST=${HOSTS} -C `pwd`/depends ${MAKEOPTS} || error=true

if [ ${error} ]
then
    exit 1
fi
./autogen.sh
CONFIG_SITE=$PWD/depends/${HOSTS}/share/config.site ./configure --prefix=/ --disable-ccache --disable-maintainer-mode --disable-dependency-tracking

make clean
find . -type f -name '*.o' -delete

make ${MAKEOPTS} all
make ${MAKEOPTS} -C src check-security

mkdir -p ${INSTALLPATH}
make install DESTDIR=${INSTALLPATH}
cd installed
find . -name "lib*.la" -delete
find . -name "lib*.a" -delete

tar -czvf bitcoin-${HOSTS}.tar.gz -C ${INSTALLPATH} .