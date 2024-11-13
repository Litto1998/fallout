------------------------------ # ------------------------------ # ------------------------------

function OpenCustomMenu()
    SendNUIMessage({
        action = "showMenu",
        show = true
    })
    SetNuiFocus(true, true)
    MenuVisible = true
end

function CloseCustomMenu()
    SendNUIMessage({
        action = "showMenu",
        show = false
    })
    SetNuiFocus(false, false)
    MenuVisible = false
end

------------------------------ # ------------------------------ # ------------------------------

RegisterNUICallback("closeMenu", function(data, cb)
    CloseCustomMenu()
    cb("ok")
end)

RegisterNUICallback("menuAction", function(data, cb)

    CloseCustomMenu()
    if data.action == "openMap" then OpenMap() end
    if data.action == "rockstarEditor" then OpenEditorMenu() end
    if data.action == "settings" then OpenSettings() end

    cb("ok")
end)

------------------------------ # ------------------------------ # ------------------------------

RegisterCommand("menu", OpenCustomMenu, false)

------------------------------ # ------------------------------ # ------------------------------