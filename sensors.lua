function execute() 
  local status,temp,humi,temp_decimial,humi_decimial = dht.read11(1)
 
  if( status == dht.OK ) then
  
  -- Integer firmware using this example
  _G["temp"] = string.format(
      "%d.%1d", 
      math.floor(temp),
      temp_decimial%100)
  _G["humi"] = string.format("%d.%1d",
      math.floor(humi),
      humi_decimial%100
    )
  end
 
  day = gpio.read(_G["light_pin"])
  if ( day == 0 ) then
     _G["light"] = "DAY"
  else
     _G["light"] = "NIGHT"
  end
 end

 
local timerId=0
local timerDelay = 5000
tmr.alarm(timerId, timerDelay, 1, function()
  execute()
  collectgarbage()
end)
