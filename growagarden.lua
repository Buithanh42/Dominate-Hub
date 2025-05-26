print("hello")
wait(3)
print("Complete Loading")
--- local value = true

local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/daucobonhi/UiRedzV5/refs/heads/main/DemoUi.lua"))();

   local Windows = redzlib:MakeWindow({
	Title = "LH-HUB",
	SubTitle = "by Havanlong_",
	SaveFolder = "Blox Fruits.lua"
})
Windows:AddMinimizeButton({
  Button = { Image = "rbxassetid://80896980458454", BackgroundTransparency = 0 },
  Corner = { CornerRadius = UDim.new(0, 6) }
})

local dis = Windows:MakeTab({"Discord", "Info"})
local shop = Windows:MakeTab({"Shop", "Info"})
local Farm = Windows:MakeTab({"Main","Info"})
local tele = Windows:MakeTab({"Teleport", "Info"})

local selectedSeed = ""

local seedOptions = {
	"Carrot", "Stawberry", "Blueberry", "Orange Tulip", "Tomato", "Corn",
	"Daffodil", "Watermelon", "Pumpkin", "Apple", "Bamboo", "Coconut",
	"Cactus", "Dragon Fruit", "Mango", "Grape", "Mushroom", "Pepper",
	"Cacao", "Beanstalk"
}
local Paragraph = shop:AddParagraph({
	Title = "Buy Seeds",
	Desc = ""
   })

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
local Paragraph = shop:AddParagraph({
	Title = "Buy Gears",
	Desc = ""
   })

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

local Paragraph = shop:AddParagraph({
	Title = "Buy Eggs",
	Desc = ""
   })
   
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

local Paragraph = tele:AddParagraph({
	Title = "Teleport",
	Desc = ""
   })
   
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