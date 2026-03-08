local GenesisV50_Net = { Active = true }

function GenesisV50_Net:Bypass()
    -- Bỏ qua hệ thống kiểm tra Key bằng cách giả lập trạng thái đã xác thực
    _G.KeyEntered = true 
    _G.KeySystem = false
    
    local mt = getrawmetatable(game)
    setreadonly(mt, false)
    local oldNamecall = mt.__namecall
    
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        -- Chặn lệnh Kick và các báo cáo rình mò (Teleport check)
        if method == "Kick" or method == "ReportAbuse" then 
            return nil 
        end
        return oldNamecall(self, ...)
    end)
    setreadonly(mt, true)
    print("🔓 [GenesisV50] Đã bỏ qua GetKey & Kích hoạt Anti-Kick.")
end

function GenesisV50_Net:Init()
    self:Bypass()
    _G.Genesis:Register("GenesisV50_Network", self)
end
return GenesisV50_Net
