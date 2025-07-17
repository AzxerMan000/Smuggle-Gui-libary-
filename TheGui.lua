local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local SmuggleGui = {}
SmuggleGui.__index = SmuggleGui

function SmuggleGui.new(titleText, config)
    config = config or {}
    local self = setmetatable({}, SmuggleGui)

    self.useKeySystem = config.useKeySystem or false
    self.correctKey = config.correctKey or "smuggle123"
    self.keyLink = config.keyLink or "https://your-key-link.here"
    self._titleText = titleText or "SmuggleGui"

    if self.useKeySystem then
        -- Create Key UI
        local keyGui = Instance.new("ScreenGui")
        keyGui.Name = "SmuggleGuiKeyUI"
        keyGui.ResetOnSpawn = false
        keyGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

        local frame = Instance.new("Frame", keyGui)
        frame.Size = UDim2.new(0, 320, 0, 160)
        frame.Position = UDim2.new(0.5, -160, 0.5, -80)
        frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        frame.Active = true
        frame.Draggable = true
        Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

        local titleLabel = Instance.new("TextLabel", frame)
        titleLabel.Text = "🔐 Enter Key"
        titleLabel.Size = UDim2.new(1, 0, 0, 35)
        titleLabel.Position = UDim2.new(0, 0, 0, 10)
        titleLabel.BackgroundTransparency = 1
        titleLabel.TextColor3 = Color3.new(1, 1, 1)
        titleLabel.Font = Enum.Font.GothamBold
        titleLabel.TextSize = 20

        local keyBox = Instance.new("TextBox", frame)
        keyBox.PlaceholderText = "Enter Key Here"
        keyBox.Size = UDim2.new(0.8, 0, 0, 30)
        keyBox.Position = UDim2.new(0.1, 0, 0, 55)
        keyBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        keyBox.TextColor3 = Color3.new(1, 1, 1)
        keyBox.TextSize = 14
        keyBox.Font = Enum.Font.Gotham
        Instance.new("UICorner", keyBox).CornerRadius = UDim.new(0, 8)

        local getKey = Instance.new("TextButton", frame)
        getKey.Text = "Get Key"
        getKey.Size = UDim2.new(0.4, -5, 0, 30)
        getKey.Position = UDim2.new(0.1, 0, 0, 95)
        getKey.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
        getKey.TextColor3 = Color3.new(1, 1, 1)
        getKey.Font = Enum.Font.Gotham
        getKey.TextSize = 14
        Instance.new("UICorner", getKey).CornerRadius = UDim.new(0, 8)

        local submit = Instance.new("TextButton", frame)
        submit.Text = "Submit"
        submit.Size = UDim2.new(0.4, -5, 0, 30)
        submit.Position = UDim2.new(0.5, 5, 0, 95)
        submit.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
        submit.TextColor3 = Color3.new(1, 1, 1)
        submit.Font = Enum.Font.GothamBold
        submit.TextSize = 14
        Instance.new("UICorner", submit).CornerRadius = UDim.new(0, 8)

        getKey.MouseButton1Click:Connect(function()
            pcall(function()
                setclipboard(self.keyLink)
            end)
            StarterGui:SetCore("SendNotification", {
                Title = "SmuggleGui",
                Text = "Key link copied to clipboard!",
                Duration = 3
            })
        end)

        submit.MouseButton1Click:Connect(function()
            local inputKey = keyBox.Text
            if inputKey == self.correctKey then
                keyGui:Destroy()
                self:CreateMainGui(self._titleText)
            else
                StarterGui:SetCore("SendNotification", {
                    Title = "SmuggleGui",
                    Text = "Incorrect Key!",
                    Duration = 3
                })
            end
        end)
    else
        -- No key system → create main GUI right away
        self:CreateMainGui(self._titleText)
    end

    return self
end

function SmuggleGui:CreateMainGui(titleText)
    self.gui = Instance.new("ScreenGui")
    self.gui.Name = "SmuggleGui"
    self.gui.ResetOnSpawn = false
    self.gui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

    self.main = Instance.new("Frame", self.gui)
    self.main.Size = UDim2.new(0, 500, 0, 400)
    self.main.Position = UDim2.new(0.5, -250, 0.5, -200)
    self.main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    self.main.Active = true
    self.main.Draggable = true
    Instance.new("UICorner", self.main).CornerRadius = UDim.new(0, 12)

    self.title = Instance.new("TextLabel", self.main)
    self.title.Size = UDim2.new(1, -80, 0, 30)
    self.title.Position = UDim2.new(0, 10, 0, 5)
    self.title.Text = titleText or "SmuggleGui"
    self.title.BackgroundTransparency = 1
    self.title.TextColor3 = Color3.new(1, 1, 1)
    self.title.Font = Enum.Font.GothamBold
    self.title.TextSize = 20
    self.title.TextXAlignment = Enum.TextXAlignment.Left

    self.kill = Instance.new("TextButton", self.main)
    self.kill.Size = UDim2.new(0, 30, 0, 25)
    self.kill.Position = UDim2.new(1, -35, 0, 5)
    self.kill.Text = "X"
    self.kill.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    self.kill.TextColor3 = Color3.new(1, 1, 1)
    self.kill.Font = Enum.Font.GothamBold
    self.kill.TextSize = 18
    Instance.new("UICorner", self.kill).CornerRadius = UDim.new(0, 6)

    self.minimize = Instance.new("TextButton", self.main)
    self.minimize.Size = UDim2.new(0, 30, 0, 25)
    self.minimize.Position = UDim2.new(1, -70, 0, 5)
    self.minimize.Text = "-"
    self.minimize.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    self.minimize.TextColor3 = Color3.new(1, 1, 1)
    self.minimize.Font = Enum.Font.GothamBold
    self.minimize.TextSize = 18
    Instance.new("UICorner", self.minimize).CornerRadius = UDim.new(0, 6)

    self.restore = Instance.new("TextButton", self.gui)
    self.restore.Size = UDim2.new(0, 100, 0, 30)
    self.restore.Position = UDim2.new(0, 10, 1, -40)
    self.restore.Text = "Open GUI"
    self.restore.BackgroundColor3 = Color3.fromRGB(50, 120, 255)
    self.restore.TextColor3 = Color3.new(1, 1, 1)
    self.restore.Font = Enum.Font.Gotham
    self.restore.TextSize = 16
    self.restore.Visible = false
    Instance.new("UICorner", self.restore).CornerRadius = UDim.new(0, 8)

    self.tabPanel = Instance.new("Frame", self.main)
    self.tabPanel.Size = UDim2.new(0, 120, 1, -50)
    self.tabPanel.Position = UDim2.new(0, 10, 0, 45)
    self.tabPanel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Instance.new("UICorner", self.tabPanel).CornerRadius = UDim.new(0, 8)

    self.tabLayout = Instance.new("UIListLayout", self.tabPanel)
    self.tabLayout.Padding = UDim.new(0, 6)
    self.tabLayout.SortOrder = Enum.SortOrder.LayoutOrder

    self.pages = {}

    self.kill.MouseButton1Click:Connect(function()
        self:Kill()
    end)

    self.minimize.MouseButton1Click:Connect(function()
        self:Minimize()
    end)

    self.restore.MouseButton1Click:Connect(function()
        self:Restore()
    end)
end

function SmuggleGui:AddTab(name)
    if not self.pages then
        self.pages = {}
    end

    local tabIndex = 1
    while self.pages[tabIndex] do
        tabIndex = tabIndex + 1
    end

    local tab = Instance.new("TextButton", self.tabPanel)
    tab.Size = UDim2.new(1, -10, 0, 30)
    tab.Text = name
    tab.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    tab.TextColor3 = Color3.new(1, 1, 1)
    tab.Font = Enum.Font.Gotham
    tab.TextSize = 14
    Instance.new("UICorner", tab).CornerRadius = UDim.new(0, 6)

    local page = Instance.new("ScrollingFrame", self.main)
    page.Size = UDim2.new(1, -150, 1, -60)
    page.Position = UDim2.new(0, 140, 0, 45)
    page.BackgroundTransparency = 1
    page.ScrollBarThickness = 5
    page.Visible = false

    local layout = Instance.new("UIListLayout", page)
    layout.Padding = UDim.new(0, 8)
    layout.SortOrder = Enum.SortOrder.LayoutOrder

    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        page.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 10)
    end)

    self.pages[tabIndex] = page

    tab.MouseButton1Click:Connect(function()
        for i, p in pairs(self.pages) do
            p.Visible = (i == tabIndex)
        end
    end)

    local count = 0
    for _ in pairs(self.pages) do
        count = count + 1
    end
    if count == 1 then
        page.Visible = true
    end

    return setmetatable({
        tab = tab,
        page = page,
        _gui = self,
    }, {
        __index = function(t, k)
            if k == "AddToggle" then
                return function(_, name, callback)
                    local frame = Instance.new("Frame", t.page)
                    frame.Size = UDim2.new(1, 0, 0, 40)
                    frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)

                    local label = Instance.new("TextLabel", frame)
                    label.Text = name
                    label.Size = UDim2.new(0.6, 0, 1, 0)
                    label.Position = UDim2.new(0.05, 0, 0, 0)
                    label.BackgroundTransparency = 1
                    label.Font = Enum.Font.Gotham
                    label.TextSize = 16
                    label.TextColor3 = Color3.new(1, 1, 1)
                    label.TextXAlignment = Enum.TextXAlignment.Left

                    local toggle = Instance.new("TextButton", frame)
                    toggle.Size = UDim2.new(0, 50, 0, 24)
                    toggle.Position = UDim2.new(1, -60, 0.5, -12)
                    toggle.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
                    toggle.Text = "OFF"
                    toggle.TextColor3 = Color3.new(1, 1, 1)
                    toggle.Font = Enum.Font.GothamBold
                    toggle.TextSize = 14
                    Instance.new("UICorner", toggle).CornerRadius = UDim.new(0, 12)

                    local on = false
                    toggle.MouseButton1Click:Connect(function()
                        on = not on
                        toggle.Text = on and "ON" or "OFF"
                        toggle.BackgroundColor3 = on and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(120, 120, 120)
                        if callback and typeof(callback) == "function" then
                            callback(on)
                        end
                    end)
                end

            elseif k == "AddButton" then
                return function(_, name, onClick)
                    local button = Instance.new("TextButton", t.page)
                    button.Size = UDim2.new(1, 0, 0, 40)
                    button.Text = name
                    button.Font = Enum.Font.Gotham
                    button.TextSize = 16
                    button.TextColor3 = Color3.new(1, 1, 1)
                    button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
                    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 8)

                    local currentCallback = onClick
                    button.MouseButton1Click:Connect(function()
                        if currentCallback and typeof(currentCallback) == "function" then
                            currentCallback()
                        else
                            print(name .. " button clicked!")
                        end
                    end)

                    return button, function(newCallback)
                        currentCallback = newCallback
                    end
                end
            else
                return rawget(t, k)
            end
        end
    })
end

function SmuggleGui:Kill()
    local tween = TweenService:Create(self.main, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 100, 0, 80),
        Position = UDim2.new(0.5, -50, 0.5, -40),
        BackgroundTransparency = 1,
    })
    tween:Play()
    tween.Completed:Wait()
    self.gui:Destroy()
end

function SmuggleGui:Minimize()
    function SmuggleGui:Minimize()
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)

    local minimizeTween = TweenService:Create(self.main, tweenInfo, {
        Size = UDim2.new(0, 200, 0, 30),
        Position = UDim2.new(0.5, -100, 0.5, -15)
    })

    minimizeTween:Play()

    minimizeTween.Completed:Connect(function()
        self.main.Visible = false
        self.restore.Visible = true
    end)
end

function SmuggleGui:Restore()
    self.main.Visible = true
    self.restore.Visible = false
    self.main.Size = UDim2.new(0, 100, 0, 80)
    self.main.Position = UDim2.new(0.5, -50, 0.5, -40)
    self.main.BackgroundTransparency = 1

    local tween = TweenService:Create(self.main, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 500, 0, 400),
        Position = UDim2.new(0.5, -250, 0.5, -200),
        BackgroundTransparency = 0,
    })
    tween:Play()
end

return SmuggleGui
