local Farm = { Speed = 250 }

function Farm:TweenTo(pos)
    local char = game.Players.LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    
    local dist = (char.HumanoidRootPart.Position - pos.Position).Magnitude
    local info = TweenInfo.new(dist / self.Speed, Enum.EasingStyle.Linear)
    local tween = game:GetService("TweenService"):Create(char.HumanoidRootPart, info, {CFrame = pos})
    
    tween:Play()
    return tween
end

function Farm:Init() _G.Genesis:Register("AutoFarm", self) end
return Farm
