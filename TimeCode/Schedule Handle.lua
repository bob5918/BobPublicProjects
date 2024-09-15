-- Snippet from a class schedule board. Time zone is EST.


game["Run Service"].Stepped:Connect(function()
	local EST = os.time()-14400 -- The difference is 14400 for EST
	local t = os.date("!*t",EST)
	
	
	CheckAgainstTimes() -- Function would update the SurfaceUI
	if LoadedTime.day ~= t.day then
		-- reset
		newDay() -- Function would Update the SurfaceUI
		
	end
	
	local Minute = 0
	
	if not (t.min > 9) then
		Minute = "0"..t.min
	else
		Minute = t.min
	end
	
	if t.hour == 0 then
		CurrentTimetext.Text = "12"..":"..Minute.." AM EST"
	
	elseif t.hour < 12 then
		CurrentTimetext.Text = t.hour..":"..Minute.." AM EST"
		
	elseif t.hour == 12 then
		CurrentTimetext.Text = t.hour..":"..Minute.." PM EST"
				
	elseif t.hour > 12 then
		CurrentTimetext.Text = tostring(t.hour-12)..":"..Minute.." PM EST"
		
	end
end)


