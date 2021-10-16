-- /// PSR HUB - Starter Config /// Made by CodeDel ///

-- // Main config and indexes //

--game:GetService("StarterGui"):SetCore("TopbarEnabled", false) -- Wył. Topbar

spawn(function()
	--[[local s, e = pcall(function()
		game:GetService('ContentProvider'):PreloadAsync(game:GetService('ReplicatedFirst'))
	end)
	if s then
		game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("IntroGUI").Event:Fire()
	else
		game:GetService("Players").LocalPlayer:Kick("Wystąpił błąd S:CP")
	end]]
	
	local s, e = pcall(function()
		game:GetService('ContentProvider'):PreloadAsync(game:GetService('ReplicatedStorage'))
	end)
end)

local s, e = pcall(function()
	game:GetService('ContentProvider'):PreloadAsync(game:GetService('PlayerGui'))
end)

game.Lighting:WaitForChild('White').Enabled = true

if not game:GetService("RunService"):IsStudio() or script.Parent:WaitForChild('Intro'):WaitForChild('LaunchInStudio').Value == true then
	print('ok')
	game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("IntroGUI").Event:Fire()
end

-- // coreCalls - SetCore //

local coreCall do
	local MAX_RETRIES = 100

	local StarterGui = game:GetService('StarterGui')
	local RunService = game:GetService('RunService')

	function coreCall(method, ...)
		local result = {}
		for retries = 1, MAX_RETRIES do
			result = {pcall(StarterGui[method], StarterGui, ...)}
			if result[1] then
				break
			end
			RunService.Stepped:Wait()
		end
		return unpack(result)
	end
end

coreCall('SetCore', 'PointsNotificationsActive', false)

local coreCall do
	local MAX_RETRIES = 100

	local StarterGui = game:GetService('StarterGui')
	local RunService = game:GetService('RunService')

	function coreCall(method, ...)
		local result = {}
		for retries = 1, MAX_RETRIES do
			result = {pcall(StarterGui[method], StarterGui, ...)}
			if result[1] then
				break
			end
			RunService.Stepped:Wait()
		end
		return unpack(result)
	end
end

coreCall('SetCore', 'BadgesNotificationsActive', true)

local coreCall do
	local MAX_RETRIES = 100

	local StarterGui = game:GetService('StarterGui')
	local RunService = game:GetService('RunService')

	function coreCall(method, ...)
		local result = {}
		for retries = 1, MAX_RETRIES do
			result = {pcall(StarterGui[method], StarterGui, ...)}
			if result[1] then
				break
			end
			RunService.Stepped:Wait()
		end
		return unpack(result)
	end
end

coreCall('SetCore', 'ChatBarDisabled', true)

local coreCall do
	local MAX_RETRIES = 100

	local StarterGui = game:GetService('StarterGui')
	local RunService = game:GetService('RunService')

	function coreCall(method, ...)
		local result = {}
		for retries = 1, MAX_RETRIES do
			result = {pcall(StarterGui[method], StarterGui, ...)}
			if result[1] then
				break
			end
			RunService.Stepped:Wait()
		end
		return unpack(result)
	end
end

coreCall('SetCore', 'AvatarContextMenuEnabled', false)

local coreCall do
	local MAX_RETRIES = 100

	local StarterGui = game:GetService('StarterGui')
	local RunService = game:GetService('RunService')

	function coreCall(method, ...)
		local result = {}
		for retries = 1, MAX_RETRIES do
			result = {pcall(StarterGui[method], StarterGui, ...)}
			if result[1] then
				break
			end
			RunService.Stepped:Wait()
		end
		return unpack(result)
	end
end

coreCall('SetCore', 'ResetButtonCallback', false)


-- // coreCalls - GuiService //

local coreCall do
	local MAX_RETRIES = 100

	local GuiService = game:GetService('GuiService')
	local RunService = game:GetService('RunService')

	function coreCall(method, ...)
		local result = {}
		for retries = 1, MAX_RETRIES do
			result = {pcall(GuiService[method], GuiService, ...)}
			if result[1] then
				break
			end
			RunService.Stepped:Wait()
		end
		return unpack(result)
	end
end

coreCall('SetInspectMenuEnabled', false)

--game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack,false)

-- // Loading UI //
local plrs = game:GetService("Players")
local plr = plrs.LocalPlayer
local pg = plr:WaitForChild("PlayerGui")

--game:GetService("ReplicatedFirst"):RemoveDefaultLoadingScreen() -- Custom Loading Screen

--print(game:GetService("GuiService"):GetGuiInset())

script:Destroy()