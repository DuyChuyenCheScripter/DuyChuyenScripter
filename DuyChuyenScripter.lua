-- [[ GENESIS V50 - SUPREME EDITION ]]
_G.Genesis = {
    Modules = {},
    -- Đảm bảo BaseUrl có dấu gạch chéo ở cuối
    BaseUrl = "https://raw.githubusercontent.com/DuyChuyenScripter/GenesisDuyScriptHub/main/",
    BootPriority = {
        -- Duy chỉ giữ lại những file ĐÃ CÓ trên GitHub của Duy thôi nhé:
        "core/event_bus.lua", 
        "core/scheduler.lua", 
        "systems/auto_farm.lua", 
        "systems/sea_events.lua",
        "ui/window.lua",
        "visuals/optimizer.lua"   
        "network/manager.lua", -- Bảo mật trước
        "systems/combat.lua",
        "visuals/optimizer.lua",
        "ui/window.lua",
        "core/engine.lua"      -- Engine luôn nạp cuối cùng để điều khiển các module trên
    
        
    }
}

function _G.Genesis:Register(name, module) self.Modules[name] = module end
function _G.Genesis:Get(name) return self.Modules[name] end

for _, path in ipairs(_G.Genesis.BootPriority) do
    local success, result = pcall(function()
        -- Load các module con từ thư mục systems, core...
        return loadstring(game:HttpGet(_G.Genesis.BaseUrl .. path))()
    end)
    if success and result then
        if result.Init then pcall(function() result:Init() end) end
    else
        warn("⚠️ Không tìm thấy file con tại: " .. path)
    end
end

print("👑 GENESIS V50 ONLINE: LOADED SUCCESSFULLY FROM GenesisV50.lua")
