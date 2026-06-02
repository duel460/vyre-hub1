-- Vyre Hub UI
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create main ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "VyreHub"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

-- Utility function to create buttons
local function createButton(parent, name, text, position, size, callback)
	local button = Instance.new("TextButton")
	button.Name = name
	button.Text = text
	button.Position = position
	button.Size = size
	button.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.TextSize = 14
	button.Font = Enum.Font.GothamBold
	button.BorderSizePixel = 2
	button.BorderColor3 = Color3.fromRGB(100, 100, 100)
	button.Parent = parent
	
	button.MouseButton1Click:Connect(callback or function() end)
	
	-- Hover effect
	button.MouseEnter:Connect(function()
		button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		button.BorderColor3 = Color3.fromRGB(150, 150, 150)
	end)
	button.MouseLeave:Connect(function()
		button.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		button.BorderColor3 = Color3.fromRGB(100, 100, 100)
	end)
	
	return button
end

-- Main Panel (Top Left)
local mainPanel = Instance.new("Frame")
mainPanel.Name = "MainPanel"
mainPanel.Position = UDim2.new(0.02, 0, 0.02, 0)
mainPanel.Size = UDim2.new(0.25, 0, 0.5, 0)
mainPanel.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
mainPanel.BorderSizePixel = 2
mainPanel.BorderColor3 = Color3.fromRGB(0, 255, 0)
mainPanel.Parent = screenGui

-- Title
local title = Instance.new("TextLabel")
title.Name = "Title"
title.Text = "Irish Lagger"
title.Position = UDim2.new(0, 10, 0, 10)
title.Size = UDim2.new(1, -20, 0, 30)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 20
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = mainPanel

-- Status Label
local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "Status"
statusLabel.Text = "ON"
statusLabel.Position = UDim2.new(0.7, 0, 0, 10)
statusLabel.Size = UDim2.new(0.2, 0, 0, 30)
statusLabel.BackgroundTransparency = 1
statusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
statusLabel.TextSize = 16
statusLabel.Font = Enum.Font.GothamBold
statusLabel.Parent = mainPanel

-- Lagger Button
createButton(mainPanel, "Lagger", "⚙ Lagger", UDim2.new(0, 10, 0, 50), UDim2.new(1, -20, 0, 40), function()
	print("Lagger toggled")
end)

-- Space Speed Bypass Panel
local bypassPanel = Instance.new("Frame")
bypassPanel.Name = "BypassPanel"
bypassPanel.Position = UDim2.new(0, 10, 0, 100)
bypassPanel.Size = UDim2.new(1, -20, 0, 100)
bypassPanel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
bypassPanel.BorderSizePixel = 2
bypassPanel.BorderColor3 = Color3.fromRGB(100, 100, 100)
bypassPanel.Parent = mainPanel

-- Bypass Title
local bypassTitle = Instance.new("TextLabel")
bypassTitle.Name = "BypassTitle"
bypassTitle.Text = "SPACE SPEED BYPASS"
bypassTitle.Position = UDim2.new(0, 10, 0, 10)
bypassTitle.Size = UDim2.new(0.7, 0, 0, 20)
bypassTitle.BackgroundTransparency = 1
bypassTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
bypassTitle.TextSize = 14
bypassTitle.Font = Enum.Font.GothamBold
bypassTitle.TextXAlignment = Enum.TextXAlignment.Left
bypassTitle.Parent = bypassPanel

-- Close Button
local closeBtn = Instance.new("TextButton")
closeBtn.Name = "CloseBtn"
closeBtn.Text = "X"
closeBtn.Position = UDim2.new(0.85, 0, 0, 5)
closeBtn.Size = UDim2.new(0.1, 0, 0, 30)
closeBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 16
closeBtn.Font = Enum.Font.GothamBold
closeBtn.BorderSizePixel = 0
closeBtn.Parent = bypassPanel
closeBtn.MouseButton1Click:Connect(function()
	bypassPanel.Visible = not bypassPanel.Visible
end)

-- Bypass Toggle
local bypassToggle = Instance.new("Frame")
bypassToggle.Name = "Toggle"
bypassToggle.Position = UDim2.new(0, 10, 0, 40)
bypassToggle.Size = UDim2.new(1, -20, 0, 40)
bypassToggle.BackgroundTransparency = 1
bypassToggle.Parent = bypassPanel

local bypassLabel = Instance.new("TextLabel")
bypassLabel.Name = "Label"
bypassLabel.Text = "B    BYPASS : ON"
bypassLabel.Position = UDim2.new(0, 0, 0, 0)
bypassLabel.Size = UDim2.new(0.6, 1, 1, 0)
bypassLabel.BackgroundTransparency = 1
bypassLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
bypassLabel.TextSize = 14
bypassLabel.Font = Enum.Font.GothamBold
bypassLabel.TextXAlignment = Enum.TextXAlignment.Left
bypassLabel.Parent = bypassToggle

local toggleButton = Instance.new("Frame")
toggleButton.Name = "ToggleButton"
toggleButton.Position = UDim2.new(0.6, 0, 0.15, 0)
toggleButton.Size = UDim2.new(0.35, 0, 0.7, 0)
toggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggleButton.BorderSizePixel = 1
toggleButton.BorderColor3 = Color3.fromRGB(100, 100, 100)
toggleButton.Parent = bypassToggle

local toggleCircle = Instance.new("Frame")
toggleCircle.Name = "Circle"
toggleCircle.Position = UDim2.new(0.5, 0, 0.1, 0)
toggleCircle.Size = UDim2.new(0.4, 0, 0.8, 0)
toggleCircle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
toggleCircle.BorderSizePixel = 0
toggleCircle.Parent = toggleButton

-- Top Right Buttons Panel
local rightPanel = Instance.new("Frame")
rightPanel.Name = "RightPanel"
rightPanel.Position = UDim2.new(0.73, 0, 0.02, 0)
rightPanel.Size = UDim2.new(0.25, 0, 0.6, 0)
rightPanel.BackgroundTransparency = 1
rightPanel.Parent = screenGui

-- Button layout: 2 columns, 5 rows
local buttonConfigs = {
	{name = "DROP BR", text = "DROP\nBR", row = 0, col = 0},
	{name = "AUTO LEFT", text = "AUTO\nLEFT", row = 0, col = 1},
	{name = "BAT AIMBOT", text = "BAT\nAIMBOT", row = 1, col = 0},
	{name = "AUTO RIGHT", text = "AUTO\nRIGHT", row = 1, col = 1},
	{name = "TP DOWN", text = "TP\nDOWN", row = 2, col = 0},
	{name = "CARRY SPD", text = "CARRY\nSPD", row = 2, col = 1},
	{name = "LAGGER CARRY", text = "LAGGER\nCARRY", row = 3, col = 0},
	{name = "LAGGER MODE", text = "LAGGER\nMODE", row = 3, col = 1},
	{name = "ANTI BAT", text = "ANTI\nBAT", row = 4, col = 0},
}

for _, config in ipairs(buttonConfigs) do
	local btn = Instance.new("TextButton")
	btn.Name = config.name
	btn.Text = config.text
	btn.Position = UDim2.new(config.col * 0.5, 5, config.row * 0.18, 5)
	btn.Size = UDim2.new(0.5, -10, 0.18, -10)
	btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.TextSize = 11
	btn.Font = Enum.Font.GothamBold
	btn.BorderSizePixel = 2
	btn.BorderColor3 = Color3.fromRGB(100, 100, 100)
	btn.Parent = rightPanel
	
	btn.MouseEnter:Connect(function()
		btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		btn.BorderColor3 = Color3.fromRGB(150, 150, 150)
	end)
	btn.MouseLeave:Connect(function()
		btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		btn.BorderColor3 = Color3.fromRGB(100, 100, 100)
	end)
	
	btn.MouseButton1Click:Connect(function()
		print(config.name .. " clicked")
	end)
end

-- HUB Title at top
local hubTitle = Instance.new("TextLabel")
hubTitle.Name = "HubTitle"
hubTitle.Text = "VYRE HUB"
hubTitle.Position = UDim2.new(0.3, 0, 0.02, 0)
hubTitle.Size = UDim2.new(0.4, 0, 0.05, 0)
hubTitle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
hubTitle.BorderSizePixel = 2
hubTitle.BorderColor3 = Color3.fromRGB(100, 100, 100)
hubTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
hubTitle.TextSize = 18
hubTitle.Font = Enum.Font.GothamBold
hubTitle.Parent = screenGui

print("Vyre Hub loaded successfully!")
