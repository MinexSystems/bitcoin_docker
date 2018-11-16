FROM ubuntu:14.04
RUN apt update
RUN apt --yes install software-properties-common
RUN add-apt-repository ppa:bitcoin/bitcoin
RUN apt update

RUN apt --yes install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3 libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-test-dev libboost-thread-dev

RUN apt --yes install libdb4.8-dev libdb4.8++-dev

RUN apt --yes install gcc-multilib g++-multilib

WORKDIR /home/project
ADD ./endpoint.sh /endpoint.sh
RUN chmod 755 /endpoint.sh

RUN mkdir /.ccache/
RUN mkdir /.ccache/tmp
RUN chmod -R 0777 /.ccache/

CMD /endpoint.sh