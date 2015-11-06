wifi.setmode(wifi.STATION)

wifi.sta.config("SSID", "PASSWORD") 
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
_G["relay"][1] = false
for i=2, 8 do
  _G["relay"][i] = true
end

_G["temp"] = -1
_G["humi"] = -1

_G["light"] = "N/A"

-- Load applications
dofile("lcd.lua")
dofile("sensors.lua")
dofile("webinterface.lua")
--dofile("relays.lua")

