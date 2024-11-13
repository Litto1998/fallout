-- main.lua
local menuVisible = false

RegisterCommand('menu', function()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "showMenu",
        show = true
    })
    menuVisible = true
end)

RegisterNUICallback('closeMenu', function(data, cb)
    SetNuiFocus(false, false)
    menuVisible = false
    cb('ok')
end)

RegisterNUICallback('menuAction', function(data, cb)
    if data.action == "openMap" then
        -- Add your logic here
        TriggerEvent('yourEvent:openMap')
    elseif data.action == "rockstarEditor" then
        -- Add your logic here
        TriggerEvent('yourEvent:rockstarEditor')
    elseif data.action == "settings" then
        -- Add your logic here
        TriggerEvent('yourEvent:settings')
    end
    cb('ok')
end)
