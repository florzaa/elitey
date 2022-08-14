local m2z = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local RenDoors = Instance.new("TextLabel")
local Toggle = Instance.new("TextButton")
local Line = Instance.new("TextLabel")

m2z.Name = "m2z"
m2z.Parent = game:GetService("CoreGui")
m2z.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
m2z.ResetOnSpawn = false

Main.Name = "Main"
Main.Parent = m2z
Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.282945722, 0, 0.206854358, 0)
Main.Size = UDim2.new(0, 559, 0, 479)

Title.Name = "Title"
Title.Parent = Main
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.0196779966, 0, 0.0125260958, 0)
Title.Size = UDim2.new(0, 186, 0, 15)
Title.Font = Enum.Font.Code
Title.Text = "m2z - Prison Life"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14.000
Title.TextXAlignment = Enum.TextXAlignment.Left

RenDoors.Name = "RenDoors"
RenDoors.Parent = Main
RenDoors.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RenDoors.BackgroundTransparency = 1.000
RenDoors.BorderSizePixel = 0
RenDoors.Position = UDim2.new(0.0196779966, 0, 0.0772442594, 0)
RenDoors.Size = UDim2.new(0, 103, 0, 15)
RenDoors.Font = Enum.Font.SourceSans
RenDoors.Text = "Remove Doors"
RenDoors.TextColor3 = Color3.fromRGB(255, 255, 255)
RenDoors.TextSize = 14.000
RenDoors.TextXAlignment = Enum.TextXAlignment.Left

Toggle.Name = "Toggle"
Toggle.Parent = RenDoors
Toggle.BackgroundColor3 = Color3.fromRGB(238, 0, 3)
Toggle.BorderSizePixel = 0
Toggle.Position = UDim2.new(0.769999981, 0, 0.289999992, 0)
Toggle.Size = UDim2.new(0, 10, 0, 9)
Toggle.Font = Enum.Font.SourceSans
Toggle.Text = ""
Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
Toggle.TextSize = 14.000

Line.Name = "Line"
Line.Parent = Main
Line.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
Line.BorderSizePixel = 0
Line.Position = UDim2.new(0, 0, 0.0563674346, 0)
Line.Size = UDim2.new(0, 559, 0, 2)
Line.Font = Enum.Font.Code
Line.Text = ""
Line.TextColor3 = Color3.fromRGB(255, 255, 255)
Line.TextSize = 14.000
Line.TextXAlignment = Enum.TextXAlignment.Left

local function CMHNY_fake_script() 
	local script = Instance.new('LocalScript', RenDoors)

	local Toggle = script.Parent.Toggle
	local Bool = false
	
	function EX()
		if Bool then
			local Doors = game:GetService("Workspace").Doors
			for _, Door in pairs(Doors:GetDescendants()) do
				if Door:IsA("Part") or Door:IsA("Union") then
					Door.Transparency = 1
				end
			end
		else
			local Doors = game:GetService("Workspace").Doors
			for _, Door in pairs(Doors:GetDescendants()) do
				if Door:IsA("Part") or Door:IsA("Union") then
					Door.Transparency = 0
				end
			end
		end
	end
	
	Toggle.MouseButton1Down:Connect(function()
		if Bool then
			Toggle.BackgroundColor3 = Color3.fromRGB(238, 0, 3)
			Bool = false
			EX()
		else
			Toggle.BackgroundColor3 = Color3.fromRGB(44, 206, 0)
			Bool = true
			EX()
		end
	end)
end
coroutine.wrap(CMHNY_fake_script)()

local function KDKU_fake_script()
	local script = Instance.new('LocalScript', m2z)

	local UserInputService = game:GetService("UserInputService")
	
	local gui = script.Parent.Main
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end
coroutine.wrap(KDKU_fake_script)()
