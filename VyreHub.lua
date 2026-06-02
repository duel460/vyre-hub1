-- Vyre Hub UI with Logo
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

-- ===== LEFT PANEL =====
local leftPanel = Instance.new("Frame")
leftPanel.Name = "LeftPanel"
leftPanel.Position = UDim2.new(0.1, 0, 0.15, 0)
leftPanel.Size = UDim2.new(0.35, 0, 0.7, 0)
leftPanel.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
leftPanel.BorderSizePixel = 2
leftPanel.BorderColor3 = Color3.fromRGB(50, 50, 50)
leftPanel.Parent = screenGui

-- Header
local header = Instance.new("Frame")
header.Name = "Header"
header.Position = UDim2.new(0, 0, 0, 0)
header.Size = UDim2.new(1, 0, 0.08, 0)
header.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
header.BorderSizePixel = 0
header.Parent = leftPanel

local headerTitle = Instance.new("TextLabel")
headerTitle.Name = "Title"
headerTitle.Text = "VYRE HUB"
headerTitle.Position = UDim2.new(0.05, 0, 0, 0)
headerTitle.Size = UDim2.new(0.5, 0, 1, 0)
headerTitle.BackgroundTransparency = 1
headerTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
headerTitle.TextSize = 16
headerTitle.Font = Enum.Font.GothamBold
headerTitle.TextXAlignment = Enum.TextXAlignment.Left
headerTitle.Parent = header

local headerSubtitle = Instance.new("TextLabel")
headerSubtitle.Name = "Subtitle"
headerSubtitle.Text = "v1  By: VYRE"
headerSubtitle.Position = UDim2.new(0.35, 0, 0, 0)
headerSubtitle.Size = UDim2.new(0.4, 0, 1, 0)
headerSubtitle.BackgroundTransparency = 1
headerSubtitle.TextColor3 = Color3.fromRGB(150, 150, 150)
headerSubtitle.TextSize = 11
headerSubtitle.Font = Enum.Font.Gotham
headerSubtitle.TextXAlignment = Enum.TextXAlignment.Left
headerSubtitle.Parent = header

local closeBtn = Instance.new("TextButton")
closeBtn.Name = "CloseBtn"
closeBtn.Text = "−"
closeBtn.Position = UDim2.new(0.92, 0, 0.15, 0)
closeBtn.Size = UDim2.new(0.08, 0, 0.06, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 20
closeBtn.Font = Enum.Font.GothamBold
closeBtn.BorderSizePixel = 1
closeBtn.BorderColor3 = Color3.fromRGB(100, 100, 100)
closeBtn.Parent = header

-- Left sidebar with logo and menu
local sidebar = Instance.new("Frame")
sidebar.Name = "Sidebar"
sidebar.Position = UDim2.new(0, 0, 0.08, 0)
sidebar.Size = UDim2.new(0.25, 0, 0.92, 0)
sidebar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
sidebar.BorderSizePixel = 1
sidebar.BorderColor3 = Color3.fromRGB(50, 50, 50)
sidebar.Parent = leftPanel

-- Logo (Vyre Hub with image)
local logoFrame = Instance.new("Frame")
logoFrame.Name = "Logo"
logoFrame.Position = UDim2.new(0.05, 0, 0.02, 0)
logoFrame.Size = UDim2.new(0.9, 0, 0.18, 0)
logoFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
logoFrame.BorderSizePixel = 1
logoFrame.BorderColor3 = Color3.fromRGB(150, 0, 255)
logoFrame.Parent = sidebar

local logoImage = Instance.new("ImageLabel")
logoImage.Name = "LogoImage"
logoImage.Image = "https://chatgpt.com/backend-api/estuary/content?id=file_0000000098a071f49586eca85d0aa933&ts=494562&p=fsns&cid=1&sig=f6f45412c10c338d69a1e7a2a85f022605a5c0698c98fa8aa33a8ade0c0e2228&v=0"
logoImage.Position = UDim2.new(0, 0, 0, 0)
logoImage.Size = UDim2.new(1, 0, 1, 0)
logoImage.BackgroundTransparency = 1
logoImage.Parent = logoFrame

-- Menu buttons
local menuItems = {"Bat Aimbot", "Mechanics", "Movement", "Settings"}
for i, item in ipairs(menuItems) do
	local btn = Instance.new("TextButton")
	btn.Name = item
	btn.Text = item
	btn.Position = UDim2.new(0, 0, 0.25 + (i-1) * 0.15, 0)
	btn.Size = UDim2.new(1, 0, 0.12, 0)
	btn.BackgroundColor3 = i == 1 and Color3.fromRGB(40, 40, 40) or Color3.fromRGB(20, 20, 20)
	btn.BorderSizePixel = 0
	btn.TextColor3 = Color3.fromRGB(150, 150, 150)
	btn.TextSize = 13
	btn.Font = Enum.Font.Gotham
	btn.Parent = sidebar
	
	btn.MouseButton1Click:Connect(function()
		print(item .. " clicked")
	end)
end

-- Content panel (right side of left panel)
local contentPanel = Instance.new("Frame")
contentPanel.Name = "ContentPanel"
contentPanel.Position = UDim2.new(0.25, 0, 0.08, 0)
contentPanel.Size = UDim2.new(0.75, 0, 0.92, 0)
contentPanel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
contentPanel.BorderSizePixel = 1
contentPanel.BorderColor3 = Color3.fromRGB(50, 50, 50)
contentPanel.Parent = leftPanel

-- Content title
local contentTitle = Instance.new("TextLabel")
contentTitle.Name = "Title"
contentTitle.Text = "SPEED CONFIGURATION"
contentTitle.Position = UDim2.new(0.05, 0, 0.02, 0)
contentTitle.Size = UDim2.new(0.9, 0, 0.08, 0)
contentTitle.BackgroundTransparency = 1
contentTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
contentTitle.TextSize = 14
contentTitle.Font = Enum.Font.GothamBold
contentTitle.TextXAlignment = Enum.TextXAlignment.Left
contentTitle.Parent = contentPanel

-- Speed configuration items
local speedItems = {
	{label = "Normal Speed", desc = "walking / running speed", value = "55.5"},
	{label = "Carry Speed", desc = "speed on velocity", value = "23.3"},
	{label = "Lagger Speed", desc = "speed in lagger mode", value = "12.8"},
}

for i, item in ipairs(speedItems) do
	local itemFrame = Instance.new("Frame")
	itemFrame.Name = "SpeedItem" .. i
	itemFrame.Position = UDim2.new(0.05, 0, 0.12 + (i-1) * 0.2, 0)
	itemFrame.Size = UDim2.new(0.9, 0, 0.16, 0)
	itemFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	itemFrame.BorderSizePixel = 1
	itemFrame.BorderColor3 = Color3.fromRGB(60, 60, 60)
	itemFrame.Parent = contentPanel
	
	local label = Instance.new("TextLabel")
	label.Text = item.label
	label.Position = UDim2.new(0.05, 0, 0, 0)
	label.Size = UDim2.new(0.5, 0, 0.5, 0)
	label.BackgroundTransparency = 1
	label.TextColor3 = Color3.fromRGB(255, 255, 255)
	label.TextSize = 12
	label.Font = Enum.Font.GothamBold
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Parent = itemFrame
	
	local desc = Instance.new("TextLabel")
	desc.Text = item.desc
	desc.Position = UDim2.new(0.05, 0, 0.5, 0)
	desc.Size = UDim2.new(0.5, 0, 0.5, 0)
	desc.BackgroundTransparency = 1
	desc.TextColor3 = Color3.fromRGB(100, 100, 100)
	desc.TextSize = 10
	desc.Font = Enum.Font.Gotham
	desc.TextXAlignment = Enum.TextXAlignment.Left
	desc.Parent = itemFrame
	
	local value = Instance.new("TextLabel")
	value.Text = item.value
	value.Position = UDim2.new(0.6, 0, 0.15, 0)
	value.Size = UDim2.new(0.35, 0, 0.7, 0)
	value.BackgroundTransparency = 1
	value.TextColor3 = Color3.fromRGB(255, 255, 255)
	value.TextSize = 13
	value.Font = Enum.Font.GothamBold
	value.TextXAlignment = Enum.TextXAlignment.Center
	value.Parent = itemFrame
end

-- Mode and Lagger Mode
local modeFrame = Instance.new("Frame")
modeFrame.Name = "ModeFrame"
modeFrame.Position = UDim2.new(0.05, 0, 0.72, 0)
modeFrame.Size = UDim2.new(0.9, 0, 0.1, 0)
modeFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
modeFrame.BorderSizePixel = 1
modeFrame.BorderColor3 = Color3.fromRGB(60, 60, 60)
modeFrame.Parent = contentPanel

local modeLabel = Instance.new("TextLabel")
modeLabel.Text = "Modo"
modeLabel.Position = UDim2.new(0.05, 0, 0, 0)
modeLabel.Size = UDim2.new(0.3, 0, 1, 0)
modeLabel.BackgroundTransparency = 1
modeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
modeLabel.TextSize = 12
modeLabel.Font = Enum.Font.GothamBold
modeLabel.TextXAlignment = Enum.TextXAlignment.Left
modeLabel.Parent = modeFrame

local modeValue = Instance.new("TextLabel")
modeValue.Text = "Normal"
modeValue.Position = UDim2.new(0.4, 0, 0, 0)
modeValue.Size = UDim2.new(0.25, 0, 1, 0)
modeValue.BackgroundTransparency = 1
modeValue.TextColor3 = Color3.fromRGB(255, 255, 255)
modeValue.TextSize = 12
modeValue.Font = Enum.Font.GothamBold
modeValue.TextXAlignment = Enum.TextXAlignment.Left
modeValue.Parent = modeFrame

local modeKey = Instance.new("TextLabel")
modeKey.Text = "Q"
modeKey.Position = UDim2.new(0.75, 0, 0, 0)
modeKey.Size = UDim2.new(0.2, 0, 1, 0)
modeKey.BackgroundTransparency = 1
modeKey.TextColor3 = Color3.fromRGB(255, 255, 255)
modeKey.TextSize = 12
modeKey.Font = Enum.Font.GothamBold
modeKey.TextXAlignment = Enum.TextXAlignment.Right
modeKey.Parent = modeFrame

-- Lagger Mode Toggle
local laggerFrame = Instance.new("Frame")
laggerFrame.Name = "LaggerFrame"
laggerFrame.Position = UDim2.new(0.05, 0, 0.85, 0)
laggerFrame.Size = UDim2.new(0.9, 0, 0.1, 0)
laggerFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
laggerFrame.BorderSizePixel = 1
laggerFrame.BorderColor3 = Color3.fromRGB(60, 60, 60)
laggerFrame.Parent = contentPanel

local laggerLabel = Instance.new("TextLabel")
laggerLabel.Text = "Lagger Mode"
laggerLabel.Position = UDim2.new(0.05, 0, 0, 0)
laggerLabel.Size = UDim2.new(0.5, 0, 1, 0)
laggerLabel.BackgroundTransparency = 1
laggerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
laggerLabel.TextSize = 12
laggerLabel.Font = Enum.Font.GothamBold
laggerLabel.TextXAlignment = Enum.TextXAlignment.Left
laggerLabel.Parent = laggerFrame

local toggleFrame = Instance.new("Frame")
toggleFrame.Name = "Toggle"
toggleFrame.Position = UDim2.new(0.75, 0, 0.25, 0)
toggleFrame.Size = UDim2.new(0.2, 0, 0.5, 0)
toggleFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggleFrame.BorderSizePixel = 1
toggleFrame.BorderColor3 = Color3.fromRGB(100, 100, 100)
toggleFrame.Parent = laggerFrame

local toggleCircle = Instance.new("Frame")
toggleCircle.Name = "Circle"
toggleCircle.Position = UDim2.new(0.05, 0, 0.1, 0)
toggleCircle.Size = UDim2.new(0.4, 0, 0.8, 0)
toggleCircle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
toggleCircle.BorderSizePixel = 0
toggleCircle.Parent = toggleFrame

local laggerKey = Instance.new("TextLabel")
laggerKey.Text = "R"
laggerKey.Position = UDim2.new(0.55, 0, 0, 0)
laggerKey.Size = UDim2.new(0.35, 0, 1, 0)
laggerKey.BackgroundTransparency = 1
laggerKey.TextColor3 = Color3.fromRGB(255, 255, 255)
laggerKey.TextSize = 12
laggerKey.Font = Enum.Font.GothamBold
laggerKey.TextXAlignment = Enum.TextXAlignment.Center
laggerKey.Parent = laggerFrame

-- Bottom stats
local statsFrame = Instance.new("Frame")
statsFrame.Name = "Stats"
statsFrame.Position = UDim2.new(0.05, 0, 0.97, 0)
statsFrame.Size = UDim2.new(0.9, 0, 0.02, 0)
statsFrame.BackgroundTransparency = 1
statsFrame.Parent = contentPanel

local stat1 = Instance.new("TextLabel")
stat1.Text = "0%"
stat1.Position = UDim2.new(0, 0, 0, 0)
stat1.Size = UDim2.new(0.3, 0, 1, 0)
stat1.BackgroundTransparency = 1
stat1.TextColor3 = Color3.fromRGB(100, 100, 100)
stat1.TextSize = 10
stat1.Font = Enum.Font.Gotham
stat1.TextXAlignment = Enum.TextXAlignment.Left
stat1.Parent = statsFrame

local stat2 = Instance.new("TextLabel")
stat2.Text = "Radius: 20"
stat2.Position = UDim2.new(0.5, 0, 0, 0)
stat2.Size = UDim2.new(0.5, 0, 1, 0)
stat2.BackgroundTransparency = 1
stat2.TextColor3 = Color3.fromRGB(100, 100, 100)
stat2.TextSize = 10
stat2.Font = Enum.Font.Gotham
stat2.TextXAlignment = Enum.TextXAlignment.Right
stat2.Parent = statsFrame

-- ===== RIGHT PANEL (Buttons) =====
local rightPanel = Instance.new("Frame")
rightPanel.Name = "RightPanel"
rightPanel.Position = UDim2.new(0.73, 0, 0.08, 0)
rightPanel.Size = UDim2.new(0.25, 0, 0.85, 0)
rightPanel.BackgroundTransparency = 1
rightPanel.Parent = screenGui

-- Button layout: 2 columns
local buttonConfigs = {
	{name = "DROP BR", text = "DROP\nBR", row = 0, col = 0},
	{name = "AUTO LEFT", text = "AUTO\nLEFT", row = 0, col = 1},
	{name = "AUTO BAT", text = "AUTO\nBAT", row = 1, col = 0},
	{name = "AUTO RIGHT", text = "AUTO\nRIGHT", row = 1, col = 1},
	{name = "TP DOWN", text = "TP\nDOWN", row = 2, col = 0},
	{name = "CARRY SPD", text = "CARRY\nSPEED", row = 2, col = 1},
	{name = "LAGGER MODE", text = "LAGGER\nMODE", row = 3, col = 0},
}

for _, config in ipairs(buttonConfigs) do
	local btn = Instance.new("TextButton")
	btn.Name = config.name
	btn.Text = config.text
	btn.Position = UDim2.new(config.col * 0.5, 8, config.row * 0.22, 8)
	btn.Size = UDim2.new(0.5, -16, 0.2, -16)
	btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.TextSize = 12
	btn.Font = Enum.Font.GothamBold
	btn.BorderSizePixel = 2
	btn.BorderColor3 = Color3.fromRGB(80, 80, 80)
	btn.Parent = rightPanel
	
	btn.MouseEnter:Connect(function()
		btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		btn.BorderColor3 = Color3.fromRGB(150, 150, 150)
	end)
	btn.MouseLeave:Connect(function()
		btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		btn.BorderColor3 = Color3.fromRGB(80, 80, 80)
	end)
	
	btn.MouseButton1Click:Connect(function()
		print(config.name .. " clicked")
	end)
end

print("Vyre Hub loaded successfully!")
