FROM ubuntu:18.04
MAINTAINER Smart Insider <smartyinsider@gmail.com>

RUN apt-get update --yes && apt-get install --yes \
        build-essential libtool autotools-dev autoconf pkg-config libssl1.0-dev libboost-all-dev libevent-dev wget \
        software-properties-common && \
    add-apt-repository --yes ppa:bitcoin/bitcoin && \
        apt-get update

RUN apt-get install --yes libdb4.8-dev libdb4.8++-dev \
            libminiupnpc-dev libzmq3-dev && \
    apt-get clean && \
    rm -rf /var/lib/ap/lists/*

WORKDIR /usr/local/bin

COPY mn_entry.sh /usr/local/bin

ENV masternodeprivkey=xxxxxxxxxxxxxxxxxx
ENV ip=x.x.x.x
ENV coin=the_coin_name

ENTRYPOINT ./mn_entry.sh ${coin} ${masternodeprivkey} ${ip}























