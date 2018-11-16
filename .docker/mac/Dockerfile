FROM ubuntu:16.04
RUN apt update
RUN apt --yes install software-properties-common
RUN add-apt-repository ppa:bitcoin/bitcoin

RUN apt update && apt --yes install ca-certificates \
curl \
g++ \
git \
pkg-config \
autoconf \
librsvg2-bin \
libtiff-tools \
libtool \
automake \
faketime \
bsdmainutils \
cmake \
imagemagick \
libcap-dev \
libz-dev \
libbz2-dev \
python \
python-dev \
python-setuptools \
fonts-tuffy 

RUN apt --yes install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python

RUN apt --yes install cmake imagemagick libcap-dev librsvg2-bin libz-dev libbz2-dev libtiff-tools python-dev python-setuptools

RUN apt --yes install autoconf curl ccache faketime genisoimage


WORKDIR /home/project
ADD ./endpoint.sh /endpoint.sh
RUN chmod 755 /endpoint.sh

RUN mkdir /.ccache/
RUN mkdir /.ccache/tmp
RUN chmod -R 0777 /.ccache/

CMD /endpoint.sh