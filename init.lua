wifi.setmode(wifi.STATION)

wifi.sta.config("", "")

wifi.sta.autoconnect(1)
wifi.sta.connect()
tmr.delay(1000000)
wifi.sta.getip()
print(wifi.sta.status())


-- Setup relays and sensor pins

_G["dht_pin"] = 1
_G["light_pin"] = 2

_G["lcd_sda"] = 4
_G["lcd_scl"] = 5

-- The idea is to restore the state of relays from a file. For demo purposes I'll leave it like this for now...

_G["relay"] = {}
_G["relay"][1] = {}
_G["relay"][1]["state"] = false
_G["relay"][1]["pin"]   = 5

_G["relay"][2] = {}
_G["relay"][2]["state"] = false
_G["relay"][2]["pin"]   = 6

_G["relay"][3] = {}
_G["relay"][3]["state"] = false
_G["relay"][3]["pin"]   = 7

_G["relay"][4] = {}
_G["relay"][4]["state"] = false
_G["relay"][4]["pin"]   = 8

gpio.mode(5, gpio.OUTPUT)
gpio.mode(6, gpio.OUTPUT)
gpio.mode(7, gpio.OUTPUT)
gpio.mode(8, gpio.OUTPUT)

_G["temp"] = -1
_G["humi"] = -1

_G["light"] = "N/A"

-- Load applications
dofile("sensors.lua")
--dofile("lcd.lua")
dofile("webinterface.lua")

--dofile("relays.lua")

