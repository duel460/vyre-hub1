-- Vyre Hub - Compact Button UI
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")

-- Script variables
local autoDuelEnabled = false
local aimBotEnabled = false
local rideDihEnabled = false
local speedEnabled = false
local speedValue = 55.5

-- Create main ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "VyreHub"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

-- ===== SPEED CONTROL UI =====
local speedControlUI = Instance.new("Frame")
speedControlUI.Name = "SpeedControlUI"
speedControlUI.Position = UDim2.new(0.35, 0, 0.3, 0)
speedControlUI.Size = UDim2.new(0.3, 0, 0.4, 0)
speedControlUI.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
speedControlUI.BorderSizePixel = 2
speedControlUI.BorderColor3 = Color3.fromRGB(100, 100, 100)
speedControlUI.Visible = false
speedControlUI.Parent = screenGui

-- Speed UI Header
local speedHeader = Instance.new("TextLabel")
speedHeader.Name = "Header"
speedHeader.Text = "SPEED CONTROL"
speedHeader.Position = UDim2.new(0, 0, 0, 0)
speedHeader.Size = UDim2.new(1, 0, 0.1, 0)
speedHeader.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
speedHeader.BorderSizePixel = 0
speedHeader.TextColor3 = Color3.fromRGB(255, 255, 255)
speedHeader.TextSize = 14
speedHeader.Font = Enum.Font.GothamBold
speedHeader.Parent = speedControlUI

-- Speed Value Label
local speedValueLabel = Instance.new("TextLabel")
speedValueLabel.Name = "ValueLabel"
speedValueLabel.Text = "Speed: " .. speedValue
speedValueLabel.Position = UDim2.new(0.1, 0, 0.15, 0)
speedValueLabel.Size = UDim2.new(0.8, 0, 0.15, 0)
speedValueLabel.BackgroundTransparency = 1
speedValueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
speedValueLabel.TextSize = 13
speedValueLabel.Font = Enum.Font.GothamBold
speedValueLabel.Parent = speedControlUI

-- Speed Input Box
local speedInput = Instance.new("TextBox")
speedInput.Name = "SpeedInput"
speedInput.Text = tostring(speedValue)
speedInput.Position = UDim2.new(0.1, 0, 0.35, 0)
speedInput.Size = UDim2.new(0.8, 0, 0.15, 0)
speedInput.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
speedInput.BorderSizePixel = 1
speedInput.BorderColor3 = Color3.fromRGB(100, 100, 100)
speedInput.TextColor3 = Color3.fromRGB(255, 255, 255)
speedInput.TextSize = 12
speedInput.Font = Enum.Font.Gotham
speedInput.Parent = speedControlUI

-- Speed Toggle Button
local speedToggleBtn = Instance.new("TextButton")
speedToggleBtn.Name = "ToggleBtn"
speedToggleBtn.Text = speedEnabled and "SPEED: ON" or "SPEED: OFF"
speedToggleBtn.Position = UDim2.new(0.1, 0, 0.55, 0)
speedToggleBtn.Size = UDim2.new(0.8, 0, 0.15, 0)
speedToggleBtn.BackgroundColor3 = speedEnabled and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(150, 0, 0)
speedToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
speedToggleBtn.TextSize = 12
speedToggleBtn.Font = Enum.Font.GothamBold
speedToggleBtn.BorderSizePixel = 1
speedToggleBtn.BorderColor3 = Color3.fromRGB(100, 100, 100)
speedToggleBtn.Parent = speedControlUI

speedToggleBtn.MouseButton1Click:Connect(function()
	speedEnabled = not speedEnabled
	speedToggleBtn.Text = speedEnabled and "SPEED: ON" or "SPEED: OFF"
	speedToggleBtn.BackgroundColor3 = speedEnabled and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(150, 0, 0)
	if speedEnabled then
		print("⚡ Speed: ENABLED (" .. speedValue .. ")")
	else
		print("⚡ Speed: DISABLED")
	end
end)

-- Close Button
local closeSpeedBtn = Instance.new("TextButton")
closeSpeedBtn.Name = "CloseBtn"
closeSpeedBtn.Text = "X"
closeSpeedBtn.Position = UDim2.new(0.88, 0, 0.01, 0)
closeSpeedBtn.Size = UDim2.new(0.1, 0, 0.08, 0)
closeSpeedBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeSpeedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeSpeedBtn.TextSize = 12
closeSpeedBtn.Font = Enum.Font.GothamBold
closeSpeedBtn.BorderSizePixel = 0
closeSpeedBtn.Parent = speedControlUI

closeSpeedBtn.MouseButton1Click:Connect(function()
	speedControlUI.Visible = false
end)

-- Update speed value when input changes
speedInput.FocusLost:Connect(function()
	local newSpeed = tonumber(speedInput.Text)
	if newSpeed then
		speedValue = newSpeed
		speedValueLabel.Text = "Speed: " .. speedValue
		print("Speed value updated to: " .. speedValue)
	else
		speedInput.Text = tostring(speedValue)
	end
end)

-- ===== RIGHT PANEL (Buttons Only) =====
local rightPanel = Instance.new("Frame")
rightPanel.Name = "RightPanel"
rightPanel.Position = UDim2.new(0.75, 0, 0.1, 0)
rightPanel.Size = UDim2.new(0.22, 0, 0.8, 0)
rightPanel.BackgroundTransparency = 1
rightPanel.Parent = screenGui

-- Function to create rounded button
local function createRoundedButton(parent, name, text, row, col)
	local btn = Instance.new("TextButton")
	btn.Name = name
	btn.Text = text
	btn.Position = UDim2.new(col * 0.5, 8, row * 0.25, 8)
	btn.Size = UDim2.new(0.5, -16, 0.22, -16)
	btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.TextSize = 13
	btn.Font = Enum.Font.GothamBold
	btn.BorderSizePixel = 0
	btn.Parent = parent
	
	-- Create rounded corners using UICorner
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 12)
	corner.Parent = btn
	
	-- Hover effects
	btn.MouseEnter:Connect(function()
		btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	end)
	btn.MouseLeave:Connect(function()
		btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	end)
	
	return btn
end

-- ===== FUNCTIONALITY =====

-- Auto Duel Function
local function toggleAutoDuel()
	autoDuelEnabled = not autoDuelEnabled
	if autoDuelEnabled then
		print("⚔️ Auto Duel: ENABLED")
		-- Find opponent base and steal brainrot
		-- Then return to your base and win
	else
		print("⚔️ Auto Duel: DISABLED")
	end
end

-- Aim Bot Function
local function toggleAimBot()
	aimBotEnabled = not aimBotEnabled
	if aimBotEnabled then
		print("🎯 Aim Bot: ENABLED")
		-- Take to opponent, equip bat, hit them to prevent winning
	else
		print("🎯 Aim Bot: DISABLED")
	end
end

-- Ride Dih Function
local function toggleRideDih()
	rideDihEnabled = not rideDihEnabled
	if rideDihEnabled then
		print("⬆️⬇️ Ride Dih: ENABLED")
		-- Move up and down loop
		task.spawn(function()
			while rideDihEnabled do
				humanoidRootPart.CFrame = humanoidRootPart.CFrame + Vector3.new(0, 2, 0)
				wait(0.1)
				humanoidRootPart.CFrame = humanoidRootPart.CFrame - Vector3.new(0, 2, 0)
				wait(0.1)
			end
		end)
	else
		print("⬆️⬇️ Ride Dih: DISABLED")
	end
end

-- Open Speed Control UI
local function openSpeedControl()
	speedControlUI.Visible = true
	print("📊 Speed Control UI Opened")
end

-- Create buttons
local autoDuelBtn = createRoundedButton(rightPanel, "AutoDuel", "AUTO\nDUEL", 0, 0)
autoDuelBtn.MouseButton1Click:Connect(toggleAutoDuel)

local aimBotBtn = createRoundedButton(rightPanel, "AimBot", "AIM\nBOT", 0, 1)
aimBotBtn.MouseButton1Click:Connect(toggleAimBot)

local rideDihBtn = createRoundedButton(rightPanel, "RideDih", "RIDE\nDIH", 1, 0)
rideDihBtn.MouseButton1Click:Connect(toggleRideDih)

local carrySpeedBtn = createRoundedButton(rightPanel, "CarrySpeed", "CARRY\nSPD", 1, 1)
carrySpeedBtn.MouseButton1Click:Connect(openSpeedControl)

local speedBtn = createRoundedButton(rightPanel, "Speed", "SPEED", 2, 0)
speedBtn.MouseButton1Click:Connect(openSpeedControl)

print("✅ Vyre Hub loaded successfully!")
