local ESP = { Enabled = true }

function ESP:AddHighlight(object, color)
    if not object:FindFirstChild("GenesisHighlight") then
        local highlight = Instance.new("Highlight", object)
        highlight.Name = "GenesisHighlight"
        highlight.FillColor = color
        highlight.OutlineColor = Color3.new(1, 1, 1)
        highlight.FillTransparency = 0.5
    end
end

function ESP:Scan()
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= game.Players.LocalPlayer and p.Character then
            self:AddHighlight(p.Character, Color3.new(1, 0, 0)) -- Người chơi màu đỏ
        end
    end
end

function ESP:Init()
    _G.Genesis:Get("Scheduler"):Add("LOW", "ESPScan", function() self:Scan() end)
    _G.Genesis:Register("ESP", self)
end
return ESP
