function meta:getBounty()
    bosy.LoadBounty(self)
end

Msg("your bounty is " .. LocalPlayer():getBounty())