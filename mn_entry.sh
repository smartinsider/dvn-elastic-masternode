#!/bin/bash



COIN_NAME="$1"
masternodeprivkey="$2"
ip=$3



DLINKHOST="https://builds.divinelife.club/ubuntu-"$COIN_NAME"/"
TARDAEMON=${COIN_NAME}-light.tar.gz

cd /usr/local/bin
wget -O ${TARDAEMON} ${DLINKHOST}/${TARDAEMON} && tar -xzf ${TARDAEMON} && rm ${TARDAEMON}
chmod 744 *

#INSTALL DIR FOLDER

echo "COIN_NAME=$COIN_NAME"
echo "masternodeprivkey=$masternodeprivkey"
echo "ip=$ip"


#echo -e "\e[1;1;31m$(date +"%H:%M:%S %d/%m/%Y") CLEAN $(pwd)\e[0m"
#rm *

command="start"
echo '#!/bin/bash' >> $command
echo "${COIN_NAME}d" >> $command
chmod 744 $command

command="stop"
echo '#!/bin/bash' >> $command
echo "${COIN_NAME}-cli stop" >> $command
chmod 744 $command

command="getblockcount"
echo '#!/bin/bash' >> $command
echo "${COIN_NAME}-cli getblockcount" >> $command
chmod 744 $command

command="getinfo"
echo '#!/bin/bash' >> $command
echo "${COIN_NAME}-cli getinfo" >> $command
chmod 744 $command

cd /root/.${COIN_NAME}

confYen="${COIN_NAME}.conf"
port=5333

echo -e "\e[94m$(date +"%H:%M:%S %d/%m/%Y") Create ${confYen}\e[0m"
echo "rpcuser=uP31BrSUVMSNz1I" >> $confYen
echo "rpcpassword=qu0T03CJuT9quKkuXDHx0hs2rDOM1C" >> $confYen
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
