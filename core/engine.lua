local GenesisV50_Engine = { Running = true }

function GenesisV50_Engine:Start()
    print("🔥 [GenesisV50] Đang khởi động Full chức năng BlueX Style...")
    _G.Genesis:Get("GenesisV50_Network"):Bypass()
    _G.Genesis:Get("GenesisV50_UI"):CreateMenu() -- Menu sẽ hiện ngay lập tức
end

function GenesisV50_Engine:Init()
    _G.Genesis:Register("GenesisV50_Engine", self)
    task.delay(1, function() self:Start() end)
end
return GenesisV50_Engine
