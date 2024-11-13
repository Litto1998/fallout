------------------------------ # ------------------------------ # ------------------------------

MenuVisible = false
local pauseMenuHash = GetHashKey("FE_MENU_VERSION_MP_PAUSE")

------------------------------ # ------------------------------ # ------------------------------

CreateThread(function ()
    while true do
        Wait(0)
        if not MenuVisible then
            DisableFrontendThisFrame()
        end

        if IsControlJustPressed(0, 200) then
            OpenCustomMenu()
        end
    end
end)

------------------------------ # ------------------------------ # ------------------------------

function OpenMap()
    ActivateFrontendMenu(pauseMenuHash, true, -1)

    while GetCurrentFrontendMenuVersion() ~= pauseMenuHash do
        Wait(1)
    end

    PauseMenuceptionGoDeeper(0)
    SetFrontendActive(true)
end

------------------------------ # ------------------------------ # ------------------------------

function OpenEditorMenu()
    return print("no menu")
end

------------------------------ # ------------------------------ # ------------------------------

function OpenSettings()
    return print("no menu")
end

------------------------------ # ------------------------------ # ------------------------------