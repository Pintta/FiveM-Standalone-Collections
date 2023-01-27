RegisterServerEvent('vehdrop:askDropWeapon', function(wea)
	local x = false
	if(not x) then
		print(1)
		TriggerClientEvent("vehdrop:drop", source, wea)
	end
end)

getPlayerID = function(source)
    local identifiers = GetPlayerIdentifiers(source)
    local player = getIdentifiant(identifiers)
    return player
end

getIdentifiant = function(id)
    for _, v in ipairs(id) do
        return v
    end
end