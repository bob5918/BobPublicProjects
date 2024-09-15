local Quests = {}

-- Variables
local QuestFolder = script.Parent:FindFirstChild("Quests")



-- Functions

function Quests:InitPlayer(Player)
	if Player:FindFirstChild("Quests") then 
		-- Already Init
		return false
	else 
		local QuestDataFolder = Instance.new("Folder")
		QuestDataFolder.Name = "Quests"
		QuestDataFolder.Parent = Player
		
		-- Datastore babble
		
		return true
	end
end

function Quests:GetQuest(Quest)
	if QuestFolder:FindFirstChild(Quest) then 
		return require(QuestFolder:FindFirstChild(Quest)):GetInfo()
	else
		return false;
	end
end

function Quests:StartQuest(Player, Quest)
	
	local QuestData = Quests:GetQuest(Quest)

	
	if QuestData then 
		return require(QuestFolder:FindFirstChild(Quest)):StartQuest(Player)				
	else
		return false
	end
	
end

function Quests:CompleteObjective(Player, Quest)
	local QuestData = Quests:GetQuest(Quest)


	if QuestData then 
		return require(QuestFolder:FindFirstChild(Quest)):CompleteObjective(Player)	
	else
		return false
	end
end

return Quests
