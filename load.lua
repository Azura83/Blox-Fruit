local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "LoadingScreen"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player:WaitForChild("PlayerGui")

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0.45, 0, 0.38, 0)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = ScreenGui
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 12)

-- Drop Shadow
local shadow = Instance.new("ImageLabel")
shadow.BackgroundTransparency = 1
shadow.Position = UDim2.new(-0.05, 0, -0.05, 0)
shadow.Size = UDim2.new(1.1, 0, 1.1, 0)
shadow.Image = "rbxassetid://1316045217"
shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
shadow.ImageTransparency = 0.6
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(10, 10, 118, 118)
shadow.ZIndex = -1
shadow.Parent = mainFrame

-- Username
local usernameText = Instance.new("TextLabel")
usernameText.Size = UDim2.new(1, -20, 0.15, 0)
usernameText.Position = UDim2.new(0, 10, 0, 10)
usernameText.BackgroundTransparency = 1
usernameText.Text = "Welcome, " .. player.Name
usernameText.TextColor3 = Color3.fromRGB(255, 255, 255)
usernameText.Font = Enum.Font.GothamBold
usernameText.TextScaled = true
usernameText.Parent = mainFrame

-- "Loading Script..."
local loadingText = Instance.new("TextLabel")
loadingText.Size = UDim2.new(1, -20, 0.15, 0)
loadingText.Position = UDim2.new(0, 10, 0.20, 0)
loadingText.BackgroundTransparency = 1
loadingText.Text = "Loading Script..."
loadingText.TextColor3 = Color3.fromRGB(100, 200, 255)
loadingText.Font = Enum.Font.GothamSemibold
loadingText.TextScaled = true
loadingText.Parent = mainFrame

-- Percentage
local percentageText = Instance.new("TextLabel")
percentageText.Size = UDim2.new(1, -20, 0.15, 0)
percentageText.Position = UDim2.new(0, 10, 0.37, 0)
percentageText.BackgroundTransparency = 1
percentageText.Text = "Progress: 0%"
percentageText.TextColor3 = Color3.fromRGB(255, 255, 255)
percentageText.Font = Enum.Font.Gotham
percentageText.TextScaled = true
percentageText.Parent = mainFrame

-- Progress Bar Background
local barBG = Instance.new("Frame")
barBG.Size = UDim2.new(0.9, 0, 0.12, 0)
barBG.Position = UDim2.new(0.05, 0, 0.56, 0)
barBG.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
barBG.BorderSizePixel = 0
barBG.Parent = mainFrame
Instance.new("UICorner", barBG).CornerRadius = UDim.new(0, 10)

-- Progress Bar Fill
local progressBar = Instance.new("Frame")
progressBar.Size = UDim2.new(0, 0, 1, 0)
progressBar.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
progressBar.BorderSizePixel = 0
progressBar.Parent = barBG
Instance.new("UICorner", progressBar).CornerRadius = UDim.new(0, 10)

-- Gradient for Bar
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 180))
}
gradient.Rotation = 45
gradient.Parent = progressBar

-- Run Script Button
local finishButton = Instance.new("TextButton")
finishButton.Size = UDim2.new(0.5, 0, 0.15, 0)
finishButton.Position = UDim2.new(0.25, 0, 0.75, 0)
finishButton.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
finishButton.Text = "Run Script"
finishButton.TextColor3 = Color3.fromRGB(255, 255, 255)
finishButton.TextScaled = true
finishButton.Font = Enum.Font.GothamBold
finishButton.Visible = false
finishButton.Parent = mainFrame
Instance.new("UICorner", finishButton).CornerRadius = UDim.new(0, 10)

finishButton.MouseButton1Click:Connect(function()
	print("Run button clicked!") -- Replace this with real script functionality if needed
end)

-- Bottom Signature
local signature = Instance.new("TextLabel")
signature.Size = UDim2.new(1, 0, 0.05, 0)
signature.Position = UDim2.new(0, 0, 1, 5)
signature.BackgroundTransparency = 1
signature.Text = "Script by AzuraDev"
signature.TextColor3 = Color3.fromRGB(120, 120, 120)
signature.Font = Enum.Font.Gotham
signature.TextScaled = true
signature.Parent = mainFrame

-- Loading Logic (faster: 60 to 90 seconds)
local targetDuration = math.random(60, 90)
local elapsedTime = 0
local updateInterval = 0.1

while elapsedTime < targetDuration do
	task.wait(updateInterval)
	elapsedTime += updateInterval
	local percent = math.clamp((elapsedTime / targetDuration) * 100, 0, 100)
	progressBar:TweenSize(UDim2.new(percent / 100, 0, 1, 0), "Out", "Quad", 0.1, true)
	percentageText.Text = string.format("Progress: %d%%", math.floor(percent))
end

percentageText.Text = "Script Ready!"
finishButton.Visible = true
