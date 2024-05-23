sql.Query("CREATE TABLE IF NOT EXISTS bosy_bounty (SteamID TEXT, Bounty INTEGER)")

function bosy.SaveBounty(ply, bounty)
	local plyData = sql.Query("SELECT * FROM bosy_bounty WHERE SteamID = " .. sql.SQLStr(ply:SteamID()) .. ";")

	if (plyData) then
		sql.Query("UPDATE bosy_bounty SET Bounty = " .. bounty .. " WHERE SteamID = " .. sql.SQLStr(ply:SteamID()) .. ";")
	else
		sql.Query("INSERT INTO bosy_bounty (SteamID, Bounty) VALUES(" .. sql.SQLStr(ply:SteamID()) .. ", " .. bounty .. ")")
	end
end

function bosy.LoadBounty(ply)
	local bounty = sql.QueryValue("SELECT Bounty FROM bosy_bounty WHERE SteamID = " .. sql.SQLStr(ply:SteamID()) .. ";")

	return bounty
end