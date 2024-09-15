--[[
Quest Handler

Written by EncodedScripts
--]]

-- Variables

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local QuestFolderRS = ReplicatedStorage:WaitForChild("Quest")

local QuestRemoteFunction = QuestFolderRS:WaitForChild("_QuestsMain")

local QuestFolder = script.Parent.Quests

local QuestMain = require(script.Parent.Quest_Server)

-- Functions

local function GetQuests()
	
	local Quests = {}
	
	for i,v in pairs(QuestFolder:GetChildren()) do
		if v:IsA("ModuleScript") then
			table.insert(Quests, v.Name)
		end
	end
	
	return Quests -- Just return the names not the instance of a module script - Bob :)
end

local function GetQuestInfo(Quest)
	return QuestMain:GetQuest(Quest)
end

local function InitPlayer(Player)
	return QuestMain:InitPlayer(Player)
end





local function Remote(Player, Args)
	local Command = Args[1]
	local Variables = Args[2]
	
	if Command == "GetQuests" then 
		return GetQuests()
	elseif Command == "GetQuest" then 
		return GetQuestInfo(Variables[1])
	end
	
end






-- Connections 

QuestRemoteFunction.OnServerInvoke = Remote
game.Players.PlayerAdded:Connect(InitPlayer)