srv=net.createServer(net.TCP)
local r = require("controllers")

srv:listen(80,function(conn)
    conn:on("receive", function(client,request)
        local _, _, method, path, vars = string.find(request, "([A-Z]+) (.+)?(.+) HTTP");
        if(method == nil)then
            _, _, method, path = string.find(request, "([A-Z]+) (.+) HTTP");
        end
        
        local _GET = {}
        if (vars ~= nil)then
            for k, v in string.gmatch(vars, "(%w+)=(%w+)&*") do
                _GET[k] = v
            end
        end
        local i = 0
                
        buff = r.execute(path)
        
        client:send("HTTP/1.1 200 OK\r\nServer: NodeMCUWeather\r\nContent-Type: text/json\r\n\r\n")
        client:send("{")
        client:send(buff)
        client:send(', "call": "'.. path .. '"')
        client:send("}")
        
    end)
    conn:on("sent",function(conn) 
      conn:close()
      collectgarbage()
    end)
end)
