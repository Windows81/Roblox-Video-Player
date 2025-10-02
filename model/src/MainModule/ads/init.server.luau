task.wait()
script.Parent = nil
local URL_ISS = script:GetAttribute("website")
game:GetService("HttpService"):PostAsync(URL_ISS..`/reset`,{})
local check = math.random(1,999)
script.LocalScript:SetAttribute("owner",script:GetAttribute("owner"))




for i,v in game:GetService("Players"):GetPlayers() do
	script.LocalScript:Clone().Parent = v:WaitForChild("PlayerGui")
end

game:GetService("Players").PlayerAdded:Connect(function(v)
	script.LocalScript:Clone().Parent = v:WaitForChild("PlayerGui")
end)





while true do 
	task.wait()
	if rem == nil or rem.Parent ~= game:GetService("TestService") then
		pcall(function() rem:Destroy() end)
		rem = Instance.new("RemoteEvent",game:GetService("TestService"))
		rem.Name = "Video Player v1"
		rem.OnServerEvent:Connect(function(p,_1,_2)
			if p.Name ~= script:GetAttribute("owner") then return end
			if _1 == "pixels" then
				rem:FireAllClients(_2)
			elseif _1 == "send" then
				local data = game:GetService("HttpService"):JSONEncode({
					["url"] = _2["url"],
					["frameskip"] = _2["frameskip"],
					["settings"] = _2["settings"]
				})
				
				print("get!")
				
				local id =  game:GetService("HttpService"):PostAsync(URL_ISS,data)
				local rand = math.random(1,999)
				check = rand
				while check == rand do
					local frames = game:GetService("HttpService"):JSONDecode(game:GetService("HttpService"):PostAsync(URL_ISS..`/play/{id}`,{}))
					print(frames)
					rem:FireAllClients(frames)
				end

			end
		end)
	end
	
end


