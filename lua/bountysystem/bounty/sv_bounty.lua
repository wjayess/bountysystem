util.AddNetworkString("RequestBounty")
util.AddNetworkString("AcceptedRequest")

net.Receive("RequestBounty", function(len, ply)
    local accepted = true
    
    if (accepted) then
        net.Start("AcceptedRequest")
        net.WriteInt(bosy.LoadBounty(ply), 32)
        net.Send(ply)
    end
end)

--[[
Initialize player's bounty to 0 when they spawn in the server for the very first time.
This will also create a timer which is personalized to every person on the server.
This timer is removed when they disconnect.
--]]
hook.Add("PlayerInitialSpawn", "bosyInitilizePlayer", function(ply)
    if (!bosy.PlayerExists(ply)) then
        bosy.SetBounty(ply, 0)
    end

    timer.Create(ply:SteamID64() .. "BountyDecrementTimer", bosy.Config.BountyDecrementTime, 0, function()
        bosy.SetBounty(ply, bosy.LoadBounty(ply) - bosy.Config.BountyDecrementAmount)
        print(CurTime() .. ply:Nick() .. "'s bounty is now " .. bosy.LoadBounty(ply))
    end)
end)

-- removed timer
hook.Add("PlayerDisconnected", "bosyFinalizePlayer", function(ply)
    timer.Remove(ply:SteamID64() .. "BountyDecrementTimer")
end)