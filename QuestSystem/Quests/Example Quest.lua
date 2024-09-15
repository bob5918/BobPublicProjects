local Quest = {
	["QuestName"] = script.Name,
	["Objectives"] = 5,
	["Description"] = "This quest is an example quest! In order to complete you must pick up 5 golden apples. "
}




local function ObjectiveAdded(Player) -- Fired when a player were to trigger a objective added or completed
	
end

local function QuestCompleted(Player) -- Fired When a quest is completed
	local Hint = workspace:FindFirstChild("Hint")
	Hint.Message = "You completed the golden apple quest!! :)"
	task.wait(3)
	Hint:Destroy()
	
end

local function QuestStarted(Player) -- Fired when a quest has started
	
end







-- Ignore Down Below Aris :)


function Quest:CompleteObjective(Player)
	if Player:FindFirstChild("Quests") then
		if Player.Quests:FindFirstChild(Quest.QuestName) then 
			
			if Player.Quests:FindFirstChild(Quest.QuestName).Finished.Value == true then return false end
			
			
			Player.Quests:FindFirstChild(Quest.QuestName).ObjectivesCompleted.Value += 1
			
			
			if Player.Quests:FindFirstChild(Quest.QuestName).ObjectivesCompleted.Value >= Quest.Objectives then 
				return Quest:CompleteQuest(Player)
			end
				
			ObjectiveAdded(Player)
					
			return Player.Quests:FindFirstChild(Quest.QuestName).ObjectivesCompleted.Value
			
		end
	else
		return false
	end
end

function Quest:StartQuest(Player)
	
	if Player:FindFirstChild("Quests") then
		if Player.Quests:FindFirstChild(Quest.QuestName) then
			return false
		else 
			local NewQuest = Instance.new("Folder") 

			NewQuest.Name = Quest.QuestName
			NewQuest.Parent = Player.Quests

			local ObjectivesToComplete = Instance.new("IntValue")
			local ObjectivesCompleted = Instance.new("IntValue")
			ObjectivesToComplete.Name = "ObjectivesToComplete"
			ObjectivesCompleted.Name = "ObjectivesCompleted"
			ObjectivesToComplete.Parent = NewQuest
			ObjectivesCompleted.Parent = NewQuest
			ObjectivesToComplete.Value = Quest.Objectives
			
			local FinishedBool = Instance.new("BoolValue")
			FinishedBool.Name = "Finished"
			FinishedBool.Parent = NewQuest
			FinishedBool.Value = false			
			
			QuestStarted(Player)
			
			return true
		end	
	else
		return false
	end
	
	
end

function Quest:CompleteQuest(Player)
	if Player:FindFirstChild("Quests") then
		if Player.Quests:FindFirstChild(Quest.QuestName) then 
			if Player.Quests:FindFirstChild(Quest.QuestName).ObjectivesCompleted.Value == Quest.Objectives then
				Player.Quests:FindFirstChild(Quest.QuestName).Finished.Value = true
				
				QuestCompleted(Player)
				
				return true 
			else
				return false
			end
		else
			return false
		end	
	else
		return false
	end
end

function Quest:GetInfo()
	return {Quest.QuestName, Quest.Objectives, Quest.Objectives}
end

return Quest
