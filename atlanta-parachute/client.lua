--Context Menu--
Citizen.CreateThread(function()
    local options = {}

    for k, v in pairs(Config.Parachuteglide) do
        table.insert(options, {
            title = v[1],
            onSelect = function() Jump(v[2], v[3], v[4]) end
        })
    end

    lib.registerContext({
        id = 'kattos_parachute',
        title = Config.Title,
        options = options
    })
end)

--Command--
RegisterCommand("parachute", function()
    lib.showContext('kattos_parachute')
end)

RegisterKeyMapping('parachute', 'Open parachute Menu', 'keyboard', 'HOME')

function Jump(x, y, z)
	SetEntityCoords(PlayerPedId(), x, y, z)
	TriggerServerEvent('addParachute')
	GiveWeaponToPed(PlayerPedId(), GetHashKey('gadget_parachute'), 1, true, true)
end

