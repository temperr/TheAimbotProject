--[[
    Credits:
    Original modified wiki aimbot by Trollaux
    Random string function by tehhkp modified by Trollaux
    Unload function made by tehhkp
]]--
local usingMouseKey = false
local aimkey = KEY_F
local mousekey = MOUSE_RIGHT
local hooks = {}
local ltrs = {
    [1] = "a",
    [2] = "b",
    [3] = "c",
    [4] = "d",
    [5] = "e",
    [6] = "f",
    [7] = "g",
    [8] = "h",
    [9] = "i",
    [10] = "j",
    [11] = "k",
    [12] = "l",
    [13] = "m",
    [14] = "n",
    [15] = "o",
    [16] = "p",
    [17] = "q",
    [18] = "r",
    [19] = "s",
    [20] = "t",
    [21] = "u",
    [22] = "v",
    [23] = "w",
    [24] = "x",
    [25] = "y",
    [26] = "z",
}
local function randomstring(length)
	local random = ""
		for i=0,length do
			local shouldUpper = math.random(1,2)
			if shoulderUpper == 1 then
			local random = random .. string.upper(ltrs[math.random(1,26)])
			else
			local random = random .. string.lower(ltrs[math.random(1,26)])
			end
		end
	return random
end
local function hookDatShit(HookType,Function)
	local funcname = HookType.." | "..randomstring(10)
	table.insert( hooks, HookType .. "###" .. funcname )
	return hook.Add(HookType,funcname,Function)
end
local function unload()
	for k,v in pairs(hooks) do
		local hookstuff = string.Explode("###", v)
		hook.Remove(hookstuff[1], hookstuff[2])
	end
end
hookDatShit("CreateMove", function()
	local enabled = false
	if usingMouseKey then enabled = (input.IsMouseDown(mousekey)) else enabled = (input.IsKeyDown(aimkey)) end
	if enabled then
	local ply = LocalPlayer()
	local trace = util.GetPlayerTrace( ply )
	local traceRes = util.TraceLine( trace )
	local shouldTarget = true
	if traceRes.HitNonWorld then
		local target = traceRes.Entity
		if target:IsPlayer() then
			if not shouldAttackFriends then
				if target:GetFriendStatus() == "friend" then
					shouldTarget = false	
				end
			end
			if target:Alive() and target != LocalPlayer() and shouldTarget then
			local targethead = target:LookupBone("ValveBiped.Bip01_Head1")
			local targetheadpos,targetheadang = target:GetBonePosition(targethead)
			ply:SetEyeAngles((targetheadpos - ply:GetShootPos()):Angle())
		end
	end
end
end
end)
