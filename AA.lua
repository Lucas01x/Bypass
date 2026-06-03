if not game:IsLoaded() then game.Loaded:Wait() end

local SpooferUpvalue = function(func)
    for i, v in next, getupvalues(func) do
        if typeof(v) == 'function' then
            SpooferUpvalue(v)
			print(v)
        end
        setupvalue(func, i, wait)
    end
end


if not workspace:GetAttribute("Map") then
    -- game:GetService("Players").Lucasd43200.PlayerScripts.Baka

    game:GetService("ScriptContext"):SetTimeout(1)
    for _, obj in getgc(true) do
        if type(obj) == "function"
        and islclosure(obj)
        and not isexecutorclosure(obj) then

            local info = debug.getinfo(obj)
            if info and tostring(info.source):find("Baka") then
                print("Debug :", obj, info.source) 
                print(info.name)
                -- hookfunction(obj, error("Lucas OnTop" , 1));
                SpooferUpvalue(obj)
                -- SpooferUpvalue(obj)
            end
        end
    end

    if true then
        for i,v in next , getconnections(game:GetService('ScriptContext').Error) do
            if v.Function then
                print(v)
                v:Disable();
            end;
        end;
    end;

 end
