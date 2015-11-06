i2c.setup(0, _G["lcd_sda"], _G["lcd_scl"], i2c.SLOW)
lcd = dofile("lcdlib.lua")()

function execute() 
  -- Integer firmware using this example

  lcd.put(lcd.locate(0,12), _G["light"])
  lcd.put(lcd.locate(0, 0), "Hum:  " .. _G["humi"] .. "%")
  lcd.put(lcd.locate(1, 0), "Temp: " .. _G["temp"] .. "c") 
end 


-- Timer to refresh
timerId=0
timerDelay = 5000
tmr.alarm(timerId, timerDelay, 1, function()
  lcd.clear()
  execute()
  collectgarbage()
end)
