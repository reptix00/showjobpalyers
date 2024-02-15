


Citizen.CreateThread (function ()
    
end)


lib.callback.register('getPlayersName', function (source)

    local playerId = source
    local xPlayer = ESX.GetPlayerFromId(playerId)


    local xPlayers = ESX.GetExtendedPlayers('job', 'police')
    local playersTable = {}


    if xPlayers == nil then
        print("No players found")
    end


    if xPlayers ~= nil then
        for k,v in pairs(xPlayers) do
            playersTable[k] = v.getName()
        end

        return playersTable
    end
 

    return "Kein Spieler gefunden"
end)


lib.callback.register('getPlayers', function (source, name)
    local xPlayers = ESX.GetExtendedPlayers("name", name)
    for k,v in pairs(xPlayers) do
            local targetCoords = xPlayers[k].getCoords()
            return targetCoords
    end
end)