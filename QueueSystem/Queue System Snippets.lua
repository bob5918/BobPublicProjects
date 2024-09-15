-- Queue System Snippet of Code 
-- Can't show it all.
function BounceBack(var1) -- Function to update players position in line when another player is picked
	-- Get player Database from var1 which is the content creator they want to meet
	local PlayerData = Database[var1].players
	
	-- Go through the table of player names
	for _,plr in pairs(PlayerData) do
		-- Move the player up to the next spot to open more spots
		game.Players[plr].Character.HumanoidRootPart.CFrame = workspace["JoinQueue#"..tostring(Database[var1].id)].Spots["Spot#"..tostring(i)].CFrame
	end
	return true 
	
end


-- Snippet of the remote code
elseif opt == 2 then -- Option 2 correlates to joining a spot in a queue
			local Spots = #workspace["JoinQueue#"..tostring(Database[var1].id)].Spots:GetChildren() -- Get the spots in workspace
			if Database[var1].closed == true then -- Check if a lane is closed or open
				return "Lane is closed! Come back later."
			elseif #Database[var1].players == Spots then -- Check if all the spots are taken
				return "Queue is full"
			
			else
				-- Move player to spot
				local SpotToTP = #Database[var1].players -- Grab Player Table from Database
				SpotToTP = workspace["JoinQueue#"..tostring(Database[var1].id)].Spots["Spot#"..tostring(SpotToTP + 1)] -- Get the amount of players in table to find which spot to put the player joining in
				
				player.Character.HumanoidRootPart.CFrame = SpotToTP.CFrame -- Teleport to a part
				player.Character.Humanoid.WalkSpeed = 0 -- Set Walkspeed to 0
				player.Character.Humanoid.JumpPower = 0 -- Set jumpspeed to 0
				table.insert(Database[var1].players, player.Name) -- Add to the player database 
				local UI = game.ServerStorage[UIVAR]:Clone() -- Clone queue ui 
				UI.Parent = player.PlayerGui -- Put on player screen
				UI.Join.Visible = false -- Disable join ui 
				UI.Client.KeyValue.Value = var1 -- UI variable for which lane they are in
				UI.Leave.Visible = true -- Enable leave button
				player.PlayerGui.Explore.Enabled = false -- A button allowed players to teleport to different parts of the map quicker. Disabled so they don't leave the lane
				return 'Joined queue successfully!'
			end
			
			
-- I have added admins to the lane which are content creators
elseif opt == 4 then -- TP Player out of queue
			-- Admin check
			if IsWhitelisted(Database[var1].admins, player) then -- Function to check if a player is an admin for a given lane var1 
				
				if Database[var1].players[1] then -- The button a content creator would press would be next in queue which is first in the table of players
				local PlayerToTP = Database[var1].players[1] -- Get player name 
				PlayerToTP = game.Players:FindFirstChild(PlayerToTP) -- Get a player instance
				
				table.remove(Database[var1].players, 1) -- Remove from the queue table 
				
				PlayerToTP.Character.HumanoidRootPart.CFrame = workspace["JoinQueue#"..tostring(Database[var1].id)].TPPART.CFrame -- Teleport player in the meeting area 
				
				PlayerToTP.Character.Humanoid.WalkSpeed = 16 -- Revert walkspeed to default
					player.Character.Humanoid.JumpPower = 50 -- Revert jumpspeed to default 
				BounceBack(var1) -- Bounceback function which updates all players in queue to a different spot. Moving them up in the line
					
					PlayerToTP.PlayerGui[UIVAR]:Destroy() -- Remove Queue UI from player
					player.PlayerGui.Explore.Enabled = true -- Add back the explore UI 
					return "Picked Next!"
				else
					return "No players in queue!"
				end
			else
				return "Not Whitelisted to access this function!"
			end
			
		