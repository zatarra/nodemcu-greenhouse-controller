# nodemcu-greenhouse-controller
A simple greenhouse controller based on nodemcu, a dht11, some relays and a light sensor


# How does it work?

The hardware requirements are:
- NodeMCU
- DHT11
- Digital light sensor
- 3v Relay Module with four relays


NodeMCU exposes several endpoints that can be used to retrieve information from the sensors and relays, e.g.: 

http://nodemcu/status

http://nodemcu/relays/status

http://nodemcu/relays/enable/1

http://nodemcu/relays/disable/3



