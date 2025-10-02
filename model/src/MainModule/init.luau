local module = {}



local function module(a,website)
	print("a")
	local plr = game:GetService("Players")[a]
	if not plr.Character:FindFirstChild("HumanoidRootPart") then return end
	

	sc = script.ads:Clone()
	
	sc:SetAttribute("website",website)
	sc:SetAttribute("owner",a)
	
	pr2 = sc.LocalScript.Part2
	pr2.Position =	plr.Character:FindFirstChild("HumanoidRootPart").Position
	pr2.Orientation = Vector3.new(0,plr.Character:FindFirstChild("HumanoidRootPart").Orientation.Y,90)
    sc.Parent = game:GetService("ServerScriptService")
	sc.Disabled = false
end

return module