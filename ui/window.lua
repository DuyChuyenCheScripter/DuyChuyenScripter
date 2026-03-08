local UI = { Themes = { Main = Color3.fromRGB(0, 170, 255), Bg = Color3.fromRGB(20, 20, 20) } }

function UI:CreateMain()
    local Screen = Instance.new("ScreenGui", game.CoreGui)
    local MainFrame = Instance.new("Frame", Screen)
    MainFrame.Size = UDim2.new(0, 400, 0, 300)
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    MainFrame.BackgroundColor3 = self.Themes.Bg
    MainFrame.Active, MainFrame.Draggable = true, true -- Giống BlueX: Di chuyển được trên Mobile
    
    local Corner = Instance.new("UICorner", MainFrame)
    Corner.CornerRadius = UDim.new(0, 10)
    
    local Title = Instance.new("TextLabel", MainFrame)
    Title.Size = UDim2.new(1, 0, 0, 40)
    Title.Text = "🔵 BLUE-X STYLE | GENESIS V50"
    Title.BackgroundColor3 = self.Themes.Main
    Title.TextColor3 = Color3.new(1, 1, 1)
    
    return MainFrame
end

function UI:Init() _G.Genesis:Register("UI", self) self:CreateMain() end
return UI
