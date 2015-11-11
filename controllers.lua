-- Controller for the web interface

local M = {}

function M.execute(args)

  local controller = args:match("([^/]+)/?")
  local action     = args:match("[^/]+/([^/]+)/?")
  local value      = args:match("[^/]+/[^/]+/([^/]+)")
  
  
  print(controller)
  print(action)
  print(value)
  
  local buff = ""
  
  if controller == nil or controller == "status" then
    buff = buff .. '"result": "success",'
    buff = buff .. '"sensors": {"temperature": ' .. _G["temp"] .. ', "humidity": ' .. _G["humi"] .. ', "light": "' .. _G["light"] .. '"},'
    buff = buff .. '"relays": '
    buff = buff .. '{'
    buff = buff .. '"relay_1": ' .. tostring(_G["relay"][1]["state"]) .. ','
    buff = buff .. '"relay_2": ' .. tostring(_G["relay"][2]["state"]) .. ','
    buff = buff .. '"relay_3": ' .. tostring(_G["relay"][3]["state"]) .. ', '
    buff = buff .. '"relay_4": ' .. tostring(_G["relay"][4]["state"])
    buff = buff .. '}' 

  elseif controller == "relays" then
    value = tonumber(value)
    if action == "status" or action == nil then
      buff = buff .. '"relays": '
      buff = buff .. '{'
      buff = buff .. '"relay_1": ' .. tostring(_G["relay"][1]["state"]) .. ','
      buff = buff .. '"relay_2": ' .. tostring(_G["relay"][2]["state"]) .. ','
      buff = buff .. '"relay_3": ' .. tostring(_G["relay"][3]["state"]) .. ','
      buff = buff .. '"relay_4": ' .. tostring(_G["relay"][4]["state"]) 
      buff = buff .. '}'
      
    elseif action == "enable" then  
      if value == nil or ( value < 0 and value > 9 ) then
        buff = formatMessage("error", "Invalid relay number passed")
      else
        gpio.write(_G["relay"][value]["pin"], gpio.HIGH)
        _G["relay"][value]["state"] = true
        buff = formatMessage("success", "Relay #" .. value .. " enabled")
      end
    elseif action == "disable" then
      if value > 0 and value < 9 then
        gpio.write(_G["relay"][value]["pin"], gpio.LOW)
        _G["relay"][value]["state"] = false
        buff = formatMessage("success", "Relay #" .. value .. " disabled")
      end
    else
      buff = formatMessage("error", "Invalid relay action")
    end

  else
    buff = formatMessage("error", "Invalid call")
  end
   

        
  return buff

 
end

  function formatMessage(code, message)
    return '"result": "'.. code .. '", "message": "' .. message .. '"'
  end
  
return M
