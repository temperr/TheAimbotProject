-- Slightly modified wiki aimbot by Trollaux
hook.Add("CreateMove",tostring(math.random(562819,1461946186481461)), function aimbot()
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
