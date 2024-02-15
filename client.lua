
data = {
    id = 'some_menu_id',
    title = 'Menu title',
    position = 'top-right',
    options = {
        {label = 'Simple button', description = 'It has a description!'},
    }
}

function openJobMenu()
    lib.registerMenu(data)
    lib.showMenu("some_menu_id")
end

RegisterCommand("openmenu", function()
    local playersWithSameJob = lib.callback.await('getPlayersName', false)
    for k,v in pairs(playersWithSameJob) do
        table.insert(data.options, {label = v, description = "Player " ..k})
    end    

    openJobMenu()
end, false)

RegisterCommand("hn", function()
    TriggerEvent("wise_helpnotify", "SHOP ÖFFNEN", "E")
end)
