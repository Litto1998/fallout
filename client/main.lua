------------------------------ # ------------------------------ # ------------------------------

CustomMenuVisible = false
SubMenuVisible = false
local hashes = {
    ["settings"] = GetHashKey("FE_MENU_VERSION_LANDING_MENU"),
    ["map"] = GetHashKey("FE_MENU_VERSION_MP_PAUSE")
}
------------------------------ # ------------------------------ # ------------------------------

CreateThread(function ()
    while true do
        Wait(0)

        DisableControlAction(0, 200, true)

        if IsDisabledControlJustPressed(0, 200) and not SubMenuVisible then
            OpenCustomMenu()
        end

        if IsPauseMenuActive() then
            SubMenuVisible = true
        else
            SubMenuVisible = false
        end
    end
end)

------------------------------ # ------------------------------ # ------------------------------

function OpenFrontend(style)
    ActivateFrontendMenu(hashes[style], true, -1)

    while not IsFrontendReadyForControl() do
        Wait(0)
    end

    SetFrontendActive(true)
    if style == "map" then
        PauseMenuceptionGoDeeper(0)
    end

    if style == "settings" then
        return
    end

    CreateThread(function ()
        while IsPauseMenuActive() do
            Wait(0)
            if IsDisabledControlJustPressed(0, 200) then
                SetFrontendActive(false)
            end
        end
    end)
end


function OpenEditorMenu()
    return print("no menu")
end


------------------------------ # ------------------------------ # ------------------------------