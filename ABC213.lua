if not game:IsLoaded() then game.Loaded:Wait() end

local reg = debug.getregistry()

for _, thread in next, reg do
    if typeof(thread) == "thread" then
        local ThreadScript = getscriptfromthread(thread)
        if ThreadScript and tostring(ThreadScript) == "Baka" then
            print(_)
            task.cancel(thread)
            print(coroutine.status(thread))
            --print(getscriptfromthread(thread))
        end
    end
end
