-- Controller for the web interface

local M = {}

function M.execute(args)
  local buff = ""
  buff = buff .. '"result": "success",'
  buff = buff .. '"sensors": {"temperature": ' .. _G["temp"] .. ', "humidity": ' .. _G["humi"] .. ', "light": "' .. _G["light"] .. '"},'
  buff = buff .. '"relays": {"relay_1": ' .. tostring(_G["relay"][1]) .. ', "relay_2": ' .. tostring(_G["relay"][2]) .. ', "relay_3": ' .. tostring(_G["relay"][3]) .. ', '
  buff = buff .. '"relay_4": ' .. tostring(_G["relay"][4]) .. ',' 
  buff = buff .. '"relay_5": ' .. tostring(_G["relay"][5]) .. ',' 
  buff = buff .. '"relay_6": ' .. tostring(_G["relay"][6]) .. ',' 
  buff = buff .. '"relay_7": ' .. tostring(_G["relay"][7]) .. ',' 
  buff = buff .. '"relay_8": ' .. tostring(_G["relay"][8]) .. '}' 
        
  return buff
  
end

return M
