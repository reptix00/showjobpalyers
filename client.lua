
local function openJobMenu(options, jobData)
    local id = 'job_' ..jobData.name
    lib.registerMenu({
        id = id,
        title = jobData.label,
        position = 'top-right',
        onSelected = function (_, _, args, _)
            local playerName = args[1]
            -- do your waypoint thing or whatever
        end,
        options = options
    })
    lib.showMenu(id)
end

RegisterCommand('openmenu', function()
    local jobPlayers, jobData = lib.callback.await('getJobPlayers', false)

    local options, num = {}, 0
    for index,playerName in pairs(jobPlayers) do
        num += 1
        options[num] = {
            label = playerName,
            description = 'Player ' .. index,
            args = {playerName},
        }
    end

    openJobMenu(options, jobData)
end, false)

RegisterCommand('hn', function()
    TriggerEvent('wise_helpnotify', 'SHOP ÖFFNEN', 'E')
end)
