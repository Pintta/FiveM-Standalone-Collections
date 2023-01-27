local vehWeapons = {0x1D073A89, 0x83BF0278, 0x5FC3C11, 0xF9AFB48F, 0x1B06D571, 0xFE2A352C, 0x3656C8C1, 0xFD16169E}
local HasVeh = false
local HasWea = {}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if(IsPedInAnyPoliceVehicle(GetPlayerPed(-1))) then
			if(not HasVeh) then
				HasVeh = true
			end
		else
			if(HasVeh) then
				for i,k in pairs(vehWeapons) do
					if(not HasWea[i]) then
						TriggerServerEvent('vehdrop:askDropWeapon',k)
					end
				end
				HasVeh = false
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if(not IsPedInAnyVehicle(GetPlayerPed(-1))) then
			for i=1,#vehWeapons do
				if(HasPedGotWeapon(GetPlayerPed(-1), vehWeapons[i], false)==1) then
					HasWea[i] = true
				else
					HasWea[i] = false
				end
			end
		end
		Citizen.Wait(100)
	end
end)

RegisterNetEvent('vehdrop:drop', function(wea)
	RemoveWeaponFromPed(GetPlayerPed(-1), wea)
end)