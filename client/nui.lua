------------------------------ # ------------------------------ # ------------------------------

function OpenCustomMenu()
    SendNUIMessage({
        action = "showMenu",
        show = true
    })
    SetNuiFocus(true, true)
    CustomMenuVisible = true
end

function CloseCustomMenu()
    SendNUIMessage({
        action = "showMenu",
        show = false
    })
    SetNuiFocus(false, false)
    CustomMenuVisible = false
end

------------------------------ # ------------------------------ # ------------------------------

RegisterNUICallback("closeMenu", function(data, cb)
    CloseCustomMenu()
    cb("ok")
end)

RegisterNUICallback("menuAction", function(data, cb)

    if data.action == "map" then OpenFrontend("map") end
    if data.action == "rockstarEditor" then OpenEditorMenu() end
    if data.action == "settings" then OpenFrontend("settings") end
    CloseCustomMenu()
    cb("ok")
end)

------------------------------ # ------------------------------ # ------------------------------

RegisterCommand("menu", OpenCustomMenu, false)

------------------------------ # ------------------------------ # ------------------------------