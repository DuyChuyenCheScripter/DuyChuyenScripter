local GenesisV50_Combat = { FastAttack = true, BringMob = true }

function GenesisV50_Combat:Attack()
    local lp = game.Players.LocalPlayer
    local tool = lp.Character and lp.Character:FindFirstChildOfClass("Tool")
    if tool and self.FastAttack then
        -- Gửi tín hiệu tấn công liên tục (Animation Cancel)
        local net = game:GetService("ReplicatedStorage").Modules.Net["RE/RegisterAttack"]
        net:FireServer(tool)
        -- Tự động Click chuột trái liên tục
        game:GetService("VirtualUser"):CaptureController()
        game:GetService("VirtualUser"):Button1Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    end
end

function GenesisV50_Combat:GomQuai()
    if not self.BringMob then return end
    -- Logic gom tất cả quái trong phạm vi 500m về trước mặt
    local myPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    for _, v in pairs(workspace.Enemies:GetChildren()) do
        if v:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position - myPos).Magnitude < 500 then
            v.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5)
        end
    end
end

function GenesisV50_Combat:Init()
    _G.Genesis:Register("GenesisV50_Combat", self)
    _G.Genesis:Get("Scheduler"):Add("CRITICAL", "CombatLoop", function() 
        self:Attack() 
        self:GomQuai()
    end)
end
return GenesisV50_Combat
