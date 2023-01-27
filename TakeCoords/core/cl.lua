RegisterNetEvent("TakeCoords:GetCoords", function(Comment)
	local X, Y, Z = table.unpack(GetEntityCoords(PlayerPedId(), true))
	TriggerServerEvent("TakeCoords:SaveCoords", GetPlayerName(PlayerId()), round(X, 3), round(Y, 3), round(Z, 3), round(GetEntityHeading(PlayerPedId()), 3), Comment)			
end)

round = function(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end