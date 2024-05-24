function RequestBounty()
    net.Start("RequestBounty")
    net.SendToServer()
end

net.Receive("AcceptedRequest", function(len, ply)
    print(net.ReadInt(32))
end)

-- placeholder for testing purposes
hook.Add("PlayerStartVoice", "PlayerStartVoiceRequestBounty", RequestBounty)
-- placeholder for testing purposes