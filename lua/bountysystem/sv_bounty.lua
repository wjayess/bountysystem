local meta = FindMetaTable("Player")


function meta:setBounty(bounty)
    bounty = tonumber(bounty)
    if not bounty then return false end
    
    bosy.SaveBounty(self, bounty)
end

util.AddNetworkString("SendBounty")

function meta:getBounty()
    bosy.LoadBounty(self)
end

hook.Add("PlayerInitialSpawn", "InitilizePlayer", function(ply)
    ply:setBounty(0)
end)