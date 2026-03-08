-- [[ GENESIS V50 - SUPREME EDITION BY DUY THU ]]
_G.Genesis = {
    Modules = {},
    -- ĐÃ SỬA ĐÚNG TÊN TÀI KHOẢN DuyChuyenScripter VÀ REPO DuyChuyenScriptHub
    BaseUrl = "https://raw.githubusercontent.com/DuyChuyenScripter/DuyChuyenScriptHub/main/",
    BootPriority = {
        "network/manager.lua",   -- Đã có
        "systems/combat.lua",    -- Đã có
        "systems/auto_farm.lua", -- Đã có
        "visuals/visual_hub.lua",-- Đã có
        "ui/window.lua",         -- Đã có
        "core/engine.lua"        -- Đã có
    }
}

function _G.Genesis:Register(name, module) self.Modules[name] = module end
function _G.Genesis:Get(name) return self.Modules[name] end

for _, path in ipairs(_G.Genesis.BootPriority) do
    local success, result = pcall(function()
        return loadstring(game:HttpGet(_G.Genesis.BaseUrl .. path))()
    end)
    if success and result then
        local mod = result
        if mod.Init then pcall(function() mod:Init() end) end
    else
        warn("⚠️ Đang thiếu file hoặc sai đường dẫn: " .. path)
    end
end
print("👑 GENESIS V50 ONLINE - LOADED SUCCESSFULLY")
