if SAM_LOADED then return end

local sam, command, language = sam, sam.command, sam.language

command.set_category("Bounty System")

command.new("setbounty")
	:SetPermission("setbounty", "admin")

	:AddArg("player", {cant_target_self = false})
    :AddArg("number", {min = 0, max = 100, round = true})

	:Help("Set a player's bounty")

	:OnExecute(function(ply, targets, amount)
        for i = 1, #targets do
            local v = targets[i]

            bosy.SetBounty(v, amount)
        end
    end)
:End()