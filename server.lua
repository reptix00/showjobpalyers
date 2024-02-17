lib.callback.register('getJobPlayers', function (source)
    local playerId = source
    local xPlayer = ESX.GetPlayerFromId(playerId)

    local job = xPlayer?.getJob()
    if job.name == 'unemployed' then return {}, {} end

    local xPlayers = ESX.GetExtendedPlayers('job', job)
    local playersTable = {}

    if next(xPlayers) then
        for k,xTarget in pairs(xPlayers) do
            playersTable[k] = xTarget.getName()
        end

        return playersTable, {name = job.name, label = job.label, num = #xPlayers}
    end
 

    return {}, {}
end)


lib.callback.register('getPlayerCoords', function (source, name)
    local xTarget = ESX.GetExtendedPlayers('name', name)
    if not next(xTarget) then return false end
    xTarget = xTarget[1]

    return xTarget.getCoords()
end)