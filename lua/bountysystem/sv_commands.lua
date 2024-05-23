concommand.Add("addbounty", function(ply, _, args)
    if ply.IsAdmin then
        for _, v in pairs do
            ply:setBounty(v)
        end
    end
end)