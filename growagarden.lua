-- Tạo GUI
local ScreenGui = Instance.new("ScreenGui")
local TextLabel1 = Instance.new("TextLabel")
local TextLabel2 = Instance.new("TextLabel")

-- Cấu hình ScreenGui
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Cấu hình TextLabel1 (LONG HUY HUB)
TextLabel1.Parent = ScreenGui
TextLabel1.Size = UDim2.new(0.6, 0, 0.1, 0)
TextLabel1.Position = UDim2.new(0.2, 0, 0.4, 0)
TextLabel1.BackgroundTransparency = 1
TextLabel1.Text = "LONG HUY HUB"
TextLabel1.TextSize = 50
TextLabel1.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel1.Font = Enum.Font.SourceSansBold

-- Cấu hình TextLabel2 (DEV: HAVANLONG)
TextLabel2.Parent = ScreenGui
TextLabel2.Size = UDim2.new(0.6, 0, 0.1, 0)
TextLabel2.Position = UDim2.new(0.2, 0, 0.5, 0)
TextLabel2.BackgroundTransparency = 1
TextLabel2.Text = "DEV: HAVANLONG"
TextLabel2.TextSize = 30
TextLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel2.Font = Enum.Font.SourceSansBold

-- Tự động ẩn GUI sau 4 giây
task.wait(4)
ScreenGui:Destroy()

print("hello")
wait(3)
print("Complete Loading")
--- local value = true

local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/daucobonhi/UiRedzV5/refs/heads/main/DemoUi.lua"))();

   local Windows = redzlib:MakeWindow({
	Title = "LH-HUB | GAG",
	SubTitle = "by Havanlong_",
	SaveFolder = "GAG.lua"
})
Windows:AddMinimizeButton({
  Button = { Image = "rbxassetid://80896980458454", BackgroundTransparency = 0 },
  Corner = { CornerRadius = UDim.new(0, 6) }
})

local dis = Windows:MakeTab({"Discord", "Info"})
local shop = Windows:MakeTab({"Shop", "Info"})
local Farm = Windows:MakeTab({"Main","Info"})
local tele = Windows:MakeTab({"Teleport", "Info"})

local _Discord = dis do
  _Discord:AddDiscordInvite({
    Name = "LongHuy Hub | Community",
    Description = "Join our discord community to receive information about the next update",
    Logo = "rbxassetid://80896980458454",
    Invite = "https://discord.gg/sTxk5pjc"
  })
end

local selectedSeed = ""

local seedOptions = {
	"Carrot", "Strawberry", "Blueberry", "Orange Tulip", "Tomato", "Corn",
	"Daffodil", "Watermelon", "Pumpkin", "Apple", "Bamboo", "Coconut",
	"Cactus", "Dragon Fruit", "Mango", "Grape", "Mushroom", "Pepper",
	"Cacao", "Beanstalk"
}
shop:AddSection("Buy Seeds")

shop:AddDropdown({
	Name = "Select Seeds",
	Default = false,
	Options = seedOptions,
	Callback = function(selected)
		selectedSeed = selected
	end
})

local autoBuyEnabled = false

shop:AddToggle({
	Name = "Auto buy",
	Default = false,
	Callback = function(state)
		autoBuyEnabled = state
		while autoBuyEnabled do
			if selectedSeed ~= "" then
				local args = { selectedSeed }
				game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("BuySeedStock"):FireServer(unpack(args))
			end
			wait(1)
		end
	end
})

local selectedGears = ""

local gearOptions = {
	"Watering Can", "Trowel", "Lightning Rod", "Harvest Tool", "Basic Sprinkler", "Advanced Sprinkler",
	"Godly Sprinkler", "Master Sprinkler", "Favorite Tool", "Recall Wrench"
}
shop:AddSection("Buy Gears")

shop:AddDropdown({
	Name = "Select Gears",
	Default = false,
	Options = gearOptions,
	Callback = function(Tool)
		selectedGears = Tool
	end
})

local autoBuyGear = false

shop:AddToggle({
	Name = "Auto Buy Gears",
	Default = false,
	Callback = function(state)
		autoBuyGear = state
		while autoBuyGear do
			if selectedGears ~= "" then
				local args = { selectedGears }
				game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("BuyGearStock"):FireServer(unpack(args))
			end
			wait(1)
		end
	end
})

shop:AddSection("Buy Eggs")
   
local selectedEggOrder = nil

shop:AddDropdown({
	Name = "Selected Eggs",
	Default = false,
	Options = { "1", "2", "3" },
	Callback = function(order)
		selectedEggOrder = tonumber(order)
	end
})

local autoBuyEggsEnabled = false

shop:AddToggle({
	Name = "Auto Buy Eggs",
	Default = false,
	Callback = function(state)
		autoBuyEggsEnabled = state
		while autoBuyEggsEnabled do
			if selectedEggOrder then
				local args = { selectedEggOrder }
				game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("BuyPetEgg"):FireServer(unpack(args))
			end
			wait(1)
		end
	end
})

tele:AddSection("Teleport")
   
tele:AddButton({
	Name = "Sell",
	Callback = function()
		local player = game.Players.LocalPlayer
		if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			player.Character.HumanoidRootPart.CFrame = CFrame.new(86.582, 3.000, 0.427)
		end
	end
})

tele:AddButton({
	Name = "My Garden",
	Callback = function()
		local player = game.Players.LocalPlayer
		if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			player.Character.HumanoidRootPart.CFrame = CFrame.new(33.371, 3.000, -64.727)
		end
	end
})

tele:AddButton({
	Name = "Gear shop",
	Callback = function()
		local player = game.Players.LocalPlayer
		if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			player.Character.HumanoidRootPart.CFrame = CFrame.new(-284.415, 3.000, -32.978)
		end
	end
})

tele:AddButton({
	Name = "Eggs Shop",
	Callback = function()
		local player = game.Players.LocalPlayer
		if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			player.Character.HumanoidRootPart.CFrame = CFrame.new(-284.363, 3.000, -2.677)
		end
	end
})

local selectedSeed = ""
local plantingPosition = nil
Farm:AddSection("Auto Plant Position")
   
Farm:AddDropdown({
	Name = "Select Seed",
	Default = false,
	Options = {
		"Carrot", "Strawberry", "Blueberry", "Orange Tulip", "Tomato", "Corn",
		"Daffodil", "Watermelon", "Pumpkin", "Apple", "Bamboo", "Coconut",
		"Cactus", "Dragon Fruit", "Mango", "Grape", "Mushroom", "Pepper",
		"Cacao", "Beanstalk"
	},
	Callback = function(seed)
		selectedSeed = seed
	end
})

local function createNotify(title, text, iconId, duration)
	local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "CustomNotifyGui"
	screenGui.ResetOnSpawn = false
	screenGui.Parent = PlayerGui
	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(0, 300, 0, 80)
	frame.Position = UDim2.new(1, -120, 1, -120)
	frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	frame.BackgroundTransparency = 0.2
	frame.BorderSizePixel = 0
	frame.Parent = screenGui
	frame.AnchorPoint = Vector2.new(1, 1)
	local icon = Instance.new("ImageLabel")
	icon.Size = UDim2.new(0, 50, 0, 50)
	icon.Position = UDim2.new(0, 10, 0.5, -25)
	icon.BackgroundTransparency = 1
	icon.Image = "rbxassetid://" .. tostring(iconId)
	icon.Parent = frame
	local titleLabel = Instance.new("TextLabel")
	titleLabel.Size = UDim2.new(1, -70, 0, 25)
	titleLabel.Position = UDim2.new(0, 70, 0, 10)
	titleLabel.BackgroundTransparency = 1
	titleLabel.Text = title
	titleLabel.TextColor3 = Color3.new(1,1,1)
	titleLabel.Font = Enum.Font.SourceSansBold
	titleLabel.TextSize = 20
	titleLabel.TextXAlignment = Enum.TextXAlignment.Left
	titleLabel.Parent = frame
	local textLabel = Instance.new("TextLabel")
	textLabel.Size = UDim2.new(1, -70, 0, 40)
	textLabel.Position = UDim2.new(0, 70, 0, 35)
	textLabel.BackgroundTransparency = 1
	textLabel.Text = text
	textLabel.TextColor3 = Color3.new(1,1,1)
	textLabel.Font = Enum.Font.SourceSans
	textLabel.TextSize = 16
	textLabel.TextWrapped = true
	textLabel.Parent = frame
	delay(duration or 3, function()
		screenGui:Destroy()
	end)
end

Farm:AddButton({
	Name = "Set Position",
	Callback = function()
		local player = game.Players.LocalPlayer
		if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			plantingPosition = player.Character.HumanoidRootPart.Position
			createNotify("Position Saved", "Planting Position set to: " .. tostring(plantingPosition), 80896980458454, 3)
		end
	end
})

local autoPlantEnabled = false
Farm:AddToggle({
	Name = "Auto Plant",
	Default = false,
	Callback = function(state)
		autoPlantEnabled = state
		while autoPlantEnabled do
			if selectedSeed ~= "" and plantingPosition then
				local args = {
					Vector3.new(plantingPosition.X, plantingPosition.Y, plantingPosition.Z),
					selectedSeed
				}
				game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("Plant_RE"):FireServer(unpack(args))
			end
			wait(1)
		end
	end
})

local selectedSeed = ""
Farm:AddSection("Auto Plant")
 
Farm:AddDropdown({
	Name = "Selected Seeds",
	Default = false,
	Options = {
		"Carrot", "Strawberry", "Blueberry", "Orange Tulip", "Tomato", "Corn",
		"Daffodil", "Watermelon", "Pumpkin", "Apple", "Bamboo", "Coconut",
		"Cactus", "Dragon Fruit", "Mango", "Grape", "Mushroom", "Pepper",
		"Cacao", "Beanstalk"
	},
	Callback = function(seed)
		selectedSeed = seed
	end
})

local autoPlantEnabled = false

Farm:AddToggle({
	Name = "Auto Plant",
	Default = false,
	Callback = function(state)
		autoPlantEnabled = state
		while autoPlantEnabled do
			if selectedSeed ~= "" then
				local player = game.Players.LocalPlayer
				if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
					local currentPosition = player.Character.HumanoidRootPart.Position
					local args = {
						Vector3.new(currentPosition.X, currentPosition.Y, currentPosition.Z),
						selectedSeed
					}
					game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("Plant_RE"):FireServer(unpack(args))
				end
			end
			wait(0.000001)
		end
	end
})
Farm:AddSection("Auto Sell")

local autoSellEnabled = false

Farm:AddToggle({
    Name = "Auto Sell",
    Default = false,
    Callback = function(state)
        autoSellEnabled = state
        while autoSellEnabled do
            local player = game.Players.LocalPlayer
            if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                player.Character.HumanoidRootPart.CFrame = CFrame.new(86.582, 3.000, 0.427)
                wait(1)
                game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("Sell_Inventory"):FireServer()
            end
            wait(1)
        end
    end
})