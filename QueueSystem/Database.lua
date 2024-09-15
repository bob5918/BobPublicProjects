local Database = {
	
	["EXAMPLEKEY"] = { -- Change "EXAMPLEKEY" to whatever but make sure to change it on the JoinQueue part
		players = {}, -- Leave this alone
		admins = {'Player1'}, -- Add people who have access to next, remove, etc. PlayerName Only for now
		id = 0, -- Listens for JoinQueue#0 in workspace. If it was id = 2 then it would listen for JoinQueue#2 in workspace
		closed = false -- If lane is automatically open or closed at start. false = open. true = closed
	},
	
}

return Database