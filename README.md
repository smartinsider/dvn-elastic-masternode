# DOCKER FOR DIVINE.LIFE MASTERNODES

Supported coins:
- cryptoyen
- zefir
- happyleaf

### SETUP EXAMPLE:

```
  MN1:
    image: smartinsider/dvn-elastic-masternode:latest
    restart: unless-stopped
    environment:
      coin: "zefir"
      ip: "0.0.0.0"
      masternodeprivkey: "692332AY7F89c8434S2mr55Ht4kDQ8123wU55c7co79th1nEvXa"
    ports:    
      - "18001:5333"
```

In ports section make shure that port: 18001 is unique for your server, if not change it.
In environment section you need to change: coin, ip and masternodeprivkey
- coin - please look at Supported coin list 
- ip - your masternode server IP
- masternodeprivkey - please generate in your wallet


Also you can open docker-compose.yml file example here:
docker-compose.yml

