local Net = {}

function Net:SecureCall(remote, ...)
    -- Giả lập BlueX: Kiểm tra xem Remote có an toàn không trước khi gửi
    if remote:IsA("RemoteEvent") then
        remote:FireServer(...)
    elseif remote:IsA("RemoteFunction") then
        return remote:InvokeServer(...)
    end
end

function Net:AntiKick()
    -- Chặn lệnh Kick từ Server (Bypass cơ bản)
    local mt = getrawmetatable(game)
    setreadonly(mt, false)
    local old = mt.__namecall
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        if method == "Kick" then return nil end
        return old(self, ...)
    end)
end

function Net:Init() _G.Genesis:Register("Network", self) self:AntiKick() end
return Net
