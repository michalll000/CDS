
local plr = game:GetService("Players").LocalPlayer
local PlayerGui = plr:WaitForChild("PlayerGui")
local customLoadingScreen = game:GetService('TeleportService'):GetArrivingTeleportGui()
if customLoadingScreen then
	customLoadingScreen.Parent = PlayerGui
	customLoadingScreen.Name = 'ATG'
	customLoadingScreen:WaitForChild('Frame').Info.Text = 'Loading place...'
	customLoadingScreen.DisplayOrder = 255
	game:GetService("ReplicatedFirst"):RemoveDefaultLoadingScreen()
end

local RS = game:GetService("RunService")
local loadingGui = script.IntroGUI:Clone()
local TweenService = game:GetService("TweenService")
local sg = game:GetService("StarterGui")
local ContentProvider = game:GetService("ContentProvider")
local UIS = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local PlayerScripts = plr:WaitForChild("PlayerScripts")

local PlayerControls = require(PlayerScripts:WaitForChild('PlayerModule')):GetControls()
local TouchGui

if not RS:IsStudio() or script.LaunchInStudio.Value then
	
	local mobile, rsu
	
	local fadeOutInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
	local fadeOutTween = TweenService:Create(loadingGui.Frame, fadeOutInfo, {BackgroundTransparency = 1})
	
	UIS.MouseIconEnabled = false
	--sg:SetCore("TopbarEnabled", false)
	local coreCall do
		local MAX_RETRIES = 100
	
		local StarterGui = game:GetService('StarterGui')
		local RunService = game:GetService('RunService')
	
		function coreCall(method, ...)
			local result = {}
			for retries = 1, MAX_RETRIES do
				result = {pcall(StarterGui[method], StarterGui, ...)}
				if result[1] then break end
				RunService.Stepped:Wait()
			end
			return unpack(result)
		end
	end
	coreCall('SetCore', 'TopbarEnabled', false)

	loadingGui.Parent = PlayerGui
	if customLoadingScreen then
		customLoadingScreen:Destroy()
	end
	local gg
	local l = true
	
	loadingGui.Event.Event:Connect(function() gg = true end)
	
	function go()
		--print('go')
		script.Parent:RemoveDefaultLoadingScreen()
		if l then
			-- PC/TELEFON
			if UIS.TouchEnabled and not UIS.KeyboardEnabled and not UIS.MouseEnabled and not GuiService:IsTenFootInterface() then
				mobile = true
				TouchGui = PlayerGui:WaitForChild("TouchGui")
			end
			
			if TouchGui and mobile then
				PlayerControls:Disable()
				TouchGui.Enabled = false
			end
			
			l = false
			--print("g")
			repeat wait() until gg
			--print("gg")
			if TouchGui and mobile then
				for _,v in pairs(TouchGui:GetDescendants()) do
					if v.Name == 'JumpButton' then
						v.Visible = false
					end
				end
			end
			wait(2)
			TweenService:Create(loadingGui.Frame.Loading, fadeOutInfo, {TextTransparency = 1}):Play()
			wait()
			fadeOutTween:Play()
			local s = loadingGui.Frame.Sound
			s.Name = 'MenuSound'
			s.Parent = PlayerGui
			s.TimePosition = 13.1
			s:Play()
			s.SOp.Disabled = false
			wait(1)
			loadingGui:Destroy()
		end
	end
	ContentProvider:PreloadAsync({loadingGui}, go)
end