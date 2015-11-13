local M = {}

function M.setRelayStatus()

file.open("app.settings", "w")
file.writeline(
  tostring(_G["relay"][1]["state"]) .. ":" .. 
  tostring(_G["relay"][2]["state"]) .. ":" .. 
  tostring(_G["relay"][3]["state"]) .. ":" .. 
  tostring(_G["relay"][4]["state"])
  )
file.close()

end


function M.getRelayStatus()

file.open("app.settings", "r")
local a, b, c, d = file.readline():match("([^:]+):([^:]+):([^:]+):([^:]+)")
file.close()
print(a)
print(b)
print(c)
print(d)
if a == "true" then
  _G["relay"][1]["state"] = true
else
  _G["relay"][1]["state"] = false
end

if b == "true" then
  _G["relay"][2]["state"] = true
else
  _G["relay"][2]["state"] = false
end

if c == "true" then
  _G["relay"][3]["state"] = true
else
  _G["relay"][3]["state"] = false
end

if d == "true" then
  _G["relay"][4]["state"] = true
else
  _G["relay"][4]["state"] = false
end



setRelay(_G["relay"][1]["pin"], _G["relay"][1]["state"])
setRelay(_G["relay"][2]["pin"], _G["relay"][2]["state"])
setRelay(_G["relay"][3]["pin"], _G["relay"][3]["state"])
setRelay(_G["relay"][4]["pin"], _G["relay"][4]["state"])
end

function setRelay(pin, status)
  if status == true then
    gpio.write(pin, gpio.HIGH)
  else
    gpio.write(pin, gpio.LOW)
  end
end
return M