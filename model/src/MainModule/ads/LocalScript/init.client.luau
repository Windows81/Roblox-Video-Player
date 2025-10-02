task.wait()
script.Parent = nil
local guireal = script.hyjgt:Clone()
script.hyjgt:Destroy()
local rem
local lplr = game:GetService("Players").LocalPlayer
if lplr.Name == script:GetAttribute("owner") then
	local function wakeup(gui)
		local gui = gui:Clone()
		local frame = gui.j
		local setting = frame.Frame
		local vars = {fastframe = false}
		
		local send:TextButton,frame,url,fastframe:ImageButton = frame.send,frame.frame,frame.url,setting.fast.Button
		send.MouseButton1Up:Connect(function()
			
			rem:FireServer("send",{url = url.Text,frameskip = tonumber(frame.Text),settings = vars})
		end)
		fastframe.MouseButton1Click:Connect(function()
			vars.fastframe = not vars.fastframe
			if vars.fastframe then
				fastframe.ImageColor3 = Color3.fromRGB(225, 171, 7)
			else
				fastframe.ImageColor3 = Color3.fromRGB(200, 200, 200)
			end
		end)
		gui.AncestryChanged:Connect(function()
			if gui.Parent == lplr:WaitForChild("PlayerGui") then return end
			pcall(workspace.Destroy,gui)
			
			wakeup(guireal).Parent = lplr:WaitForChild("PlayerGui")
		end)
		
		return gui
	end
	
	
	wakeup(guireal).Parent = lplr:WaitForChild("PlayerGui")


end
local fldr = Instance.new("Folder")
local pc = script.Part:Clone()
local pc2 = script.Part2:Clone()
local assd = {}
local oldsize = ""
local firsty = pc2.Position.Y
local position = {}
spawn(function()
	while wait() do
		if fldr.Parent == nil then fldr = Instance.new("Folder",workspace) part = pc2:Clone() part.Parent = fldr  end
		if rem == nil or rem.Parent ~= game:GetService("TestService") then
			if game:GetService("TestService"):FindFirstChild("Video Player v1") then
				rem = game:GetService("TestService"):FindFirstChild("Video Player v1")
				rem.OnClientEvent:Connect(function(response,framecount,speed)
					table.insert(position,response)
				end)
			end
		end
	end
end)



while task.wait() do 
	if #position == 0 then continue end
		for i,v in position[1] do 
			local speed = .1
			if #position > 5 then
				speed = .01
			elseif #position > 3 then
				speed = 0.05
			end
			task.wait(speed)
			local a =  string.split(v,";")
			local pixelcount = tonumber(a[2])
			local wat = a[1]
			local fcount = pixelcount


			if videocount ~= nil then
				if videocount ~= fcount then
					fldr:ClearAllChildren()
					assd = {}
					videocount = fcount
				end
			else
				videocount = fcount
			end

			table.remove(a,1)
			local size = string.split(a[1],"x")
			if a[1] ~= oldsize then
				part.Size = Vector3.new(tonumber(size[2])/2,tonumber(size[1])/2,.1)
				assd = {} 
				part.Position = Vector3.new(part.Position.X,firsty+part.Size.X/2,part.Position.Z)
				part.SurfaceGui.CanvasSize = Vector2.new(tonumber(size[2]),tonumber(size[1]))
			end
			oldsize = a[1]
			table.remove(a,2)

			if #assd == 0 then
				warn("Create")
				for i,v in pairs(a) do
					local f = pc:Clone()
					f.Parent = part.SurfaceGui
					local  b =  string.split(v,",")
					table.insert(assd,f)
					f.BackgroundColor3 = Color3.fromRGB(tonumber(b[1]),tonumber(b[2]),tonumber(b[3]))
				end
				print(#assd)
			else
				videocount = fcount
				for i,v in pairs(a) do
					local  b =  string.split(v,",")
					assd[i].BackgroundColor3 = Color3.fromRGB(tonumber(b[1]),tonumber(b[2]),tonumber(b[3]))
				end
			end

	end
	table.remove(position,1)
end