#!/bin/bash



COIN_NAME="$1"
masternodeprivkey="$2"
ip=$3

DLINKHOST="https://download.divinelife.club/ubuntu18/${COIN_NAME}-light.tar.gz"
TARDAEMON=${COIN_NAME}-light.tar.gz



cd /usr/local/bin
wget -O ${TARDAEMON} ${DLINKHOST}/${TARDAEMON} && tar -xzf ${TARDAEMON} && rm ${TARDAEMON}
chmod 744 *


echo "COIN_NAME=$COIN_NAME"
echo "masternodeprivkey=$masternodeprivkey"
echo "ip=$ip"

cd /root/.${COIN_NAME}

confYen="${COIN_NAME}.conf"
port=5333

echo -e "\e[94m$(date +"%H:%M:%S %d/%m/%Y") Create ${confYen}\e[0m"
echo "rpcuser=mTr57v3kbj" >> $confYen
echo "rpcpassword=8p9I6mjzh5luYRuCDEBg1iGmy" >> $confYen
echo "addnode=seed1.divinelife.club" >> $confYen
echo "addnode=seed2.divinelife.club" >> $confYen
echo "addnode=seed3.divinelife.club" >> $confYen
echo "addnode=seed4.divinelife.club" >> $confYen
echo "addnode=seed5.divinelife.club" >> $confYen
echo "txindex=1" >> $confYen
echo "zefirstake=1" >> $confYen
echo "rpcallowip=127.0.0.1" >> $confYen
echo "rpcport=33001" >> $confYen
echo "server=1" >> $confYen
echo "daemon=0" >> $confYen
echo "port=${port}" >> $confYen
echo "masternodeprivkey=$masternodeprivkey" >> $confYen
echo "masternodeaddr=$ip" >> $confYen
echo "printtoconsole=1" >> $confYen
echo "masternode=1" >> $confYen
echo "bantime=50" >> $confYen
echo "maxconnections=256" >> $confYen

${COIN_NAME}d --printtoconsole
