local Visual = { ESP = true, LagFix = true }

function Visual:Apply()
    if self.LagFix then
        settings().Rendering.QualityLevel = 1
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("BasePart") then v.Material = "SmoothPlastic"
            elseif v:IsA("Decal") or v:IsA("Texture") then v:Destroy() end
        end
    end
end

function Visual:DrawESP()
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= game.Players.LocalPlayer and p.Character then
            if not p.Character:FindFirstChild("Highlight") then
                local h = Instance.new("Highlight", p.Character)
                h.FillColor = Color3.fromRGB(255, 0, 0)
            end
        end
    end
end

function Visual:Init()
    self:Apply()
    _G.Genesis:Get("Scheduler"):Add("LOW", "ESPLoop", function() self:DrawESP() end)
    _G.Genesis:Register("GenesisV50_Visual", self)
end
return Visual
