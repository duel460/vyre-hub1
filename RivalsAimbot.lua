-- Rivals Aimbot Script
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")

-- Script variables
local aimbotEnabled = false
local targetPlayer = nil

-- Create main ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "RivalsAimbot"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

-- ===== MAIN PANEL (Small UI) =====
local mainPanel = Instance.new("Frame")
mainPanel.Name = "MainPanel"
mainPanel.Position = UDim2.new(0.05, 0, 0.05, 0)
mainPanel.Size = UDim2.new(0.15, 0, 0.12, 0)
mainPanel.BackgroundColor3 = Color3.fromRGB(20, 10, 30) -- Dark purple
mainPanel.BorderSizePixel = 2
mainPanel.BorderColor3 = Color3.fromRGB(150, 0, 255) -- Purple border
mainPanel.Parent = screenGui

-- Create rounded corners
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = mainPanel

-- Header
local header = Instance.new("TextLabel")
header.Name = "Header"
header.Text = "RIVALS"
header.Position = UDim2.new(0, 0, 0, 0)
header.Size = UDim2.new(1, 0, 0.3, 0)
header.BackgroundColor3 = Color3.fromRGB(30, 0, 60) -- Darker purple
header.BorderSizePixel = 0
header.TextColor3 = Color3.fromRGB(100, 200, 255) -- Blue text
header.TextSize = 14
header.Font = Enum.Font.GothamBold
header.Parent = mainPanel

-- Aimbot Button
local aimbotBtn = Instance.new("TextButton")
aimbotBtn.Name = "AimbotBtn"
aimbotBtn.Text = "AIMBOT: OFF"
aimbotBtn.Position = UDim2.new(0.05, 0, 0.35, 0)
aimbotBtn.Size = UDim2.new(0.9, 0, 0.55, 0)
aimbotBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0) -- Red (OFF)
aimbotBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
aimbotBtn.TextSize = 11
aimbotBtn.Font = Enum.Font.GothamBold
aimbotBtn.BorderSizePixel = 1
aimbotBtn.BorderColor3 = Color3.fromRGB(100, 200, 255) -- Blue border
aimbotBtn.Parent = mainPanel

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 6)
btnCorner.Parent = aimbotBtn

-- ===== AIMBOT FUNCTIONALITY =====

-- Function to find nearest player
local function getNearestPlayer()
	local nearestPlayer = nil
	local nearestDistance = math.huge
	
	for _, otherPlayer in pairs(Players:GetPlayers()) do
		if otherPlayer ~= player and otherPlayer.Character then
			local otherCharacter = otherPlayer.Character
			local otherHumanoid = otherCharacter:FindFirstChild("Humanoid")
			local otherRootPart = otherCharacter:FindFirstChild("HumanoidRootPart")
			
			if otherHumanoid and otherHumanoid.Health > 0 and otherRootPart then
				local distance = (humanoidRootPart.Position - otherRootPart.Position).Magnitude
				if distance < nearestDistance then
					nearestDistance = distance
					nearestPlayer = otherPlayer
				end
			end
		end
	end
	
	return nearestPlayer
end

-- Function to get player's head
local function getPlayerHead(targetPlayer)
	if targetPlayer and targetPlayer.Character then
		return targetPlayer.Character:FindFirstChild("Head")
	end
	return nil
end

-- Function to aim at player
local function aimAtPlayer(target)
	if target and target.Character then
		local targetHead = getPlayerHead(target)
		if targetHead then
			-- Aim at head
			humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position, targetHead.Position)
		end
	end
end

-- Function to attack player
local function attackPlayer(target)
	if target and target.Character then
		local targetHumanoid = target.Character:FindFirstChild("Humanoid")
		if targetHumanoid and targetHumanoid.Health > 0 then
			-- Find and equip any tool/weapon
			local tools = character:FindFirstChildOfClass("Tool")
			if not tools then
				-- Look for tools in backpack
				tools = player.Backpack:FindFirstChildOfClass("Tool")
				if tools then
					tools.Parent = character
					wait(0.1)
				end
			end
			
			-- Attack
			if tools then
				-- Activate tool if it has Activated function
				if tools:FindFirstChild("Handle") then
					-- Simulate clicking/attacking
					local targetHead = getPlayerHead(target)
					if targetHead then
						humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position, targetHead.Position)
						-- Use tool attack
						if tools:FindFirstChild("Activated") then
							tools.Activated:Fire()
						end
					end
				end
			end
		end
	end
end

-- Aimbot Loop
local aimbotLoop = nil

local function startAimbot()
	aimbotEnabled = true
	aimbotBtn.Text = "AIMBOT: ON"
	aimbotBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0) -- Green (ON)
	print("🎯 Aimbot: ENABLED")
	
	if aimbotLoop then
		aimbotLoop:Disconnect()
	end
	
	aimbotLoop = RunService.RenderStepped:Connect(function()
		if aimbotEnabled then
			targetPlayer = getNearestPlayer()
			
			if targetPlayer then
				-- Aim at target
				aimAtPlayer(targetPlayer)
				
				-- Attack target
				attackPlayer(targetPlayer)
			end
		end
	end)
end

local function stopAimbot()
	aimbotEnabled = false
	aimbotBtn.Text = "AIMBOT: OFF"
	aimbotBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0) -- Red (OFF)
	print("🎯 Aimbot: DISABLED")
	
	if aimbotLoop then
		aimbotLoop:Disconnect()
		aimbotLoop = nil
	end
	
	targetPlayer = nil
end

-- Toggle button
aimbotBtn.MouseButton1Click:Connect(function()
	if aimbotEnabled then
		stopAimbot()
	else
		startAimbot()
	end
end)

-- Hover effects
aimbotBtn.MouseEnter:Connect(function()
	aimbotBtn.TextSize = 12
end)
aimbotBtn.MouseLeave:Connect(function()
	aimbotBtn.TextSize = 11
end)

-- Cleanup on death
character.Humanoid.Died:Connect(function()
	stopAimbot()
end)

print("✅ Rivals Aimbot loaded successfully!")
