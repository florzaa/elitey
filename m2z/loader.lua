if game.PlaceId == 155615604 then
  -- Prison Life
  loadstring(game:HttpGet("https://elitey.cf/m2z/gids/155615604.lua"), true)()
else
  local Loader = Instance.new("ScreenGui")
  local Main = Instance.new("Frame")
  local Title = Instance.new("TextLabel")
  local Line = Instance.new("TextLabel")
  local LoadFail = Instance.new("TextLabel")
  local LoadFailURL = Instance.new("TextLabel")

  Loader.Name = "Loader"
  Loader.Parent = game:GetService("CoreGui")
  Loader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
  Loader.ResetOnSpawn = false

  Main.Name = "Main"
  Main.Parent = Loader
  Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
  Main.BorderSizePixel = 0
  Main.Position = UDim2.new(0.359125018, 0, 0.308445543, 0)
  Main.Size = UDim2.new(0, 363, 0, 312)

  Title.Name = "Title"
  Title.Parent = Main
  Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  Title.BackgroundTransparency = 1.000
  Title.BorderSizePixel = 0
  Title.Position = UDim2.new(0.0196779966, 0, 0.0125260958, 0)
  Title.Size = UDim2.new(0, 186, 0, 15)
  Title.Font = Enum.Font.Code
  Title.Text = "m2z Loader"
  Title.TextColor3 = Color3.fromRGB(255, 255, 255)
  Title.TextSize = 14.000
  Title.TextXAlignment = Enum.TextXAlignment.Left

  Line.Name = "Line"
  Line.Parent = Main
  Line.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
  Line.BorderSizePixel = 0
  Line.Position = UDim2.new(0, 0, 0.0789999813, 0)
  Line.Size = UDim2.new(0, 363, 0, 2)
  Line.Font = Enum.Font.Code
  Line.Text = ""
  Line.TextColor3 = Color3.fromRGB(255, 255, 255)
  Line.TextSize = 14.000
  Line.TextXAlignment = Enum.TextXAlignment.Left

  LoadFail.Name = "LoadFail"
  LoadFail.Parent = Main
  LoadFail.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  LoadFail.BackgroundTransparency = 1.000
  LoadFail.BorderSizePixel = 0
  LoadFail.Position = UDim2.new(-0.0177023821, 0, 0.364641815, 0)
  LoadFail.Size = UDim2.new(0, 376, 0, 32)
  LoadFail.Font = Enum.Font.Code
  LoadFail.Text = "m2z does not support this game! For a list of supported games visit"
  LoadFail.TextColor3 = Color3.fromRGB(255, 255, 255)
  LoadFail.TextSize = 14.000
  LoadFail.TextWrapped = true

  LoadFailURL.Name = "LoadFailURL"
  LoadFailURL.Parent = Main
  LoadFailURL.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  LoadFailURL.BackgroundTransparency = 1.000
  LoadFailURL.BorderSizePixel = 0
  LoadFailURL.Position = UDim2.new(-0.0177023821, 0, 0.459584951, 0)
  LoadFailURL.Size = UDim2.new(0, 376, 0, 32)
  LoadFailURL.Font = Enum.Font.Code
  LoadFailURL.Text = "https://elitey.cf/m2z"
  LoadFailURL.TextColor3 = Color3.fromRGB(255, 255, 255)
  LoadFailURL.TextSize = 14.000
  LoadFailURL.TextWrapped = true

  local function MIEVSNL_fake_script()
    local script = Instance.new('LocalScript', Loader)

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
  coroutine.wrap(MIEVSNL_fake_script)()
end
