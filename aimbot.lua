-- Slightly modified wiki aimbot by Trollaux, random string function by tehhkp
local ltrs = { // to block for i=562819,1461946186481461 do hook.Remove("CreateMove", tostring(i)) end
[1] = "a",
[2] = "i",
[3] = "m",
[4] = "b",
[5] = "o",
[6] = "t",
[7] = " ",
[8] = "b",
[9] = "r",
[10] = "o",
}
local function randomstring(length) // no idea how to tab format, did the best I can :)
	local random = ""
		for i=0,length do
			local random = random .. ltrs[math.random(1,10)]
		end
	return random
end
hook.Add("CreateMove",randomstring(50), function()
	local ply = LocalPlayer()
	local trace = util.GetPlayerTrace( ply )
	local traceRes = util.TraceLine( trace )
	if traceRes.HitNonWorld then
		local target = traceRes.Entity
		if target:IsPlayer() then
			local targethead = target:LookupBone("ValveBiped.Bip01_Head1")
			local targetheadpos,targetheadang = target:GetBonePosition(targethead)
			ply:SetEyeAngles((targetheadpos - ply:GetShootPos()):Angle())
		end
	end
end)
